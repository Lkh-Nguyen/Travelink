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
                    reservation.setCheckInDate(resultSet.getDate("CheckInDate").toLocalDate());
                    reservation.setCheckOutDate(resultSet.getDate("CheckOutDate").toLocalDate());
                    reservation.setTotalPrice(resultSet.getBigDecimal("Total_Price"));
                    reservation.setPaymentMethod(resultSet.getString("Payment_Method"));
                    reservation.setCustomerID(resultSet.getInt("Customer_ID"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting reservation by ID: " + e);
        }
        return reservation;
    }

    public static List<Reservation> getReservationsByCustomerID(int customerID) {
        List<Reservation> reservations = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Reservation WHERE Customer_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, customerID);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Reservation reservation = new Reservation();
                    reservation.setReservationID(resultSet.getInt("Reservation_ID"));
                    reservation.setReservationDate(resultSet.getDate("Reservation_Date").toLocalDate());
                    reservation.setCheckInDate(resultSet.getDate("CheckInDate").toLocalDate());
                    reservation.setCheckOutDate(resultSet.getDate("CheckOutDate").toLocalDate());
                    reservation.setTotalPrice(resultSet.getBigDecimal("Total_Price"));
                    reservation.setPaymentMethod(resultSet.getString("Payment_Method"));
                    reservation.setCustomerID(resultSet.getInt("Customer_ID"));
                    reservations.add(reservation);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting reservations by customer ID: " + e);
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

        // Test getReservationsByCustomerID
        System.out.println("\n** Test getReservationsByCustomerID **");
        int testCustomerID = 2; // Replace with an existing customer ID
        List<Reservation> reservations = ReservationDB.getReservationsByCustomerID(testCustomerID);
        if (reservations.isEmpty()) {
            System.out.println("No reservations found for customer (ID: " + testCustomerID + ").");
        } else {
            System.out.println("Reservations for Customer (ID: " + testCustomerID + "):");
            for (Reservation aReservation : reservations) {
                System.out.println(aReservation);
            }
        }
    }

}
