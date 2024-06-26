/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

/**
 *
 * @author ASUS
 */
import com.travelink.Model.Bed;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BedDB implements DatabaseInfo {

    // Method to retrieve all beds
    public static List<Bed> getAllBeds() {
        List<Bed> beds = new ArrayList<>();

        try (Connection connection = DatabaseInfo.getConnect()) {
            String sql = "SELECT * FROM Bed";
            try (Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(sql)) {
                while (resultSet.next()) {
                    Bed bed = new Bed();
                    bed.setBed_ID(resultSet.getInt("Bed_ID"));
                    bed.setName(resultSet.getString("Name"));
                    bed.setDescription(resultSet.getString("Description"));
                    bed.setUrl(resultSet.getString("URL"));
                    beds.add(bed);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return beds;
    }

    // Method to retrieve a bed by ID
    public static Bed getBedByID(int bedID) {
        Bed bed = null;

        try (Connection connection = DatabaseInfo.getConnect()) {
            String sql = "SELECT * FROM Bed WHERE Bed_ID = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, bedID);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        bed = new Bed();
                        bed.setBed_ID(resultSet.getInt("Bed_ID"));
                        bed.setName(resultSet.getString("Name"));
                        bed.setDescription(resultSet.getString("Description"));
                        bed.setUrl(resultSet.getString("URL"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bed;
    }

    public static Bed getBedByRoomBedID(int roomBedID) {
        Bed bed = null;

        try (Connection connection = DatabaseInfo.getConnect()) {
            String sql = "SELECT b.* "
                    + "FROM Bed b "
                    + "JOIN Room_Bed rb ON b.Bed_ID = rb.Bed_ID "
                    + "WHERE rb.Room_Bed_ID = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, roomBedID);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        bed = new Bed();
                        bed.setBed_ID(resultSet.getInt("Bed_ID"));
                        bed.setName(resultSet.getString("Name"));
                        bed.setDescription(resultSet.getString("Description"));
                        bed.setUrl(resultSet.getString("URL"));
                        // You can add more attributes as needed
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bed;
    }

    //Get Bed By Room ID
    public static List<Bed> getBedsByRoomID(int roomID) {
        List<Bed> beds = new ArrayList<>();

        try (Connection connection = DatabaseInfo.getConnect()) {
            String sql = "SELECT b.* "
                    + "FROM Bed b "
                    + "JOIN Room_Bed rb ON b.Bed_ID = rb.Bed_ID "
                    + "WHERE rb.Room_ID = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, roomID);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        Bed bed = new Bed();
                        bed.setBed_ID(resultSet.getInt("Bed_ID"));
                        bed.setName(resultSet.getString("Name"));
                        bed.setDescription(resultSet.getString("Description"));
                        bed.setUrl(resultSet.getString("URL"));
                        beds.add(bed);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return beds;
    }

    public static void main(String[] args) {
        BedDB bedDB = new BedDB();

//        // Test getAllBed method
//        System.out.println("Testing getAllBeds method:");
//        List<Bed> allBeds = bedDB.getAllBeds();
//        if (allBeds.isEmpty()) {
//            System.out.println("No beds found in the database.");
//        } else {
//            for (Bed bed : allBeds) {
//                System.out.println(bed);
//            }
//        }
//        System.out.println();
        // Test getBedByID method
        int roomIDToSearch = 1; // Replace with the actual room ID you want to search
        System.out.println("Testing getBedsByRoomID method for Room ID: " + roomIDToSearch);
        List<Bed> bedsByRoomID = bedDB.getBedsByRoomID(roomIDToSearch);
        if (bedsByRoomID.isEmpty()) {
            System.out.println("No beds found for Room ID " + roomIDToSearch + " in the database.");
        } else {
            System.out.println("Found beds:");
            for (Bed bed : bedsByRoomID) {
                System.out.println(bed);
            }
        }
    }
}
