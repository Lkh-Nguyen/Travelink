/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.Reservation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class ReservationDB implements DatabaseInfo {

    public static Reservation getReservationByReservationID(int reservationID) {
        Reservation reservation = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Reservation WHERE Reservation_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, reservationID);
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    reservation = new Reservation();
                    reservation.setReservationID(resultSet.getInt("Reservation_ID"));
                    reservation.setReservationDate(resultSet.getTimestamp("Reservation_Date").toLocalDateTime());
                    reservation.setNumber_of_guests(resultSet.getInt("number_of_guests"));
                    reservation.setCheckInDate(resultSet.getDate("CheckInDate"));
                    reservation.setCheckOutDate(resultSet.getDate("CheckOutDate"));
                    reservation.setTotalPrice(resultSet.getInt("Total_Price"));
                    reservation.setPaymentMethod(resultSet.getString("Payment_Method"));
                    reservation.setStatus(resultSet.getString("Status"));
                    reservation.setAccount_ID(resultSet.getInt("Account_ID"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting reservation by ID: " + e);
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e);
            }
        }

        return reservation;
    }

    public static List<Reservation> getReservationsByAccountID(int AccountID) {
        List<Reservation> reservations = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Reservation WHERE Account_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, AccountID);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Reservation reservation = new Reservation();
                    reservation.setReservationID(resultSet.getInt("Reservation_ID"));
                    reservation.setReservationDate(resultSet.getTimestamp("Reservation_Date").toLocalDateTime());

                    reservation.setNumber_of_guests(resultSet.getInt("number_of_guests"));
                    reservation.setCheckInDate(resultSet.getDate("CheckInDate"));
                    reservation.setCheckOutDate(resultSet.getDate("CheckOutDate"));
                    reservation.setTotalPrice(resultSet.getInt("Total_Price"));
                    reservation.setPaymentMethod(resultSet.getString("Payment_Method"));
                    reservation.setStatus(resultSet.getString("Status"));
                    reservation.setAccount_ID(resultSet.getInt("Account_ID"));
                    reservations.add(reservation);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting reservations by Account ID: " + e);
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e);
            }
        }

        return reservations;
    }


    public static List<Reservation> getAllReservations() {
        List<Reservation> reservations = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Reservation";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Reservation reservation = new Reservation();
                    reservation.setReservationID(resultSet.getInt("Reservation_ID"));
                   reservation.setReservationDate(resultSet.getTimestamp("Reservation_Date").toLocalDateTime());
                    reservation.setNumber_of_guests(resultSet.getInt("number_of_guests"));
                    reservation.setCheckInDate(resultSet.getDate("CheckInDate"));
                    reservation.setCheckOutDate(resultSet.getDate("CheckOutDate"));
                    reservation.setTotalPrice(resultSet.getInt("Total_Price"));
                    reservation.setPaymentMethod(resultSet.getString("Payment_Method"));
                    reservation.setStatus(resultSet.getString("Status"));
                    reservation.setAccount_ID(resultSet.getInt("Account_ID"));
                    reservations.add(reservation);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting all reservations: " + e);
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e);
            }
        }

        return reservations;
    }



//    public static void main(String[] args) {
//
//        // Test getReservationByReservationID
//        System.out.println("\n** Test getReservationByReservationID **");
//        int testReservationID = 1; // Replace with an existing reservation ID
//        Reservation reservation = ReservationDB.getReservationByReservationID(testReservationID);
//        if (reservation == null) {
//            System.out.println("Reservation with ID " + testReservationID + " not found.");
//        } else {
//            System.out.println("Details of Reservation (ID: " + testReservationID + "):");
//            System.out.println(reservation); // Assuming your Reservation model has a toString() method
//        }
//
//        // Test getReservationsByAccountID
//        System.out.println("\n** Test getReservationsByAccountID **");
//        int testAccountID = 2; // Replace with an existing Account ID
//        List<Reservation> reservations = ReservationDB.getReservationsByAccountID(testAccountID);
//        if (reservations.isEmpty()) {
//            System.out.println("No reservations found for Account (ID: " + testAccountID + ").");
//        } else {
//            System.out.println("Reservations for Account (ID: " + testAccountID + "):");
//            for (Reservation aReservation : reservations) {
//                System.out.println(aReservation);
//            }
//        }
//    }
    public static int insertReservationAndGetID(Reservation reservation) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet generatedKeys = null;


        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "INSERT INTO Reservation (Reservation_Date, number_of_guests, CheckInDate, CheckOutDate, Total_Price, Payment_Method, Status, Account_ID) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                // Assuming reservation.getReservationDate() returns a LocalDateTime
                LocalDateTime reservationDateTime = reservation.getReservationDate();
                java.sql.Timestamp sqlTimestamp = java.sql.Timestamp.valueOf(reservationDateTime);
                // Set the timestamp in the statement
                statement.setTimestamp(1, sqlTimestamp);
                statement.setInt(2, reservation.getNumber_of_guests());
                statement.setDate(3, reservation.getCheckInDate());
                statement.setDate(4, reservation.getCheckOutDate());
                statement.setInt(5, reservation.getTotalPrice());
                statement.setString(6, reservation.getPaymentMethod());
                statement.setString(7, reservation.getStatus());
                statement.setInt(8, reservation.getAccount_ID());

                int rowsAffected = statement.executeUpdate();
                if (rowsAffected > 0) {
                    generatedKeys = statement.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1); // Get the auto-generated ID
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Error inserting reservation: " + e);
        } finally {
            // Close resources (connection, statement, etc.) here
        }

        return -1; // Return -1 if insertion fails
    }

    public static int deleteReservationByReservationID(int reservationID) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "DELETE FROM Reservation WHERE Reservation_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, reservationID);
                int rowsAffected = statement.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("Reservation with ID " + reservationID + " deleted successfully.");
                } else {
                    System.out.println("No reservation found with ID " + reservationID);
                }
                return rowsAffected; // Return the number of deleted rows
            }
        } catch (SQLException e) {
            System.out.println("Error deleting reservation by ID: " + e);
        } finally {
            // Close resources (connection, statement, etc.) here
        }
        return 0; // Return 0 if an error occurred
    }

    public static int changedReservationStatusByReservationID(int reservationID, String newStatus) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "UPDATE Reservation SET Status = ? WHERE Reservation_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setString(1, newStatus);
                statement.setInt(2, reservationID);
                int rowsAffected = statement.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("Reservation with ID " + reservationID + " status changed to " + newStatus);
                } else {
                    System.out.println("No reservation found with ID " + reservationID);
                }
                return rowsAffected; // Return the number of updated rows
            }
        } catch (SQLException e) {
            System.out.println("Error updating reservation status by ID: " + e);
        } finally {
            // Close resources (connection, statement, etc.) here
        }
        return 0; // Return 0 if an error occurred
    }

    public static boolean hasUnpaidReservationWithVietQR(int accountID) {
        List<Reservation> reservations = getReservationsByAccountID(accountID);

        for (Reservation reservation : reservations) {
            if ("NOT PAID".equals(reservation.getStatus()) && "VIETQR".equals(reservation.getPaymentMethod())) {
                return true; // Found an unpaid reservation with VIETQR
            }
        }

        return false; // No such reservation found
    }
    
    public static void updateReservationStatusAfterFeedback(int reservationID){
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "UPDATE Reservation SET Status = 'Finish' WHERE Reservation_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, reservationID);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("Error updating reservation status by ID: " + e);
        } finally {
            // Close resources (connection, statement, etc.) here
        }
    }

}
