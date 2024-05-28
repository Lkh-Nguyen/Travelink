/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.Hotel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class HotelDB implements DatabaseInfo {

    public static List<Hotel> getAllHotels() throws SQLException {
        List<Hotel> hotels = new ArrayList<>();
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Hotel";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(query);

                while (resultSet.next()) {
                    Hotel hotel = new Hotel();
                    hotel.setHotel_ID(resultSet.getInt("Hotel_ID"));
                    hotel.setName(resultSet.getString("Name"));
                    hotel.setEmail(resultSet.getString("Email"));
                    hotel.setPassword(resultSet.getString("Password")); // Remember to handle password securely
                    hotel.setStar(resultSet.getInt("Star"));
                    hotel.setPhoneNumber(resultSet.getString("PhoneNumber"));
                    hotel.setDescription(resultSet.getString("Description"));
                    // Convert SQL TIME to LocalTime (assuming database uses TIME datatype)
                    hotel.setCheckInTimeStart(resultSet.getTime("CheckInTimeStart").toLocalTime());
                    hotel.setCheckInTimeEnd(resultSet.getTime("CheckInTimeEnd").toLocalTime());
                    hotel.setCheckOutTimeStart(resultSet.getTime("CheckOutTimeStart").toLocalTime());
                    hotel.setCheckOutTimeEnd(resultSet.getTime("CheckOutTimeEnd").toLocalTime());
                    hotel.setAddress(resultSet.getString("Address"));
                    hotel.setWard_ID(resultSet.getInt("Ward_ID"));
                    hotels.add(hotel);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting all hotels: " + e);
        }
        return hotels;
    }

    public static Hotel getHotelByID(int id) {
        Hotel hotel = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Hotel WHERE Hotel_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, id); // Set the ID parameter
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    hotel = new Hotel();
                    hotel.setHotel_ID(resultSet.getInt("Hotel_ID"));
                    hotel.setName(resultSet.getString("Name"));
                    hotel.setEmail(resultSet.getString("Email"));
                    hotel.setPassword(resultSet.getString("Password")); // Remember to handle password securely
                    hotel.setStar(resultSet.getInt("Star"));
                    hotel.setPhoneNumber(resultSet.getString("PhoneNumber"));
                    hotel.setDescription(resultSet.getString("Description"));
                    // Convert SQL TIME to LocalTime
                    hotel.setCheckInTimeStart(resultSet.getTime("CheckInTimeStart").toLocalTime());
                    hotel.setCheckInTimeEnd(resultSet.getTime("CheckInTimeEnd").toLocalTime());
                    hotel.setCheckOutTimeStart(resultSet.getTime("CheckOutTimeStart").toLocalTime());
                    hotel.setCheckOutTimeEnd(resultSet.getTime("CheckOutTimeEnd").toLocalTime());
                    hotel.setAddress(resultSet.getString("Address"));
                    hotel.setWard_ID(resultSet.getInt("Ward_ID"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting hotel by ID: " + e);
        }
        return hotel;
    }

    public static List<Hotel> getHotelsByWardID(int wardID) {
        List<Hotel> hotels = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Hotel WHERE Ward_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, wardID); // Set the ward ID parameter
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Hotel hotel = new Hotel();
                    hotel.setHotel_ID(resultSet.getInt("Hotel_ID"));
                    hotel.setName(resultSet.getString("Name"));
                    hotel.setEmail(resultSet.getString("Email"));
                    hotel.setPassword(resultSet.getString("Password")); // Remember to handle password securely
                    hotel.setStar(resultSet.getInt("Star"));
                    hotel.setPhoneNumber(resultSet.getString("PhoneNumber"));
                    hotel.setDescription(resultSet.getString("Description"));
                    // Convert SQL TIME to LocalTime
                    hotel.setCheckInTimeStart(resultSet.getTime("CheckInTimeStart").toLocalTime());
                    hotel.setCheckInTimeEnd(resultSet.getTime("CheckInTimeEnd").toLocalTime());
                    hotel.setCheckOutTimeStart(resultSet.getTime("CheckOutTimeStart").toLocalTime());
                    hotel.setCheckOutTimeEnd(resultSet.getTime("CheckOutTimeEnd").toLocalTime());
                    hotel.setAddress(resultSet.getString("Address"));
                    hotel.setWard_ID(resultSet.getInt("Ward_ID"));
                    hotels.add(hotel);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting hotels by ward ID: " + e);
        }
        return hotels;
    }

    public static void main(String[] args) throws SQLException {

        // Test getAllHotels
        System.out.println("** Test getAllHotels **");
        List<Hotel> allHotels = HotelDB.getAllHotels();
        if (allHotels.isEmpty()) {
            System.out.println("No hotels found in the database.");
        } else {
            System.out.println("List of all hotels:");
            for (Hotel hotel : allHotels) {
                System.out.println(hotel); // Uses toString() for informative output
            }
        }

        // Test getHotelByID
        System.out.println("\n** Test getHotelByID **");
        int specificID = 3; // Replace with an existing hotel ID
        Hotel hotelByID = HotelDB.getHotelByID(specificID);
        if (hotelByID != null) {
            System.out.println("Hotel Details (ID: " + specificID + "):");
            System.out.println(hotelByID);
        } else {
            System.out.println("Hotel with ID " + specificID + " not found.");
        }

        // Test getHotelsByWardID
        System.out.println("\n** Test getHotelsByWardID **");
        int targetWardID = 6338; // Replace with an existing ward ID
        List<Hotel> hotelsInWard = HotelDB.getHotelsByWardID(targetWardID);
        if (hotelsInWard.isEmpty()) {
            System.out.println("No hotels found in ward " + targetWardID + ".");
        } else {
            System.out.println("Hotels in Ward " + targetWardID + ":");
            for (Hotel hotel : hotelsInWard) {
                System.out.println(hotel);
            }
        }
    }

}
