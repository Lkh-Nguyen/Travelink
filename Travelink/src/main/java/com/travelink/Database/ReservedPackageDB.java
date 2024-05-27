/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.ReservedPackage;
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
public class ReservedPackageDB implements DatabaseInfo {

    public static ReservedPackage getReservedPackageByReservedPackageID(int reservedPackageID) {
        ReservedPackage reservedPackage = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Reserved_Package WHERE Reserved_Package_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, reservedPackageID);
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    reservedPackage = new ReservedPackage();
                    reservedPackage.setReservedPackageID(resultSet.getInt("Reserved_Package_ID"));
                    reservedPackage.setPackageAmount(resultSet.getByte("Package_Amount"));
                    reservedPackage.setReservationID(resultSet.getInt("Reservation_ID"));
                    reservedPackage.setPackageID(resultSet.getInt("Package_ID"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting reserved package by ID: " + e);
        }
        return reservedPackage;
    }

    public static List<ReservedPackage> getReservedPackagesByReservationID(int reservationID) {
        List<ReservedPackage> reservedPackages = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Reserved_Package WHERE Reservation_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, reservationID);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    ReservedPackage reservedPackage = new ReservedPackage();
                    reservedPackage.setReservedPackageID(resultSet.getInt("Reserved_Package_ID"));
                    reservedPackage.setPackageAmount(resultSet.getByte("Package_Amount"));
                    reservedPackage.setReservationID(resultSet.getInt("Reservation_ID"));
                    reservedPackage.setPackageID(resultSet.getInt("Package_ID"));
                    reservedPackages.add(reservedPackage);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting reserved packages by reservation ID: " + e);
        }
        return reservedPackages;
    }

    public static void main(String[] args) throws SQLException {

        // Test getReservedPackageByReservedPackageID
        System.out.println("\n** Test getReservedPackageByReservedPackageID **");
        int testReservedPackageID = 1; // Replace with an existing reserved package ID
        ReservedPackage reservedPackage = ReservedPackageDB.getReservedPackageByReservedPackageID(testReservedPackageID);
        if (reservedPackage == null) {
            System.out.println("Reserved Package with ID " + testReservedPackageID + " not found.");
        } else {
            System.out.println("Details of Reserved Package (ID: " + testReservedPackageID + "):");
            System.out.println(reservedPackage); // Assuming your ReservedPackage model has a toString() method
        }

        // Test getReservedPackagesByReservationID
        System.out.println("\n** Test getReservedPackagesByReservationID **");
        int testReservationID = 2; // Replace with an existing reservation ID
        List<ReservedPackage> reservedPackages = ReservedPackageDB.getReservedPackagesByReservationID(testReservationID);
        if (reservedPackages.isEmpty()) {
            System.out.println("No reserved packages found for reservation (ID: " + testReservationID + ").");
        } else {
            System.out.println("Reserved Packages for Reservation (ID: " + testReservationID + "):");
            for (ReservedPackage aPackage : reservedPackages) {
                System.out.println(aPackage);
            }
        }
    }

}
