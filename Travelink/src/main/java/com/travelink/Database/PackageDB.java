/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.travelink.Model.Package;

/**
 *
 * @author ASUS
 */
public class PackageDB implements DatabaseInfo {

    public static Package getPackageByPackageID(int packageID) {
        Package packageInfo = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Package WHERE Package_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, packageID);
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    packageInfo = new Package();
                    packageInfo.setPackageID(resultSet.getInt("Package_ID"));
                    packageInfo.setRoomTypeID(resultSet.getInt("Room_Type_ID"));
                    packageInfo.setHotelServiceID(resultSet.getInt("Hotel_Service_ID"));
                    packageInfo.setPrice(resultSet.getBigDecimal("Price"));
                    packageInfo.setPriceStartDate(resultSet.getDate("Price_Start_Date").toLocalDate());
                    packageInfo.setPriceEndDate(resultSet.getDate("Price_End_Date").toLocalDate());
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting package by ID: " + e);
        }
        return packageInfo;
    }

    public static List<Package> getPackagesByHotelServiceID(int hotelServiceID) {
        List<Package> packages = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Package WHERE Hotel_Service_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, hotelServiceID);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Package packageInfo = new Package();
                    packageInfo.setPackageID(resultSet.getInt("Package_ID"));
                    packageInfo.setRoomTypeID(resultSet.getInt("Room_Type_ID"));
                    packageInfo.setHotelServiceID(resultSet.getInt("Hotel_Service_ID"));
                    packageInfo.setPrice(resultSet.getBigDecimal("Price"));
                    packageInfo.setPriceStartDate(resultSet.getDate("Price_Start_Date").toLocalDate());
                    packageInfo.setPriceEndDate(resultSet.getDate("Price_End_Date").toLocalDate());
                    packages.add(packageInfo);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting packages by hotel service ID: " + e);
        }
        return packages;
    }

    public static List<Package> getPackagesByRoomTypeID(int roomTypeID) {
        List<Package> packages = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Package WHERE Room_Type_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, roomTypeID);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Package packageInfo = new Package();
                    packageInfo.setPackageID(resultSet.getInt("Package_ID"));
                    packageInfo.setRoomTypeID(resultSet.getInt("Room_Type_ID"));
                    packageInfo.setHotelServiceID(resultSet.getInt("Hotel_Service_ID"));
                    packageInfo.setPrice(resultSet.getBigDecimal("Price"));
                    packageInfo.setPriceStartDate(resultSet.getDate("Price_Start_Date").toLocalDate());
                    packageInfo.setPriceEndDate(resultSet.getDate("Price_End_Date").toLocalDate());
                    packages.add(packageInfo);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting packages by room type ID: " + e);
        }
        return packages;
    }

    public static void main(String[] args) throws SQLException {

        // Test getPackageByPackageID
        System.out.println("\n** Test getPackageByPackageID **");
        int testPackageID = 2; // Replace with an existing package ID
        Package packageInfo = PackageDB.getPackageByPackageID(testPackageID);
        if (packageInfo == null) {
            System.out.println("Package with ID " + testPackageID + " not found.");
        } else {
            System.out.println("Details of Package (ID: " + testPackageID + "):");
            System.out.println(packageInfo); // Assuming your Package model has a toString() method
        }

        // Test getPackagesByHotelServiceID
        System.out.println("\n** Test getPackagesByHotelServiceID **");
        int testHotelServiceID = 1; // Replace with an existing service ID
        List<Package> packages = PackageDB.getPackagesByHotelServiceID(testHotelServiceID);
        if (packages.isEmpty()) {
            System.out.println("No packages found with service (ID: " + testHotelServiceID + ").");
        } else {
            System.out.println("Packages including Service (ID: " + testHotelServiceID + "):");
            for (Package aPackage : packages) {
                System.out.println(aPackage);
            }
        }

        // Test getPackagesByRoomTypeID
        System.out.println("\n** Test getPackagesByRoomTypeID **");
        int testRoomTypeID = 3; // Replace with an existing room type ID
        packages = PackageDB.getPackagesByRoomTypeID(testRoomTypeID);
        if (packages.isEmpty()) {
            System.out.println("No packages found for room type (ID: " + testRoomTypeID + ").");
        } else {
            System.out.println("Packages for Room Type (ID: " + testRoomTypeID + "):");
            for (Package aPackage : packages) {
                System.out.println(aPackage);
            }
        }
    }

}
