/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.ReservedRoom;
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
public class ReservedRoomDB implements DatabaseInfo {

    // Method to get reserved rooms by Reservation ID
    public static List<ReservedRoom> getReservedRoomsByReservationID(int reservationID) {
        List<ReservedRoom> reservedRooms = new ArrayList<>();

        try (Connection connection = DatabaseInfo.getConnect()) {
            String sql = "SELECT * FROM Reserved_Room WHERE Reservation_ID = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, reservationID);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        ReservedRoom reservedRoom = new ReservedRoom();
                        reservedRoom.setReserved_Room_ID(resultSet.getInt("ReservedRoom_ID"));
                        reservedRoom.setAmount(resultSet.getInt("Amount"));
                        reservedRoom.setReservation_ID(resultSet.getInt("Reservation_ID"));
                        reservedRoom.setRoom_ID(resultSet.getInt("Room_ID"));
                        reservedRooms.add(reservedRoom);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reservedRooms;
    }
    //Get reservation by RoomID
        public static List<ReservedRoom> getReservedRoomsByRoomID(int roomID) {
        List<ReservedRoom> reservedRooms = new ArrayList<>();

        try (Connection connection = DatabaseInfo.getConnect()) {
            String sql = "SELECT * FROM Reserved_Room WHERE Room_ID = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, roomID);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        ReservedRoom reservedRoom = new ReservedRoom();
                        reservedRoom.setReserved_Room_ID(resultSet.getInt("ReservedRoom_ID"));
                        reservedRoom.setAmount(resultSet.getInt("Amount"));
                        reservedRoom.setReservation_ID(resultSet.getInt("Reservation_ID"));
                        reservedRoom.setRoom_ID(resultSet.getInt("Room_ID"));
                        reservedRooms.add(reservedRoom);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reservedRooms;
    }
    
    public static void main(String[] args) {
        ReservedRoomDB reservedRoomDB = new ReservedRoomDB();
        int reservationID = 456; // Replace with the actual reservation ID you want to query
        List<ReservedRoom> reservedRooms = reservedRoomDB.getReservedRoomsByReservationID(reservationID);
        
        if (reservedRooms.isEmpty()) {
            System.out.println("No reserved rooms found for reservation ID: " + reservationID);
        } else {
            System.out.println("Reserved rooms for reservation ID " + reservationID + ":");
            for (ReservedRoom reservedRoom : reservedRooms) {
                System.out.println(reservedRoom);
            }
        }
    }    
}
