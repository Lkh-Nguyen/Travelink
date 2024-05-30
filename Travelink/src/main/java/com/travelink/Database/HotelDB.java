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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    
    public static List<Hotel> getHotelsByProvince(String provinceName) {
        List<Hotel> hotels = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Hotel h INNER JOIN Ward w ON h.Ward_ID = w.Ward_ID INNER JOIN District d ON w.District_ID = d.District_ID INNER JOIN Province p ON d.Province_ID = p.Province_ID WHERE p.Name = ?";
                statement = connection.prepareStatement(query);
                statement.setString(1, provinceName); // Set the province name parameter
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
            System.out.println("Error getting hotels by province: " + e);
        }
        return hotels;
    }
    
    // Method to filter hotels by province
    public static List<Integer> filterHotelsByProvince(String provinceName) {
        List<Integer> hotelIds = new ArrayList<>();
        String sqlQuery = "SELECT h.Hotel_ID " +
                          "FROM Hotel h " +
                          "INNER JOIN Ward w ON h.Ward_ID = w.Ward_ID " +
                          "INNER JOIN District d ON w.District_ID = d.District_ID " +
                          "INNER JOIN Province p ON d.Province_ID = p.Province_ID " +
                          "WHERE p.Name = ?";

        try (Connection conn = DatabaseInfo.getConnect();
             PreparedStatement pstmt = conn.prepareStatement(sqlQuery)) {

            pstmt.setString(1, provinceName);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    hotelIds.add(rs.getInt("Hotel_ID"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return hotelIds;
    }
    // Method to filter reservations by some criteria
    public static List<Integer> filterReservations(/* Your criteria parameters */) {
        List<Integer> reservationIds = new ArrayList<>();
        // Add your criteria and SQL logic to filter reservations
        // For demonstration, assuming some dummy logic:
        String sqlQuery = "SELECT r.Reservation_ID FROM Reservation r WHERE /* your reservation filtering criteria */";

        try (Connection conn = DatabaseInfo.getConnect();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sqlQuery)) {

            while (rs.next()) {
                reservationIds.add(rs.getInt("Reservation_ID"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reservationIds;
    }
    
    // Method to perform the joins and get the final results
    public static List<Map <String, Object> > getFilteredResults(String provinceName) {
        List<Map<String, Object>> results = new ArrayList<>();

        // Get filtered hotel IDs
        List<Integer> filteredHotelIds = filterHotelsByProvince(provinceName);

        // Get filtered reservation IDs
        List<Integer> filteredReservationIds = filterReservations(/* Your criteria parameters */);

        if (filteredHotelIds.isEmpty() || filteredReservationIds.isEmpty()) {
            return results;
        }

        // Convert lists to comma-separated strings for the SQL IN clause
        String hotelIdsString = convertListToCommaSeparatedString(filteredHotelIds);
        String reservationIdsString = convertListToCommaSeparatedString(filteredReservationIds);

        String sqlQuery = "SELECT rr.id AS ReservedRoomID, r.id AS RoomID, h.id AS HotelID, res.id AS ReservationID " +
                          "FROM ReservedRoom rr " +
                          "INNER JOIN Room r ON rr.roomId = r.id " +
                          "INNER JOIN Hotel h ON r.hotelId = h.id " +
                          "INNER JOIN Reservation res ON rr.reservationId = res.id " +
                          "WHERE h.id IN (" + hotelIdsString + ") " +
                          "AND res.id IN (" + reservationIdsString + ")";

        try (Connection conn = DatabaseInfo.getConnect();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sqlQuery)) {

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("ReservedRoomID", rs.getInt("ReservedRoomID"));
                row.put("RoomID", rs.getInt("RoomID"));
                row.put("HotelID", rs.getInt("HotelID"));
                row.put("ReservationID", rs.getInt("ReservationID"));
                results.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return results;
    }
    
    // Utility method to convert a list of integers to a comma-separated string
    public static String convertListToCommaSeparatedString(List<Integer> list) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            sb.append(list.get(i));
            if (i < list.size() - 1) {
                sb.append(",");
            }
        }
        return sb.toString();
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
