/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.Account;
import com.travelink.Model.Hotel;
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
public class FavouriteHotelDB implements DatabaseInfo {

    public static List<Hotel> getHotelsByAccountID(int AccountID) {
        List<Hotel> hotels = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT h.* "
                        + "FROM Favourite_Hotel fh "
                        + "INNER JOIN Hotel h ON fh.Hotel_ID = h.Hotel_ID "
                        + "WHERE fh.Account_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, AccountID); // Set the Account ID parameter
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Hotel hotel = new Hotel(); // Assuming you have a Hotel model class
                    hotel.setHotel_ID(resultSet.getInt("Hotel_ID"));
                    // Set other hotel attributes from the result set (refer to your Hotel model)
                    hotels.add(hotel);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting hotels by Account ID: " + e);
        }
        return hotels;
    }

    public static List<Account> getAccountsByHotelID(int hotelID) {
        List<Account> Accounts = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT c.* "
                        + "FROM Favourite_Hotel fh "
                        + "INNER JOIN Account c ON fh.Account_ID = c.Account_ID "
                        + "WHERE fh.Hotel_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, hotelID); // Set the hotel ID parameter
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Account Account = new Account(); // Assuming you have a Account model class
                    Account.setAccount_ID(resultSet.getInt("Account_ID"));
                    // Set other Account attributes from the result set (refer to your Account model)
                    Accounts.add(Account);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting Accounts by hotel ID: " + e);
        }
        return Accounts;
    }

    public static void main(String[] args) throws SQLException {

        // Test getHotelsByAccountID
        System.out.println("\n** Test getHotelsByAccountID **");
        int testAccountID = 1; // Replace with an existing Account ID
        List<Hotel> hotels = FavouriteHotelDB.getHotelsByAccountID(testAccountID);
        if (hotels.isEmpty()) {
            System.out.println("Account with ID " + testAccountID + " has no favourite hotels.");
        } else {
            System.out.println("Favourite Hotels for Account (ID: " + testAccountID + "):");
            for (Hotel hotel : hotels) {
                System.out.println(hotel); // Assuming your Hotel model has a toString() method
            }
        }

        // Test getAccountsByHotelID
        System.out.println("\n** Test getAccountsByHotelID **");
        int testHotelID = 2; // Replace with an existing hotel ID
        List<Account> Accounts = FavouriteHotelDB.getAccountsByHotelID(testHotelID);
        if (Accounts.isEmpty()) {
            System.out.println("Hotel with ID " + testHotelID + " has no favourite Accounts.");
        } else {
            System.out.println("Accounts with Favourite Hotel (ID: " + testHotelID + "):");
            for (Account Account : Accounts) {
                System.out.println(Account); // Assuming your Account model has a toString() method
            }
        }
    }

}
