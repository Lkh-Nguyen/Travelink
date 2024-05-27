/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.Customer;
import com.travelink.Model.Hotel;
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
public class FavouriteHotelDB implements DatabaseInfo {

    public static List<Hotel> getHotelsByCustomerID(int customerID) {
        List<Hotel> hotels = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT h.* "
                        + "FROM Favourite_Hotel fh "
                        + "INNER JOIN Hotel h ON fh.Hotel_ID = h.Hotel_ID "
                        + "WHERE fh.Customer_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, customerID); // Set the customer ID parameter
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Hotel hotel = new Hotel(); // Assuming you have a Hotel model class
                    hotel.setHotel_ID(resultSet.getInt("Hotel_ID"));
                    // Set other hotel attributes from the result set (refer to your Hotel model)
                    hotels.add(hotel);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting hotels by customer ID: " + e);
        }
        return hotels;
    }

    public static List<Customer> getCustomersByHotelID(int hotelID) {
        List<Customer> customers = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT c.* "
                        + "FROM Favourite_Hotel fh "
                        + "INNER JOIN Customer c ON fh.Customer_ID = c.Customer_ID "
                        + "WHERE fh.Hotel_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, hotelID); // Set the hotel ID parameter
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Customer customer = new Customer(); // Assuming you have a Customer model class
                    customer.setCustomer_ID(resultSet.getInt("Customer_ID"));
                    // Set other customer attributes from the result set (refer to your Customer model)
                    customers.add(customer);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting customers by hotel ID: " + e);
        }
        return customers;
    }

    public static void main(String[] args) throws SQLException {

        // Test getHotelsByCustomerID
        System.out.println("\n** Test getHotelsByCustomerID **");
        int testCustomerID = 1; // Replace with an existing customer ID
        List<Hotel> hotels = FavouriteHotelDB.getHotelsByCustomerID(testCustomerID);
        if (hotels.isEmpty()) {
            System.out.println("Customer with ID " + testCustomerID + " has no favourite hotels.");
        } else {
            System.out.println("Favourite Hotels for Customer (ID: " + testCustomerID + "):");
            for (Hotel hotel : hotels) {
                System.out.println(hotel); // Assuming your Hotel model has a toString() method
            }
        }

        // Test getCustomersByHotelID
        System.out.println("\n** Test getCustomersByHotelID **");
        int testHotelID = 2; // Replace with an existing hotel ID
        List<Customer> customers = FavouriteHotelDB.getCustomersByHotelID(testHotelID);
        if (customers.isEmpty()) {
            System.out.println("Hotel with ID " + testHotelID + " has no favourite customers.");
        } else {
            System.out.println("Customers with Favourite Hotel (ID: " + testHotelID + "):");
            for (Customer customer : customers) {
                System.out.println(customer); // Assuming your Customer model has a toString() method
            }
        }
    }

}
