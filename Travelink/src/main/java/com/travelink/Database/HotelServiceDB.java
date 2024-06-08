/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.Hotel;
import com.travelink.Model.HotelService;
import com.travelink.Model.Reservation;
import com.travelink.Model.ReservedService;
import com.travelink.Model.Service;
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
public class HotelServiceDB implements DatabaseInfo {

    public static List<HotelService> getAllHotelServicesByAccountID(int accountID) {
        List<HotelService> hotelServiceList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DatabaseInfo.getConnect();
            if (conn != null) {
                String sql = "SELECT hs.Hotel_Service_ID AS Hotel_Service_ID, hs.Hotel_ID AS HS_Hotel_ID, hs.Service_ID AS HS_Service_ID, hs.Price AS HS_Price, "
                        + "h.Hotel_ID AS H_Hotel_ID, h.Name AS HotelName, h.Email AS HotelEmail, h.Star AS HotelStar, "
                        + "h.PhoneNumber AS HotelPhoneNumber, h.Description AS HotelDescription, h.CheckInTimeStart AS HotelCheckInTimeStart, "
                        + "h.CheckInTimeEnd AS HotelCheckInTimeEnd, h.CheckOutTimeStart AS HotelCheckOutTimeStart, h.CheckOutTimeEnd AS HotelCheckOutTimeEnd, "
                        + "h.Address AS HotelAddress, h.Ward_ID AS HotelWardID, "
                        + "s.Service_ID AS S_Service_ID, s.Name AS ServiceName, "
                        + "rs.Reserved_Service_ID AS RS_Reserved_Service_ID, rs.AmountOfDays AS RS_AmountOfDays, rs.Reservation_ID AS RS_Reservation_ID, rs.Hotel_Service_ID AS RS_Hotel_Service_ID, "
                        + "r.Reservation_ID AS R_Reservation_ID, r.Reservation_Date AS R_Reservation_Date, r.Number_of_guests AS R_Number_of_guests, r.CheckInDate AS R_CheckInDate, "
                        + "r.CheckOutDate AS R_CheckOutDate, r.Total_Price AS R_Total_Price, r.Payment_Method AS R_Payment_Method, r.Account_ID AS R_Account_ID, r.Status AS R_Status "
                        + "FROM Hotel_Service hs "
                        + "JOIN Hotel h ON hs.Hotel_ID = h.Hotel_ID "
                        + "JOIN Service s ON hs.Service_ID = s.Service_ID "
                        + "JOIN Reserved_Service rs ON hs.Hotel_Service_ID = rs.Hotel_Service_ID "
                        + "JOIN Reservation r ON rs.Reservation_ID = r.Reservation_ID "
                        + "WHERE r.Account_ID = ?";

                ps = conn.prepareStatement(sql);
                ps.setInt(1, accountID);
                rs = ps.executeQuery();

                while (rs.next()) {
                    HotelService hotelService = new HotelService();
                    hotelService.setHotelServiceID(rs.getInt("Hotel_Service_ID"));
                    hotelService.setHotelID(rs.getInt("HS_Hotel_ID"));
                    hotelService.setServiceID(rs.getInt("HS_Service_ID"));
                    hotelService.setPrice(rs.getInt("HS_Price"));

                    Hotel hotel = new Hotel();
                    hotel.setHotel_ID(rs.getInt("H_Hotel_ID"));
                    hotel.setName(rs.getString("HotelName"));
                    hotel.setEmail(rs.getString("HotelEmail"));
                    hotel.setStar(rs.getInt("HotelStar"));
                    hotel.setPhoneNumber(rs.getString("HotelPhoneNumber"));
                    hotel.setDescription(rs.getString("HotelDescription"));
                    hotel.setCheckInTimeStart(rs.getTime("HotelCheckInTimeStart").toLocalTime());
                    hotel.setCheckInTimeEnd(rs.getTime("HotelCheckInTimeEnd").toLocalTime());
                    hotel.setCheckOutTimeStart(rs.getTime("HotelCheckOutTimeStart").toLocalTime());
                    hotel.setCheckOutTimeEnd(rs.getTime("HotelCheckOutTimeEnd").toLocalTime());
                    hotel.setAddress(rs.getString("HotelAddress"));
                    hotel.setWard_ID(rs.getInt("HotelWardID"));

                    Service service = new Service();
                    service.setServiceID(rs.getInt("S_Service_ID"));
                    service.setName(rs.getString("ServiceName"));

                    ReservedService reservedService = new ReservedService();
                    reservedService.setReserved_Service_ID(rs.getInt("RS_Reserved_Service_ID"));
                    reservedService.setAmountOfDays(rs.getByte("RS_AmountOfDays"));
                    reservedService.setReservation_ID(rs.getInt("RS_Reservation_ID"));
                    reservedService.setHotel_Service_ID(rs.getInt("RS_Hotel_Service_ID"));

                    Reservation reservation = new Reservation();
                    reservation.setReservationID(rs.getInt("R_Reservation_ID"));
                    reservation.setReservationDate(rs.getDate("R_Reservation_Date"));
                    reservation.setNumber_of_guests(rs.getInt("R_Number_of_guests"));
                    reservation.setCheckInDate(rs.getDate("R_CheckInDate"));
                    reservation.setCheckOutDate(rs.getDate("R_CheckOutDate"));
                    reservation.setTotalPrice(rs.getBigDecimal("R_Total_Price"));
                    reservation.setPaymentMethod(rs.getString("R_Payment_Method"));
                    reservation.setStatus(rs.getString("R_Status"));
                    reservation.setAccount_ID(rs.getInt("R_Account_ID"));

                    hotelService.setHotel(hotel);
                    hotelService.setService(service);
                    hotelService.setReservedservice(reservedService);
                    hotelService.setReservation(reservation);

                    hotelServiceList.add(hotelService);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return hotelServiceList;
    }

    public static HotelService getHotelServiceByID(int hotelServiceID) {
        HotelService service = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Hotel_Service WHERE Hotel_Service_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, hotelServiceID);
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    service = new HotelService();
                    service.setHotelServiceID(resultSet.getInt("Hotel_Service_ID"));
                    service.setHotelID(resultSet.getInt("Hotel_ID"));
                    service.setServiceID(resultSet.getInt("Service_ID"));
                    service.setPrice(resultSet.getInt("Price")); // Assuming price is always stored as an integer
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting service by HotelServiceID: " + e);
        }
        return service;
    }

