/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.Account;
import com.travelink.Model.FavouriteHotel;
import com.travelink.Model.Hotel;
import com.travelink.View.HotelInfor;
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
    
    public static boolean deleteFavouriteHotel(int hotelID, int accountID) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "DELETE FROM Favourite_Hotel WHERE Hotel_ID = ? AND Account_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, hotelID);
                statement.setInt(2, accountID);

                int rowsAffected = statement.executeUpdate();
                return rowsAffected > 0; // Return true if a row was deleted
            }
        } catch (SQLException e) {
            System.out.println("Error deleting favourite hotel: " + e);
            return false;
        } finally {
            // Close resources to prevent memory leaks
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    System.out.println("Error closing statement: " + e);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    System.out.println("Error closing connection: " + e);
                }
            }
        }
        return false;
    }
    public static boolean addFavouriteHotel(int hotelID, int accountID) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "insert into Favourite_Hotel values (?,?)";
                statement = connection.prepareStatement(query);
                statement.setInt(1, hotelID);
                statement.setInt(2, accountID);

                int rowsAffected = statement.executeUpdate();
                return rowsAffected > 0; // Return true if a row was deleted
            }
        } catch (SQLException e) {
            System.out.println("Error add favourite hotel: " + e);
            return false;
        } finally {
            // Close resources to prevent memory leaks
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    System.out.println("Error closing statement: " + e);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    System.out.println("Error closing connection: " + e);
                }
            }
        }
        return false;
    }

    public static List<HotelInfor> getHotelFavourite(int accountID) {
        List<HotelInfor> cardFavouriteHotelS = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query
                        = "WITH RankedHotels AS ( "
                        + " SELECT  h.Hotel_ID,h.Name,h.Star,h.Address,hi.URL,ROW_NUMBER() OVER (PARTITION BY h.Hotel_ID ORDER BY (SELECT NULL)) AS rn "
                        + " FROM Favourite_Hotel fh  INNER JOIN  Hotel h ON fh.Hotel_ID = h.Hotel_ID "
                        + " INNER JOIN Hotel_Image hi ON h.Hotel_ID = hi.Hotel_ID "
                        + " WHERE fh.Account_ID = ? "
                        + "), "
                        + " HotelRatings AS ( "
                        + " SELECT h.Hotel_ID, COUNT(fb.Rating) AS RatingCount,ROUND(AVG(CAST(fb.Rating AS FLOAT)), 1) AS Average "
                        + " FROM Hotel h  LEFT OUTER JOIN   Feedback fb ON h.Hotel_ID = fb.Hotel_ID "
                        + " GROUP BY h.Hotel_ID "
                        + ") "
                        + " SELECT   rh.Hotel_ID,   rh.Name, rh.Star, rh.Address,  rh.URL, COALESCE(hr.RatingCount, 0) AS RatingCount, COALESCE(hr.Average, 0) AS Average "
                        + " FROM  RankedHotels rh LEFT JOIN HotelRatings hr ON rh.Hotel_ID = hr.Hotel_ID "
                        + " WHERE rh.rn = 1"
                        + "ORDER BY rh.Star desc;";

                statement = connection.prepareStatement(query);
                statement.setInt(1, accountID); // Set the account ID parameter
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    HotelInfor cardFavouriteHotel = new HotelInfor(); // Assuming you have a Hotel model class
                    cardFavouriteHotel.setHotel_ID(resultSet.getInt("Hotel_ID"));
                    cardFavouriteHotel.setName(resultSet.getString("Name"));
                    cardFavouriteHotel.setStar(resultSet.getInt("Star"));
                    cardFavouriteHotel.setAddress(resultSet.getString("Address"));
                    cardFavouriteHotel.setUrl(resultSet.getString("URL"));
                    cardFavouriteHotel.setRatingCount(resultSet.getInt("RatingCount"));
                    cardFavouriteHotel.setAverage(resultSet.getFloat("Average"));
                    
                    cardFavouriteHotelS.add(cardFavouriteHotel);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting hotels by account ID: " + e);
        }
        return cardFavouriteHotelS;
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
    public static boolean getFavoriteHotel(int Hotel_ID,int Account_ID) {
        List<FavouriteHotel> list = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "select *"
                        + "from Favourite_Hotel "
                        + "where Hotel_ID = ? and Account_ID = ? ";
                statement = connection.prepareStatement(query);
                statement.setInt(1, Hotel_ID); // Set the hotel ID parameter
                statement.setInt(2, Account_ID); // Set the hotel ID parameter
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    FavouriteHotel favouriteHotel = new FavouriteHotel(Hotel_ID, Account_ID);
                    // Set other account attributes from the result set (refer to your Account model)
                    list.add(favouriteHotel);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting accounts by hotel ID: " + e);
        }
        if(list.isEmpty()){
            return false;
        }
        return true;
    }
}
