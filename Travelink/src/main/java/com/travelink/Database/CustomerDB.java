/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.Customer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class CustomerDB implements DatabaseInfo {

    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
        }
        try {
            Connection con = DriverManager.getConnection(DBURL, USERDB, PASSDB);
            return con;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public static boolean insertCustomer(Customer customer) {
        Connection con = DatabaseInfo.getConnect();
        try {
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO Customer (Name, Email, Password, PhoneNumber, CMND, Gender, DateOfBirth, AvatarURL, Address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

            // Set parameters
            pstmt.setString(1, customer.getName());
            pstmt.setString(2, customer.getEmail());
            // Handle potential null password (already included)
            pstmt.setString(3, customer.getPassword() != null ? customer.getPassword() : null);
            // Handle potential null phone number
            pstmt.setString(4, customer.getPhoneNumber() != null ? customer.getPhoneNumber() : null);

            // Set nullable fields with null checks (unchanged)
            pstmt.setString(5, customer.getCmnd() != null ? customer.getCmnd() : null);
            pstmt.setString(6, Character.toString(customer.getGender() != '\u0000' ? customer.getGender() : ' ')); // handle default character for gender
            pstmt.setDate(7, customer.getDateOfBirth());
            pstmt.setString(8, customer.getAvatarURL() != null ? customer.getAvatarURL() : null);
            pstmt.setString(9, customer.getAddress() != null ? customer.getAddress() : null);

            // Execute the SQL statement
            int rowsInserted = pstmt.executeUpdate();

            // Close resources
            pstmt.close();
            con.close();

            // Return true if at least one row was inserted
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Handle database error appropriately
        } finally {
            // Close resources in a finally block
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace(); // Handle database error appropriately
            }
        }
        return false;
    }

    public static Customer getCustomer(String email) {
        Connection con = DatabaseInfo.getConnect();
        try {
            Customer customer = null;
            PreparedStatement st = con.prepareStatement("SELECT * FROM Customer WHERE Email = ?");
            st.setString(1, email);
            java.sql.ResultSet rs = st.executeQuery();

            if (rs.next()) {
                customer = new Customer();
                customer.setCustomer_ID(rs.getInt("Customer_ID"));
                customer.setEmail(rs.getString("Email"));
                customer.setPassword(rs.getString("Password"));
                customer.setName(rs.getString("Name"));
                // Handle potential null phone number
                customer.setPhoneNumber(rs.getString("PhoneNumber"));

                // Handle optional attributes with null checks (unchanged)
                String cmnd = rs.getString("CMND");
                if (cmnd != null) {
                    customer.setCmnd(cmnd);
                }

                Character gender = rs.getString("Gender") != null ? rs.getString("Gender").charAt(0) : ' ';
                customer.setGender(gender);

                java.sql.Date dateOfBirth = rs.getDate("DateOfBirth");
                if (dateOfBirth != null) {
                    customer.setDateOfBirth(dateOfBirth);
                }

                String avatarURL = rs.getString("avatarURL");
                if (avatarURL != null) {
                    customer.setAvatarURL(avatarURL);
                }

                String address = rs.getString("Address");
                if (address != null) {
                    customer.setAddress(address);
                }
            }

            return customer;
        } catch (SQLException ex) {
            // Handle exceptions appropriately (log or throw)
            ex.printStackTrace();
        } finally {
            // Close resources in a finally block
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                // Handle exceptions appropriately (log or throw)
                ex.printStackTrace();
            }
        }

        return null;
    }

    public static boolean changePassword(Customer currentCustomer, String newPassword) {
        String sql = "UPDATE Customer SET Password=? WHERE Email=?";
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DatabaseInfo.getConnect(); // Assuming CustomerDB has a getConnect method
            pstmt = con.prepareStatement(sql);

            // Set parameters for the prepared statement
            pstmt.setString(1, newPassword);
            pstmt.setString(2, currentCustomer.getEmail()); // Assuming email is the identifier for the customer

            int rowsAffected = pstmt.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;

        } finally {
            // Close resources in finally block to ensure they are always closed
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public static boolean updateAvatarCustomer(Customer currentCustomer, String avatarURL) {
        String sql = "UPDATE [Customer] SET AvatarURL = ? WHERE Email=?";
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = CustomerDB.getConnect();
            pstmt = con.prepareStatement(sql);

            // Set parameters for the prepared statement
            pstmt.setString(1, avatarURL);

            pstmt.setString(2, currentCustomer.getEmail()); // Assuming email is the unique identifier

            // Execute the SQL statement
            int rowsAffected = pstmt.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;

        } finally {
            // Close resources in finally block to ensure they are always closed
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
    


    public static Customer updateCustomer(Customer oldCustomer, Customer newCustomer) {
        Connection con = DatabaseInfo.getConnect();
        if (con == null) {
            return null;
        }

        try {
            String query = "UPDATE Customer SET "
                    + "Email = ?, Password = ?, CMND = ?, Name = ?, Gender = ?, DateOfBirth = ?, "
                    + "PhoneNumber = ?, AvatarURL = ?, Address = ? "
                    + "WHERE Customer_ID = ?";

            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, newCustomer.getEmail());
            st.setString(2, newCustomer.getPassword());
            st.setString(3, newCustomer.getCmnd());
            st.setNString(4, newCustomer.getName());
            st.setString(5, String.valueOf(newCustomer.getGender()));
            st.setDate(6, new java.sql.Date(newCustomer.getDateOfBirth().getTime()));
            st.setString(7, newCustomer.getPhoneNumber());
            st.setString(8, newCustomer.getAvatarURL());
            st.setString(9, newCustomer.getAddress());
            st.setInt(10, oldCustomer.getCustomer_ID());

            int rowsUpdated = st.executeUpdate();
            if (rowsUpdated > 0) {
                // Nếu cập nhật thành công, truy xuất lại thông tin từ cơ sở dữ liệu
                String retrieveQuery = "SELECT * FROM Customer WHERE Customer_ID = ?";
                PreparedStatement retrieveSt = con.prepareStatement(retrieveQuery);
                retrieveSt.setInt(1, oldCustomer.getCustomer_ID());
                ResultSet rs = retrieveSt.executeQuery();

                if (rs.next()) {
                    Customer updatedCustomer = new Customer();
                    updatedCustomer.setCustomer_ID(rs.getInt("Customer_ID"));
                    updatedCustomer.setEmail(rs.getString("Email"));
                    updatedCustomer.setPassword(rs.getString("Password"));
                    updatedCustomer.setCmnd(rs.getString("CMND"));
                    updatedCustomer.setName(rs.getNString("Name"));
                    updatedCustomer.setGender(rs.getString("Gender").charAt(0));
                    updatedCustomer.setDateOfBirth(rs.getDate("DateOfBirth"));
                    updatedCustomer.setPhoneNumber(rs.getString("PhoneNumber"));
                    updatedCustomer.setAvatarURL(rs.getString("AvatarURL"));
                    updatedCustomer.setAddress(rs.getString("Address"));

                    return updatedCustomer;
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return null;
    }

    public static void main(String[] args) {
        Customer c = new Customer("nguyenlkhde170387@fpt.edu.vn", "123", "nguyen", "09123");
        updateAvatarCustomer(c, "123");
    }
}