    public static List<Service> getServicesByHotelID(int hotelID) {
        List<Service> services = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT s.* FROM Service s INNER JOIN Hotel_Service hs ON s.Service_ID = hs.Service_ID WHERE hs.Hotel_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, hotelID);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Service service = new Service();
                    service.setServiceID(resultSet.getInt("Service_ID"));
                    service.setName(resultSet.getString("Name"));
                    services.add(service);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting services by hotel ID: " + e);
        }
        return services;
    }

    public static List<Hotel> getHotelsByServiceID(int serviceID) {
        List<Hotel> hotels = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT h.* FROM Hotel h INNER JOIN Hotel_Service hs ON h.Hotel_ID = hs.Hotel_ID WHERE hs.Service_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, serviceID);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Hotel hotel = new Hotel(); // Assuming you have a Hotel model class
                    hotel.setHotel_ID(resultSet.getInt("Hotel_ID"));
                    // Add getters and setters for other Hotel model properties
                    hotels.add(hotel);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting hotels by service ID: " + e);
        }
        return hotels;
    }

    public static void main(String[] args) throws SQLException {

//        // Test getServiceByHotelServiceID
//        System.out.println("\n** Test getServiceByHotelServiceID **");
//        int testHotelServiceID = 3; // Replace with an existing HotelService ID
//        HotelService service = HotelServiceDB.getHotelServiceByID(testHotelServiceID);
//        if (service == null) {
//            System.out.println("Hotel service with ID " + testHotelServiceID + " not found.");
//        } else {
//            System.out.println("Details of Hotel Service (ID: " + testHotelServiceID + "):");
//            System.out.println(service); // Assuming your HotelService model has a toString() method
//        }
//
//        // Test getServicesByHotelID
//        System.out.println("\n** Test getServicesByHotelID **");
//        int testHotelID = 1; // Replace with an existing hotel ID
//        List<Service> services = HotelServiceDB.getServicesByHotelID(testHotelID);
//        if (services.isEmpty()) {
//            System.out.println("No services found for hotel (ID: " + testHotelID + ").");
//        } else {
//            System.out.println("Services offered by Hotel (ID: " + testHotelID + "):");
//            for (Service service1 : services) {
//                System.out.println(service1);
//            }
//        }
//
//        // Test getHotelsByServiceID
//        System.out.println("\n** Test getHotelsByServiceID **");
//        int testServiceID = 2; // Replace with an existing service ID
//        List<Hotel> hotels = HotelServiceDB.getHotelsByServiceID(testServiceID);
//        if (hotels.isEmpty()) {
//            System.out.println("No hotels found offering service (ID: " + testServiceID + ").");
//        } else {
//            System.out.println("Hotels offering Service (ID: " + testServiceID + "):");
//            for (Hotel hotel : hotels) {
//                System.out.println("Hotel ID: " + hotel.getHotel_ID()); // Assuming your Hotel model has a getHotelID() method
//            }
//        }
//        
        //Test getAllHotelService
        int accountID = 3; // Thay đổi accountID tùy vào dữ liệu thực tế
        List<HotelService> hotelServiceList = getAllHotelServicesByAccountID(accountID);

        for (HotelService hotelService : hotelServiceList) {
            if (hotelService.getReservation().getStatus().equalsIgnoreCase("Paid")) {
                System.out.println("Hotel Service ID: " + hotelService.getHotelServiceID());
                System.out.println("Hotel Name: " + hotelService.getHotel().getName());
                System.out.println("Service Name: " + hotelService.getService().getName());
                System.out.println("Reservation Status: " + hotelService.getReservation().getStatus());
                System.out.println("Check-in Date: " + hotelService.getReservation().getCheckInDate());
                System.out.println("Check-out Date: " + hotelService.getReservation().getCheckOutDate());
                System.out.println("Total Price: " + hotelService.getReservation().getTotalPrice());
                System.out.println("-----------------------------------------");
            }
        }
    }

}
