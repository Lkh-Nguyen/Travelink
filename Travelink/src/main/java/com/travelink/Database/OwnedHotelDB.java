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
public class OwnedHotelDB implements DatabaseInfo {

    public static List<Hotel> getHotelsByAccountID(int AccountID) {
        List<Hotel> hotels = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT h.* "
                        + "FROM Owned_Hotel oh "
                        + "INNER JOIN Hotel h ON oh.Hotel_ID = h.Hotel_ID "
                        + "WHERE oh.Account_ID = ?";
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
                        + "FROM Favourite_Hotel oh "
                        + "INNER JOIN Account c ON oh.Account_ID = c.Account_ID "
                        + "WHERE oh.Hotel_ID = ?";
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
}
