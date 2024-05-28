/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

/**
 *
 * @author ASUS
 */
import com.travelink.Model.RoomBed;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomBedDB implements DatabaseInfo {

    // Method to retrieve room beds by Bed ID
    public List<RoomBed> getRoomBedsByBedID(int bedID) {
        List<RoomBed> roomBeds = new ArrayList<>();

        try (Connection connection = DatabaseInfo.getConnect()) {
            String sql = "SELECT * FROM Room_Bed WHERE Bed_ID = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, bedID);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        RoomBed roomBed = new RoomBed();
                        roomBed.setRoom_Bed_ID(resultSet.getInt("Room_Bed_ID"));
                        roomBed.setAmount(resultSet.getInt("Amount"));
                        roomBed.setBed_ID(resultSet.getInt("Bed_ID"));
                        roomBed.setRoom_ID(resultSet.getInt("Room_ID"));
                        roomBeds.add(roomBed);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return roomBeds;
    }

    // Method to retrieve room beds by Room ID
    public List<RoomBed> getRoomBedsByRoomID(int roomID) {
        List<RoomBed> roomBeds = new ArrayList<>();

        try (Connection connection = DatabaseInfo.getConnect()) {
            String sql = "SELECT * FROM Room_Bed WHERE Room_ID = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, roomID);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        RoomBed roomBed = new RoomBed();
                        roomBed.setRoom_Bed_ID(resultSet.getInt("Room_Bed_ID"));
                        roomBed.setAmount(resultSet.getInt("Amount"));
                        roomBed.setBed_ID(resultSet.getInt("Bed_ID"));
                        roomBed.setRoom_ID(resultSet.getInt("Room_ID"));
                        roomBeds.add(roomBed);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return roomBeds;
    }
    
    public static void main(String[] args) {
        RoomBedDB roomBedDB = new RoomBedDB();

        // Test getRoomBedsByBedID method
        int bedIDToSearch = 1; // Replace with the actual bed ID you want to search
        List<RoomBed> roomBedsByBedID = roomBedDB.getRoomBedsByBedID(bedIDToSearch);
        System.out.println("Room Beds for Bed ID " + bedIDToSearch + ":");
        printRoomBeds(roomBedsByBedID);

        System.out.println();

        // Test getRoomBedsByRoomID method
        int roomIDToSearch = 1; // Replace with the actual room ID you want to search
        List<RoomBed> roomBedsByRoomID = roomBedDB.getRoomBedsByRoomID(roomIDToSearch);
        System.out.println("Room Beds for Room ID " + roomIDToSearch + ":");
        printRoomBeds(roomBedsByRoomID);
    }

    // Helper method to print room beds
    private static void printRoomBeds(List<RoomBed> roomBeds) {
        if (roomBeds.isEmpty()) {
            System.out.println("No room beds found.");
        } else {
            for (RoomBed roomBed : roomBeds) {
                System.out.println(roomBed);
            }
        }
    }    
}
