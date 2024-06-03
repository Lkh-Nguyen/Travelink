/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.Customer;
import com.travelink.Model.FavouriteHotel;
import com.travelink.Model.Hotel;
import com.travelink.Model.HotelImage;
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
                String query
                        = "SELECT h.* "
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

    public static boolean deleteFavouriteHotel(int hotelID, int customerID) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "DELETE FROM Favourite_Hotel WHERE Hotel_ID = ? AND Customer_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, hotelID);
                statement.setInt(2, customerID);

                int rowsAffected = statement.executeUpdate();
                return rowsAffected > 0; // Return true if a row was deleted
            }
        } catch (SQLException e) {
            System.out.println("Error deleting favourite hotel: " + e);
            return false;
        } finally {
            // Close resources to prevent memory leaks
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    System.out.println("Error closing statement: " + e);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    System.out.println("Error closing connection: " + e);
                }
            }
        }
        return false;
    }
    public static boolean addFavouriteHotel(int hotelID, int customerID) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "insert into Favourite_Hotel values (?,?)";
                statement = connection.prepareStatement(query);
                statement.setInt(1, hotelID);
                statement.setInt(2, customerID);

                int rowsAffected = statement.executeUpdate();
                return rowsAffected > 0; // Return true if a row was deleted
            }
        } catch (SQLException e) {
            System.out.println("Error add favourite hotel: " + e);
            return false;
        } finally {
            // Close resources to prevent memory leaks
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    System.out.println("Error closing statement: " + e);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    System.out.println("Error closing connection: " + e);
                }
            }
        }
        return false;
    }

    public static List<Hotel> getHotelFavourite(int customerID) {
        List<Hotel> cardFavouriteHotelS = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query
                        = "WITH RankedHotels AS ( "
                        + " SELECT  h.Hotel_ID,h.Name,h.Star,h.Address,hi.URL,ROW_NUMBER() OVER (PARTITION BY h.Hotel_ID ORDER BY (SELECT NULL)) AS rn "
                        + " FROM Favourite_Hotel fh  INNER JOIN  Hotel h ON fh.Hotel_ID = h.Hotel_ID "
                        + " INNER JOIN Hotel_Image hi ON h.Hotel_ID = hi.Hotel_ID "
                        + " WHERE fh.Customer_ID = ? "
                        + "), "
                        + " HotelRatings AS ( "
                        + " SELECT h.Hotel_ID, COUNT(fb.Rating) AS RatingCount,ROUND(AVG(CAST(fb.Rating AS FLOAT)), 1) AS Average "
                        + " FROM Hotel h  LEFT OUTER JOIN   Feedback fb ON h.Hotel_ID = fb.Hotel_ID "
                        + " GROUP BY h.Hotel_ID "
                        + ") "
                        + " SELECT   rh.Hotel_ID,   rh.Name, rh.Star, rh.Address,  rh.URL, COALESCE(hr.RatingCount, 0) AS RatingCount, COALESCE(hr.Average, 0) AS Average "
                        + " FROM  RankedHotels rh LEFT JOIN HotelRatings hr ON rh.Hotel_ID = hr.Hotel_ID "
                        + " WHERE rh.rn = 1"
                        + "ORDER BY rh.Star desc;";

                statement = connection.prepareStatement(query);
                statement.setInt(1, customerID); // Set the customer ID parameter
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Hotel cardFavouriteHotel = new Hotel(); // Assuming you have a Hotel model class
                    cardFavouriteHotel.setHotel_ID(resultSet.getInt("Hotel_ID"));
                    cardFavouriteHotel.setName(resultSet.getString("Name"));
                    cardFavouriteHotel.setStar(resultSet.getInt("Star"));
                    cardFavouriteHotel.setAddress(resultSet.getString("Address"));

                    cardFavouriteHotelS.add(cardFavouriteHotel);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting hotels by customer ID: " + e);
        }
        return cardFavouriteHotelS;
    }
    
    public static List<HotelImage> getHotelImageFavourite(int customerID) {
        List<HotelImage> cardFavouriteHotelS = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query
                        = "WITH RankedHotels AS ( "
                        + " SELECT  h.Hotel_ID,h.Name,h.Star,h.Address,hi.URL,ROW_NUMBER() OVER (PARTITION BY h.Hotel_ID ORDER BY (SELECT NULL)) AS rn "
                        + " FROM Favourite_Hotel fh  INNER JOIN  Hotel h ON fh.Hotel_ID = h.Hotel_ID "
                        + " INNER JOIN Hotel_Image hi ON h.Hotel_ID = hi.Hotel_ID "
                        + " WHERE fh.Customer_ID = ? "
                        + "), "
                        + " HotelRatings AS ( "
                        + " SELECT h.Hotel_ID, COUNT(fb.Rating) AS RatingCount,ROUND(AVG(CAST(fb.Rating AS FLOAT)), 1) AS Average "
                        + " FROM Hotel h  LEFT OUTER JOIN   Feedback fb ON h.Hotel_ID = fb.Hotel_ID "
                        + " GROUP BY h.Hotel_ID "
                        + ") "
                        + " SELECT   rh.Hotel_ID,   rh.Name, rh.Star, rh.Address,  rh.URL, COALESCE(hr.RatingCount, 0) AS RatingCount, COALESCE(hr.Average, 0) AS Average "
                        + " FROM  RankedHotels rh LEFT JOIN HotelRatings hr ON rh.Hotel_ID = hr.Hotel_ID "
                        + " WHERE rh.rn = 1"
                        + "ORDER BY rh.Star desc;";

                statement = connection.prepareStatement(query);
                statement.setInt(1, customerID); // Set the customer ID parameter
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    HotelImage cardFavouriteHotel = new HotelImage(); // Assuming you have a Hotel model class
                    cardFavouriteHotel.setUrl(resultSet.getString("URL"));

                    cardFavouriteHotelS.add(cardFavouriteHotel);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting hotels by customer ID: " + e);
        }
        return cardFavouriteHotelS;
    }
    
    public static List<Integer> getRatingCountFavourite(int customerID) {
        List<Integer> cardFavouriteHotelS = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query
                        = "WITH RankedHotels AS ( "
                        + " SELECT  h.Hotel_ID,h.Name,h.Star,h.Address,hi.URL,ROW_NUMBER() OVER (PARTITION BY h.Hotel_ID ORDER BY (SELECT NULL)) AS rn "
                        + " FROM Favourite_Hotel fh  INNER JOIN  Hotel h ON fh.Hotel_ID = h.Hotel_ID "
                        + " INNER JOIN Hotel_Image hi ON h.Hotel_ID = hi.Hotel_ID "
                        + " WHERE fh.Customer_ID = ? "
                        + "), "
                        + " HotelRatings AS ( "
                        + " SELECT h.Hotel_ID, COUNT(fb.Rating) AS RatingCount,ROUND(AVG(CAST(fb.Rating AS FLOAT)), 1) AS Average "
                        + " FROM Hotel h  LEFT OUTER JOIN   Feedback fb ON h.Hotel_ID = fb.Hotel_ID "
                        + " GROUP BY h.Hotel_ID "
                        + ") "
                        + " SELECT   rh.Hotel_ID,   rh.Name, rh.Star, rh.Address,  rh.URL, COALESCE(hr.RatingCount, 0) AS RatingCount, COALESCE(hr.Average, 0) AS Average "
                        + " FROM  RankedHotels rh LEFT JOIN HotelRatings hr ON rh.Hotel_ID = hr.Hotel_ID "
                        + " WHERE rh.rn = 1"
                        + "ORDER BY rh.Star desc;";

                statement = connection.prepareStatement(query);
                statement.setInt(1, customerID); // Set the customer ID parameter
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    int ratingCount = resultSet.getInt("RatingCount");
                    cardFavouriteHotelS.add(ratingCount);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting hotels by customer ID: " + e);
        }
        return cardFavouriteHotelS;
    }
    
    public static List<Float> getAverageFavourite(int customerID) {
        List<Float> cardFavouriteHotelS = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query
                        = "WITH RankedHotels AS ( "
                        + " SELECT  h.Hotel_ID,h.Name,h.Star,h.Address,hi.URL,ROW_NUMBER() OVER (PARTITION BY h.Hotel_ID ORDER BY (SELECT NULL)) AS rn "
                        + " FROM Favourite_Hotel fh  INNER JOIN  Hotel h ON fh.Hotel_ID = h.Hotel_ID "
                        + " INNER JOIN Hotel_Image hi ON h.Hotel_ID = hi.Hotel_ID "
                        + " WHERE fh.Customer_ID = ? "
                        + "), "
                        + " HotelRatings AS ( "
                        + " SELECT h.Hotel_ID, COUNT(fb.Rating) AS RatingCount,ROUND(AVG(CAST(fb.Rating AS FLOAT)), 1) AS Average "
                        + " FROM Hotel h  LEFT OUTER JOIN   Feedback fb ON h.Hotel_ID = fb.Hotel_ID "
                        + " GROUP BY h.Hotel_ID "
                        + ") "
                        + " SELECT   rh.Hotel_ID,   rh.Name, rh.Star, rh.Address,  rh.URL, COALESCE(hr.RatingCount, 0) AS RatingCount, COALESCE(hr.Average, 0) AS Average "
                        + " FROM  RankedHotels rh LEFT JOIN HotelRatings hr ON rh.Hotel_ID = hr.Hotel_ID "
                        + " WHERE rh.rn = 1"
                        + "ORDER BY rh.Star desc;";

                statement = connection.prepareStatement(query);
                statement.setInt(1, customerID); // Set the customer ID parameter
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    float average = resultSet.getFloat("Average");
                    cardFavouriteHotelS.add(average);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting hotels by customer ID: " + e);
        }
        return cardFavouriteHotelS;
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
    public static boolean getFavoriteHotel(int Hotel_ID,int Customer_ID) {
        List<FavouriteHotel> list = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "select *"
                        + "from Favourite_Hotel "
                        + "where Hotel_ID = ? and Customer_ID = ? ";
                statement = connection.prepareStatement(query);
                statement.setInt(1, Hotel_ID); // Set the hotel ID parameter
                statement.setInt(2, Customer_ID); // Set the hotel ID parameter
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    FavouriteHotel favouriteHotel = new FavouriteHotel(Hotel_ID, Customer_ID);
                    // Set other customer attributes from the result set (refer to your Customer model)
                    list.add(favouriteHotel);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting customers by hotel ID: " + e);
        }
        if(list.isEmpty()){
            return false;
        }
        return true;
    }

    public static void main(String[] args) throws SQLException {

        List<Integer> hotels =  getRatingCountFavourite(1);
        for(int hotel : hotels){
            System.out.println(hotel);
        }
    }

}
