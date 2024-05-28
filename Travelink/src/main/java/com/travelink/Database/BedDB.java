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
    public List<Bed> getAllBeds() {
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
    public Bed getBedByID(int bedID) {
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

    public static void main(String[] args) {
        BedDB bedDB = new BedDB();

        // Test getAllBed method
        System.out.println("Testing getAllBeds method:");
        List<Bed> allBeds = bedDB.getAllBeds();
        if (allBeds.isEmpty()) {
            System.out.println("No beds found in the database.");
        } else {
            for (Bed bed : allBeds) {
                System.out.println(bed);
            }
        }
        System.out.println();

        // Test getBedByID method
        int bedIDToSearch = 1; // Replace with the actual bed ID you want to search
        System.out.println("Testing getBedByID method for Bed ID: " + bedIDToSearch);
        Bed bedByID = bedDB.getBedByID(bedIDToSearch);
        if (bedByID == null) {
            System.out.println("Bed with ID " + bedIDToSearch + " not found in the database.");
        } else {
            System.out.println("Found bed:");
            System.out.println(bedByID);
        }
    }
}
