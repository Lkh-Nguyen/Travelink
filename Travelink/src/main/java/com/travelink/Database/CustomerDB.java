/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class CustomerDB implements DatabaseInfo {

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

    public static void main(String[] args) {
Customer c = getCustomer("congminh23092004@gmail.com");
        changePassword(c, "2345");
        System.out.println(c);
    }
}