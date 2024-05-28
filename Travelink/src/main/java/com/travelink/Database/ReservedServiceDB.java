/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.ReservedService;
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
public class ReservedServiceDB implements DatabaseInfo {

    // Method to get reserved services by Reservation ID
    public List<ReservedService> getReservedServicesByReservationID(int reservationID) {
        List<ReservedService> reservedServices = new ArrayList<>();

        try (Connection connection = DatabaseInfo.getConnect()) {
            String sql = "SELECT * FROM Reserved_Service WHERE Reservation_ID = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, reservationID);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        ReservedService reservedService = new ReservedService();
                        reservedService.setReserved_Service_ID(resultSet.getInt("reserved_Service_ID"));
                        reservedService.setAmountOfDays(resultSet.getByte("amountOfDays"));
                        reservedService.setReservation_ID(resultSet.getInt("reservation_ID"));
                        reservedService.setHotel_Service_ID(resultSet.getInt("hotel_Service_ID"));
                        reservedServices.add(reservedService);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reservedServices;
    }

    public static void main(String[] args) {
        ReservedServiceDB reservedServiceDB = new ReservedServiceDB();
        int reservationID = 123; // Replace with the actual reservation ID you want to query
        List<ReservedService> reservedServices = reservedServiceDB.getReservedServicesByReservationID(reservationID);

        if (reservedServices.isEmpty()) {
            System.out.println("No reserved services found for reservation ID: " + reservationID);
        } else {
            System.out.println("Reserved services for reservation ID " + reservationID + ":");
            for (ReservedService reservedService : reservedServices) {
                System.out.println(reservedService);
            }
        }
    }

}
