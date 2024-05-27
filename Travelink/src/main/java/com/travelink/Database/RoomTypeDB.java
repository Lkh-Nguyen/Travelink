/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.RoomType;
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
public class RoomTypeDB implements DatabaseInfo {

    public static List<RoomType> getAllRoomTypes() {
        List<RoomType> roomTypes = new ArrayList<>();
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Room_Type";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(query);

                while (resultSet.next()) {
                    RoomType roomType = new RoomType();
                    roomType.setRoomTypeID(resultSet.getInt("Room_Type_ID"));
                    roomType.setName(resultSet.getString("Name"));
                    roomType.setRoomDescription(resultSet.getString("Room_Description"));
                    roomType.setCapacity(resultSet.getInt("Capacity"));
                    roomType.setTotalRooms(resultSet.getInt("Total_Rooms"));
                    roomType.setHotelID(resultSet.getInt("Hotel_ID"));
                    roomTypes.add(roomType);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting all room types: " + e);
        }
        return roomTypes;
    }

    public static RoomType getRoomTypeByID(int id) {
        RoomType roomType = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Room_Type WHERE Room_Type_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, id); // Set the ID parameter
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    roomType = new RoomType();
                    roomType.setRoomTypeID(resultSet.getInt("Room_Type_ID"));
                    roomType.setName(resultSet.getString("Name"));
                    roomType.setRoomDescription(resultSet.getString("Room_Description"));
                    roomType.setCapacity(resultSet.getInt("Capacity"));
                    roomType.setTotalRooms(resultSet.getInt("Total_Rooms"));
                    roomType.setHotelID(resultSet.getInt("Hotel_ID"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting room type by ID: " + e);
        }
        return roomType;
    }

    public static List<RoomType> getRoomTypesByHotelID(int hotelID) {
        List<RoomType> roomTypes = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Room_Type WHERE Hotel_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, hotelID); // Set the hotel ID parameter
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    RoomType roomType = new RoomType();
                    roomType.setRoomTypeID(resultSet.getInt("Room_Type_ID"));
                    roomType.setName(resultSet.getString("Name"));
                    roomType.setRoomDescription(resultSet.getString("Room_Description"));
                    roomType.setCapacity(resultSet.getInt("Capacity"));
                    roomType.setTotalRooms(resultSet.getInt("Total_Rooms"));
                    roomType.setHotelID(resultSet.getInt("Hotel_ID"));
                    roomTypes.add(roomType); // Add the retrieved room type to the list
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting room types by hotel ID: " + e);
        }
        return roomTypes;
    }

    public static void main(String[] args) throws SQLException {

        // Test getAllRoomTypes
        System.out.println("** Test getAllRoomTypes **");
        List<RoomType> allRoomTypes = RoomTypeDB.getAllRoomTypes();
        if (allRoomTypes.isEmpty()) {
            System.out.println("No room types found in the database.");
        } else {
            System.out.println("List of all room types:");
            for (RoomType roomType : allRoomTypes) {
                System.out.println(roomType); // Uses toString() for informative output
            }
        }

        // Test getRoomTypeByID
        System.out.println("\n** Test getRoomTypeByID **");
        int specificID = 3; // Replace with an existing room type ID
        RoomType roomTypeByID = RoomTypeDB.getRoomTypeByID(specificID);
        if (roomTypeByID != null) {
            System.out.println("Room Type Details (ID: " + specificID + "):");
            System.out.println(roomTypeByID);
        } else {
            System.out.println("Room type with ID " + specificID + " not found.");
        }

        // Test getRoomTypesByHotelID
        System.out.println("\n** Test getRoomTypesByHotelID **");
        int targetHotelID = 1; // Replace with an existing hotel ID
        List<RoomType> hotelRoomTypes = RoomTypeDB.getRoomTypesByHotelID(targetHotelID);
        if (hotelRoomTypes.isEmpty()) {
            System.out.println("No room types found for hotel with ID " + targetHotelID + ".");
        } else {
            System.out.println("Room Types for Hotel (ID: " + targetHotelID + "):");
            for (RoomType roomType : hotelRoomTypes) {
                System.out.println(roomType);
            }
        }
    }

}
