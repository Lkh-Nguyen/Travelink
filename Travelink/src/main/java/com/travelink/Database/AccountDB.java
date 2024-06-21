/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class AccountDB {

    public static boolean insertAccount(Account Account) {
        Connection con = DatabaseInfo.getConnect();
        try {
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO Account (Name, Email, Password, PhoneNumber, CMND, Gender, DateOfBirth, AvatarURL, Address, Role) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            // Set parameters
            pstmt.setString(1, Account.getName());
            pstmt.setString(2, Account.getEmail());
            // Handle potential null password (already included)
            pstmt.setString(3, Account.getPassword() != null ? Account.getPassword() : null);
            // Handle potential null phone number
            pstmt.setString(4, Account.getPhoneNumber() != null ? Account.getPhoneNumber() : null);

            // Set nullable fields with null checks (unchanged)
            pstmt.setString(5, Account.getCmnd() != null ? Account.getCmnd() : null);
            pstmt.setString(6, Character.toString(Account.getGender() != '\u0000' ? Account.getGender() : ' ')); // handle default character for gender
            pstmt.setDate(7, Account.getDateOfBirth());
            pstmt.setString(8, Account.getAvatarURL() != null ? Account.getAvatarURL() : null);
            pstmt.setString(9, Account.getAddress() != null ? Account.getAddress() : null);
            pstmt.setInt(10, Account.getRole());
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

    public static Account getAccount(String email) {
        Connection con = DatabaseInfo.getConnect();
        try {
            Account Account = null;
            PreparedStatement st = con.prepareStatement("SELECT * FROM Account WHERE Email = ?");
            st.setString(1, email);
            java.sql.ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Account = new Account();
                Account.setAccount_ID(rs.getInt("Account_ID"));
                Account.setEmail(rs.getString("Email"));
                Account.setPassword(rs.getString("Password"));
                Account.setName(rs.getString("Name"));
                Account.setRole(rs.getInt("Role"));
                // Handle potential null phone number
                Account.setPhoneNumber(rs.getString("PhoneNumber"));

                // Handle optional attributes with null checks (unchanged)
                String cmnd = rs.getString("CMND");
                if (cmnd != null) {
                    Account.setCmnd(cmnd);
                }

                Character gender = rs.getString("Gender") != null ? rs.getString("Gender").charAt(0) : ' ';
                Account.setGender(gender);

                java.sql.Date dateOfBirth = rs.getDate("DateOfBirth");
                if (dateOfBirth != null) {
                    Account.setDateOfBirth(dateOfBirth);
                } else {
                    Account.setDateOfBirth(null);
                }

                String avatarURL = rs.getString("avatarURL");
                if (avatarURL != null) {
                    Account.setAvatarURL(avatarURL);
                }

                String address = rs.getString("Address");
                if (address != null) {
                    Account.setAddress(address);
                }

                int role = rs.getInt("Role");
                Account.setRole(role);
            }

            return Account;
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

    public static boolean changePassword(Account currentAccount, String newPassword) {
        String sql = "UPDATE Account SET Password=? WHERE Email=?";
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DatabaseInfo.getConnect(); // Assuming AccountDB has a getConnect method
            pstmt = con.prepareStatement(sql);

            // Set parameters for the prepared statement
            pstmt.setString(1, newPassword);
            pstmt.setString(2, currentAccount.getEmail()); // Assuming email is the identifier for the Account

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

    public static boolean updateAvatarAccount(Account currentAccount, String avatarURL) {
        String sql = "UPDATE [Account] SET AvatarURL = ? WHERE Email=?";
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DatabaseInfo.getConnect();
            pstmt = con.prepareStatement(sql);

            // Set parameters for the prepared statement
            pstmt.setString(1, avatarURL);

            pstmt.setString(2, currentAccount.getEmail()); // Assuming email is the unique identifier

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

    public static Account updateAccount(Account oldAccount, Account newAccount) {
        Connection con = DatabaseInfo.getConnect();
        if (con == null) {
            return null;
        }

        try {
            String query = "UPDATE Account SET "
                    + "Email = ?, Password = ?, CMND = ?, Name = ?, Gender = ?, DateOfBirth = ?, "
                    + "PhoneNumber = ?, AvatarURL = ?, Address = ? "
                    + "WHERE Account_ID = ?";

            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, newAccount.getEmail());
            st.setString(2, newAccount.getPassword());
            st.setString(3, newAccount.getCmnd());
            st.setNString(4, newAccount.getName());
            st.setString(5, String.valueOf(newAccount.getGender()));
            if (newAccount.getDateOfBirth() == null) {
                st.setDate(6, null);
            } else {
                st.setDate(6, new java.sql.Date(newAccount.getDateOfBirth().getTime()));
            }

            st.setString(7, newAccount.getPhoneNumber());
            st.setString(8, newAccount.getAvatarURL());
            st.setString(9, newAccount.getAddress());
            st.setInt(10, oldAccount.getAccount_ID());

            int rowsUpdated = st.executeUpdate();
            if (rowsUpdated > 0) {
                // Nếu cập nhật thành công, truy xuất lại thông tin từ cơ sở dữ liệu
                String retrieveQuery = "SELECT * FROM Account WHERE Account_ID = ?";
                PreparedStatement retrieveSt = con.prepareStatement(retrieveQuery);
                retrieveSt.setInt(1, oldAccount.getAccount_ID());
                ResultSet rs = retrieveSt.executeQuery();

                if (rs.next()) {
                    Account updatedAccount = new Account();
                    updatedAccount.setAccount_ID(rs.getInt("Account_ID"));
                    updatedAccount.setEmail(rs.getString("Email"));
                    updatedAccount.setPassword(rs.getString("Password"));
                    updatedAccount.setCmnd(rs.getString("CMND"));
                    updatedAccount.setName(rs.getNString("Name"));
                    updatedAccount.setGender(rs.getString("Gender").charAt(0));
                    updatedAccount.setDateOfBirth(rs.getDate("DateOfBirth"));
                    updatedAccount.setPhoneNumber(rs.getString("PhoneNumber"));
                    updatedAccount.setAvatarURL(rs.getString("AvatarURL"));
                    updatedAccount.setAddress(rs.getString("Address"));
                    updatedAccount.setRole(rs.getInt("Role"));
                    return updatedAccount;
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
        Account account = AccountDB.getAccount("example@email.com");
        System.out.println(account.toString());
    }
}
