/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.District;
import com.travelink.Model.Hotel;
import com.travelink.Model.Province;
import com.travelink.Model.Ward;
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

    public static List<Hotel> getAllActiveHotels() throws SQLException {
        List<Hotel> hotels = new ArrayList<>();
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Hotel WHERE status = 'ACTIVE'";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(query);

                while (resultSet.next()) {
                    Hotel hotel = new Hotel();
                    hotel.setHotel_ID(resultSet.getInt("Hotel_ID"));
                    hotel.setName(resultSet.getString("Name"));
                    hotel.setEmail(resultSet.getString("Email"));
                    hotel.setStar(resultSet.getInt("Star"));
                    hotel.setRating(resultSet.getFloat("Rating"));
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

    public static Hotel getHotelByHotelID(int id) {
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
                    hotel.setStar(resultSet.getInt("Star"));
                    hotel.setRating(resultSet.getFloat("Rating"));
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

    public static List<Hotel> getActiveHotelsByWardID(int wardID) {
        List<Hotel> hotels = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Hotel WHERE Ward_ID = ? AND status = 'ACTIVE'";
                statement = connection.prepareStatement(query);
                statement.setInt(1, wardID); // Set the ward ID parameter
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Hotel hotel = new Hotel();
                    hotel.setHotel_ID(resultSet.getInt("Hotel_ID"));
                    hotel.setName(resultSet.getString("Name"));
                    hotel.setEmail(resultSet.getString("Email"));
                    hotel.setStar(resultSet.getInt("Star"));
                    hotel.setRating(resultSet.getFloat("Rating"));
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

    public static List<Hotel> getActiveHotelsByProvince(String provinceName) {
        List<Hotel> hotels = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Hotel h "
                        + "INNER JOIN Ward w ON h.Ward_ID = w.Ward_ID "
                        + "INNER JOIN District d ON w.District_ID = d.District_ID "
                        + "INNER JOIN Province p ON d.Province_ID = p.Province_ID "
                        + "WHERE p.Name = ? AND h.status = 'ACTIVE'";
                statement = connection.prepareStatement(query);
                statement.setString(1, provinceName); // Set the province name parameter
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Hotel hotel = new Hotel();
                    hotel.setHotel_ID(resultSet.getInt("Hotel_ID"));
                    hotel.setName(resultSet.getString("Name"));
                    hotel.setEmail(resultSet.getString("Email"));
                    hotel.setStar(resultSet.getInt("Star"));
                    hotel.setRating(resultSet.getFloat("Rating"));
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

    public static List<Hotel> filterProvince(String location) throws SQLException {
        List<Integer> wardIDList = new ArrayList<>();
        List<Integer> districtIDList = new ArrayList<>();
        List<Province> proviceList = ProvinceDB.getAllProvince();
        List<Ward> wardList = WardDB.getAllWards();
        List<Hotel> hotelList = HotelDB.getAllActiveHotels();
        List<Hotel> newHotelList = new ArrayList<>();
        int proviceId = 0;
        int districtId = 0;
        for (Province pro : proviceList) {
            if (pro.getName().equals(location)) {
                proviceId = pro.getProvince_ID();
            }
        }
        for (District district : DistrictDB.getAllDistricts()) {
            if (district.getProvince_ID() == proviceId) {
                districtId = district.getDistrict_ID();
                districtIDList.add(districtId);
            }
        }
        for (Ward ward : wardList) {
            for (Integer id : districtIDList) {
                if (ward.getDistrict_ID() == id) {
                    wardIDList.add(ward.getWard_ID());
                }
            }
        }
        for (Hotel hotel : hotelList) {
            for (Integer id : wardIDList) {
                if (hotel.getWard_ID() == id) {
                    newHotelList.add(hotel);
                }
            }
        }
        return newHotelList;
    }

    public static void main(String[] args) throws SQLException {

        // Test getAllHotels
        System.out.println("** Test getAllHotels **");
        List<Hotel> allHotels = HotelDB.getAllActiveHotels();
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
        Hotel hotelByID = HotelDB.getHotelByHotelID(specificID);
        if (hotelByID != null) {
            System.out.println("Hotel Details (ID: " + specificID + "):");
            System.out.println(hotelByID);
        } else {
            System.out.println("Hotel with ID " + specificID + " not found.");
        }

        // Test getHotelsByWardID
        System.out.println("\n** Test getHotelsByWardID **");
        int targetWardID = 6338; // Replace with an existing ward ID
        List<Hotel> hotelsInWard = HotelDB.getActiveHotelsByWardID(targetWardID);
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
