/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.Reservation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class ReservationDB implements DatabaseInfo {

    public static Reservation getReservationByReservationID(int reservationID) {
        Reservation reservation = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Reservation WHERE Reservation_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, reservationID);
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    reservation = new Reservation();
                    reservation.setReservationID(resultSet.getInt("Reservation_ID"));
                    reservation.setReservationDate(resultSet.getDate("Reservation_Date").toLocalDate());
                    reservation.setNumber_of_guests(resultSet.getInt("number_of_guests"));
                    reservation.setCheckInDate(resultSet.getDate("CheckInDate").toLocalDate());
                    reservation.setCheckOutDate(resultSet.getDate("CheckOutDate").toLocalDate());
                    reservation.setTotalPrice(resultSet.getBigDecimal("Total_Price"));
                    reservation.setPaymentMethod(resultSet.getString("Payment_Method"));
                    reservation.setStatus(resultSet.getString("Status"));
                    reservation.setAccount_ID(resultSet.getInt("Account_ID"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting reservation by ID: " + e);
        }
        return reservation;
    }

    public static List<Reservation> getReservationsByAccountID(int AccountID) {
        List<Reservation> reservations = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Reservation WHERE Account_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, AccountID);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Reservation reservation = new Reservation();
                    reservation.setReservationID(resultSet.getInt("Reservation_ID"));
                    reservation.setReservationDate(resultSet.getDate("Reservation_Date").toLocalDate());
                    reservation.setNumber_of_guests(resultSet.getInt("number_of_guests"));
                    reservation.setCheckInDate(resultSet.getDate("CheckInDate").toLocalDate());
                    reservation.setCheckOutDate(resultSet.getDate("CheckOutDate").toLocalDate());
                    reservation.setTotalPrice(resultSet.getBigDecimal("Total_Price"));
                    reservation.setPaymentMethod(resultSet.getString("Payment_Method"));
                    reservation.setStatus(resultSet.getString("Status"));
                    reservation.setAccount_ID(resultSet.getInt("Account_ID"));
                    reservations.add(reservation);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting reservations by Account ID: " + e);
        }
        return reservations;
    }

    public static void main(String[] args){

        // Test getReservationByReservationID
        System.out.println("\n** Test getReservationByReservationID **");
        int testReservationID = 1; // Replace with an existing reservation ID
        Reservation reservation = ReservationDB.getReservationByReservationID(testReservationID);
        if (reservation == null) {
            System.out.println("Reservation with ID " + testReservationID + " not found.");
        } else {
            System.out.println("Details of Reservation (ID: " + testReservationID + "):");
            System.out.println(reservation); // Assuming your Reservation model has a toString() method
        }

        // Test getReservationsByAccountID
        System.out.println("\n** Test getReservationsByAccountID **");
        int testAccountID = 2; // Replace with an existing Account ID
        List<Reservation> reservations = ReservationDB.getReservationsByAccountID(testAccountID);
        if (reservations.isEmpty()) {
            System.out.println("No reservations found for Account (ID: " + testAccountID + ").");
        } else {
            System.out.println("Reservations for Account (ID: " + testAccountID + "):");
            for (Reservation aReservation : reservations) {
                System.out.println(aReservation);
            }
        }
    }

}
