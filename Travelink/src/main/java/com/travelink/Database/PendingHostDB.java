/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

/**
 *
 * @author ASUS
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.travelink.Model.PendingHost;

/**
 *
 * @author ASUS
 */
public class PendingHostDB {

    public static boolean insertPendingHost(PendingHost pendingHost) {
        Connection con = DatabaseInfo.getConnect();
        try {
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO Pending_Host (Email, Password, CMND, Name, Gender, DateOfBirth, PhoneNumber, AvatarURL, Address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

            // Set parameters
            pstmt.setString(1, pendingHost.getEmail());
            pstmt.setString(2, pendingHost.getPassword() != null ? pendingHost.getPassword() : null);
            pstmt.setString(3, pendingHost.getCmnd() != null ? pendingHost.getCmnd() : null);
            pstmt.setNString(4, pendingHost.getName());
            pstmt.setString(5, Character.toString(pendingHost.getGender() != '\u0000' ? pendingHost.getGender() : ' ')); // handle default character for gender
            pstmt.setDate(6, pendingHost.getDateOfBirth());
            pstmt.setString(7, pendingHost.getPhoneNumber() != null ? pendingHost.getPhoneNumber() : null);
            pstmt.setString(8, pendingHost.getAvatarURL() != null ? pendingHost.getAvatarURL() : null);
            pstmt.setNString(9, pendingHost.getAddress());

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

    // You can add similar methods for other functionalities like getPendingHost, updatePendingHost, etc.
    // Adapt the method logic and SQL queries based on the PendingHost table schema and your requirements.
    public static void main(String[] args) {
        // Example usage (assuming PendingHost model is defined)
        PendingHost pendingHost = new PendingHost();
        pendingHost.setEmail("example@email.com");
        pendingHost.setPassword("password");
        pendingHost.setName("John Doe");
        // Set other fields as needed

        if (PendingHostDB.insertPendingHost(pendingHost)) {
            System.out.println("Pending host inserted successfully!");
        } else {
            System.out.println("Failed to insert pending host.");
        }
    }
}
