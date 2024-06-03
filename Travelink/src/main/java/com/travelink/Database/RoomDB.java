/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.Room;
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
public class RoomDB implements DatabaseInfo {

    public static List<Room> getAllRooms() {
        List<Room> Rooms = new ArrayList<>();
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Room";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(query);

                while (resultSet.next()) {
                    Room Room = new Room();
                    Room.setRoom_ID(resultSet.getInt("Room_ID"));
                    Room.setName(resultSet.getString("Name"));
                    Room.setRoomDescription(resultSet.getString("Room_Description"));
                    Room.setCapacity(resultSet.getInt("Capacity"));
                    Room.setTotalRooms(resultSet.getInt("Total_Rooms"));
                    Room.setPrice(resultSet.getInt("Price"));
                    Room.setHotel_ID(resultSet.getInt("Hotel_ID"));
                    Rooms.add(Room);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting all room types: " + e);
        }
        return Rooms;
    }

    public static Room getRoomByID(int id) {
        Room Room = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Room WHERE Room_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, id); // Set the ID parameter
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    Room = new Room();
                    Room.setRoom_ID(resultSet.getInt("Room_ID"));
                    Room.setName(resultSet.getString("Name"));
                    Room.setRoomDescription(resultSet.getString("Room_Description"));
                    Room.setCapacity(resultSet.getInt("Capacity"));
                    Room.setTotalRooms(resultSet.getInt("Total_Rooms"));
                    Room.setPrice(resultSet.getInt("Price"));
                    Room.setHotel_ID(resultSet.getInt("Hotel_ID"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting room type by ID: " + e);
        }
        return Room;
    }

    public static List<Room> getRoomsByHotel_ID(int hotel_ID) {
        List<Room> Rooms = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Room WHERE Hotel_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, hotel_ID); // Set the hotel ID parameter
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Room Room = new Room();
                    Room.setRoom_ID(resultSet.getInt("Room_ID"));
                    Room.setName(resultSet.getString("Name"));
                    Room.setRoomDescription(resultSet.getString("Room_Description"));
                    Room.setCapacity(resultSet.getInt("Capacity"));
                    Room.setTotalRooms(resultSet.getInt("Total_Rooms"));
                    Room.setPrice(resultSet.getInt("Price"));
                    Room.setHotel_ID(resultSet.getInt("Hotel_ID"));
                    Rooms.add(Room); // Add the retrieved room type to the list
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting room types by hotel ID: " + e);
        }
        return Rooms;
    }

    public static void main(String[] args) throws SQLException {

        // Test getAllRooms
        System.out.println("** Test getAllRooms **");
        List<Room> allRooms = RoomDB.getAllRooms();
        if (allRooms.isEmpty()) {
            System.out.println("No room types found in the database.");
        } else {
            System.out.println("List of all room types:");
            for (Room Room : allRooms) {
                System.out.println(Room); // Uses toString() for informative output
            }
        }

        // Test getRoomByID
        System.out.println("\n** Test getRoomByID **");
        int specificID = 3; // Replace with an existing room type ID
        Room RoomByID = RoomDB.getRoomByID(specificID);
        if (RoomByID != null) {
            System.out.println("Room Type Details (ID: " + specificID + "):");
            System.out.println(RoomByID);
        } else {
            System.out.println("Room type with ID " + specificID + " not found.");
        }

        // Test getRoomsByHotel_ID
        System.out.println("\n** Test getRoomsByHotel_ID **");
        int targetHotel_ID = 1; // Replace with an existing hotel ID
        List<Room> hotelRooms = RoomDB.getRoomsByHotel_ID(targetHotel_ID);
        if (hotelRooms.isEmpty()) {
            System.out.println("No room types found for hotel with ID " + targetHotel_ID + ".");
        } else {
            System.out.println("Room Types for Hotel (ID: " + targetHotel_ID + "):");
            for (Room Room : hotelRooms) {
                System.out.println(Room);
            }
        }
        
        
        
       
    }

}
