/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.PendingCancelReservation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 *
 * @author ASUS
 */
public class PendingCancelReservationDB implements DatabaseInfo {

    public static PendingCancelReservation getPendingCancelReservationByReservationID(int reservationID) {
        PendingCancelReservation pendingCancelReservation = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Pending_Cancel_Reservation WHERE Reservation_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, reservationID);
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    pendingCancelReservation = new PendingCancelReservation();
                    pendingCancelReservation.setPendingCancelReservationID(resultSet.getInt("Pending_Cancel_Reservation_ID"));

                    java.sql.Timestamp timestamp = resultSet.getTimestamp("Cancel_Date");
                    LocalDateTime localDateTime = timestamp.toLocalDateTime();
                    pendingCancelReservation.setCancelDate(localDateTime);

                    pendingCancelReservation.setReservationID(resultSet.getInt("Reservation_ID"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting pending cancellation by reservation ID: " + e);
        }
        return pendingCancelReservation;
    }

    public static int insertPendingCancelReservation(PendingCancelReservation pendingCancelReservation) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "INSERT INTO Pending_Cancel_Reservation (Cancel_Date, Reservation_ID) VALUES (?, ?)";
                statement = connection.prepareStatement(query);
                statement.setTimestamp(1, Timestamp.valueOf(pendingCancelReservation.getCancelDate()));
                statement.setInt(2, pendingCancelReservation.getReservationID());

                int rowsAffected = statement.executeUpdate();
                if (rowsAffected > 0) {
                    System.out.println("Pending cancellation record inserted successfully.");
                    return rowsAffected; // Return the number of rows inserted
                } else {
                    System.out.println("Error inserting pending cancellation record.");
                    return 0; // Return 0 if no rows were inserted
                }
            }
        } catch (SQLException e) {
            System.out.println("Error inserting pending cancellation record: " + e);
        } finally {
            // Close resources (connection, statement, etc.) here if needed
        }

        return 0; // Return 0 if an exception occurred
    }

    public static void main(String[] args) throws SQLException {

        // Test getPendingCancelReservationByReservationID
        System.out.println("\n** Test getPendingCancelReservationByReservationID **");
        int testReservationID = 3; // Replace with an existing reservation ID with a pending cancellation request
        PendingCancelReservation pendingCancelReservation = PendingCancelReservationDB.getPendingCancelReservationByReservationID(testReservationID);
        if (pendingCancelReservation == null) {
            System.out.println("No pending cancellation request found for reservation (ID: " + testReservationID + ").");
        } else {
            System.out.println("Details of Pending Cancellation Request for Reservation (ID: " + testReservationID + "):");
            System.out.println(pendingCancelReservation); // Assuming your PendingCancelReservation model has a toString() method
        }
    }

}
