/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author admin
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.View.Bill;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class BillDB implements DatabaseInfo {

    public static void createBillView() {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DatabaseInfo.getConnect();

            if (conn != null) {
                // Check if the view already exists
                String checkViewQuery = "SELECT COUNT(*) FROM information_schema.views WHERE table_name = 'Bill'";
                try (Statement checkStatement = conn.createStatement(); ResultSet resultSet = checkStatement.executeQuery(checkViewQuery)) {
                    resultSet.next();
                    int viewCount = resultSet.getInt(1);

                    // If the view doesn't exist, create it
                    if (viewCount == 0) {
                        String createViewQuery = "CREATE VIEW Bill AS "
                                + "SELECT r.Reservation_ID, r.CheckInDate, r.CheckOutDate, r.Number_of_guests, r.Reservation_Date, r.Account_ID, r.Status, r.Total_Price, "
                                + "       rm.Room_ID, rm.Name as Room_Name, rm.Price as Room_Price, h.Name, h.CheckInTimeStart, h.CheckInTimeEnd, h.CheckOutTimeStart, h.CheckOutTimeEnd,rr.Amount,h.Hotel_ID "
                                + "FROM Reservation r "
                                + "JOIN Reserved_Room rr ON r.Reservation_ID = rr.Reservation_ID "
                                + "JOIN Room rm ON rr.Room_ID = rm.Room_ID "
                                + "JOIN Hotel h on rm.Hotel_ID = h.Hotel_ID";
                        ps = conn.prepareStatement(createViewQuery);
                        ps.execute();
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Error creating view Bill: " + e);
        } finally {
            // Close resources
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e);
            }
        }
    }

    public static List<Bill> getBillByCustomerID(int account_ID) {
        createBillView();
        List<Bill> list_bill = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DatabaseInfo.getConnect();

            if (conn != null) {
                String query = "SELECT * FROM Bill WHERE Account_ID = ? ORDER BY Status desc";
                ps = conn.prepareStatement(query);
                ps.setInt(1, account_ID);
                rs = ps.executeQuery();

                while (rs.next()) {
                    Bill bill = new Bill();
                    bill.setAccount_ID(rs.getInt("Account_ID"));
                    bill.setReservationID(rs.getInt("Reservation_ID"));
                    bill.setCheckInDate(rs.getDate("CheckInDate").toLocalDate());
                    bill.setCheckOutDate(rs.getDate("CheckOutDate").toLocalDate());
                    bill.setNumber_of_guest(rs.getInt("Number_of_guests"));
                    bill.setReservationDate(rs.getDate("Reservation_Date").toLocalDate());
                    bill.setRoom_ID(rs.getInt("Room_ID"));
                    bill.setRoom_Name(rs.getString("Room_Name"));
                    bill.setRoom_price(rs.getInt("Room_Price"));
                    bill.setHotel_Name(rs.getString("Name"));
                    bill.setCheckInTimeStart(rs.getTime("CheckInTimeStart").toLocalTime());
                    bill.setCheckInTimeEnd(rs.getTime("CheckInTimeEnd").toLocalTime());
                    bill.setCheckOutTimeStart(rs.getTime("CheckOutTimeStart").toLocalTime());
                    bill.setCheckOutTimeEnd(rs.getTime("CheckOutTimeEnd").toLocalTime());
                    bill.setStatus(rs.getString("Status"));
                    bill.setTotal_price(rs.getInt("Total_Price"));
                    bill.setAmount(rs.getInt("Amount"));
                    bill.setHotel_ID(rs.getInt("Hotel_ID"));
                    list_bill.add(bill);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting service by HotelServiceID: " + e);
        }
        return list_bill;
    }

    public static List<Bill> getBillProcessingByCustomerID(int account_ID) {
        createBillView();
        List<Bill> list_bill = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DatabaseInfo.getConnect();

            if (conn != null) {
                // Query to select bills based on checkInDate, checkOutDate, status 'finished' or 'processing'
                String query = "SELECT * FROM Bill WHERE Account_ID = ? AND "
                        + "CheckOutDate >= GETDATE() AND (Status = 'NOT PAID' OR Status = 'PAID')";
                ps = conn.prepareStatement(query);
                ps.setInt(1, account_ID);
                rs = ps.executeQuery();

                while (rs.next()) {
                    Bill bill = new Bill();
                    bill.setAccount_ID(rs.getInt("Account_ID"));
                    bill.setReservationID(rs.getInt("Reservation_ID"));
                    bill.setCheckInDate(rs.getDate("CheckInDate").toLocalDate());
                    bill.setCheckOutDate(rs.getDate("CheckOutDate").toLocalDate());
                    bill.setNumber_of_guest(rs.getInt("Number_of_guests"));
                    bill.setReservationDate(rs.getDate("Reservation_Date").toLocalDate());
                    bill.setRoom_ID(rs.getInt("Room_ID"));
                    bill.setRoom_Name(rs.getString("Room_Name"));
                    bill.setRoom_price(rs.getInt("Room_Price"));
                    bill.setHotel_Name(rs.getString("Name"));
                    bill.setCheckInTimeStart(rs.getTime("CheckInTimeStart").toLocalTime());
                    bill.setCheckInTimeEnd(rs.getTime("CheckInTimeEnd").toLocalTime());
                    bill.setCheckOutTimeStart(rs.getTime("CheckOutTimeStart").toLocalTime());
                    bill.setCheckOutTimeEnd(rs.getTime("CheckOutTimeEnd").toLocalTime());
                    bill.setStatus(rs.getString("Status"));
                    bill.setTotal_price(rs.getInt("Total_Price"));
                    bill.setAmount(rs.getInt("Amount"));
                    bill.setHotel_ID(rs.getInt("Hotel_ID"));
                    list_bill.add(bill);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting bills: " + e);
        } finally {
            // Close resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e);
            }
        }
        return list_bill;
    }

    public static List<Bill> getBillFinishedByCustomerID(int account_ID) {
        createBillView();
        List<Bill> list_bill = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DatabaseInfo.getConnect();

            if (conn != null) {
                // Query to select bills based on checkInDate, checkOutDate, status 'finished' or 'processing'
                String query = "SELECT * FROM Bill WHERE Account_ID = ? AND "
                        + "CheckOutDate < GETDATE() AND (Status = 'PAID' OR Status = 'FINISH')";
                ps = conn.prepareStatement(query);
                ps.setInt(1, account_ID);
                rs = ps.executeQuery();

                while (rs.next()) {
                    Bill bill = new Bill();
                    bill.setAccount_ID(rs.getInt("Account_ID"));
                    bill.setReservationID(rs.getInt("Reservation_ID"));
                    bill.setCheckInDate(rs.getDate("CheckInDate").toLocalDate());
                    bill.setCheckOutDate(rs.getDate("CheckOutDate").toLocalDate());
                    bill.setNumber_of_guest(rs.getInt("Number_of_guests"));
                    bill.setReservationDate(rs.getDate("Reservation_Date").toLocalDate());
                    bill.setRoom_ID(rs.getInt("Room_ID"));
                    bill.setRoom_Name(rs.getString("Room_Name"));
                    bill.setRoom_price(rs.getInt("Room_Price"));
                    bill.setHotel_Name(rs.getString("Name"));
                    bill.setCheckInTimeStart(rs.getTime("CheckInTimeStart").toLocalTime());
                    bill.setCheckInTimeEnd(rs.getTime("CheckInTimeEnd").toLocalTime());
                    bill.setCheckOutTimeStart(rs.getTime("CheckOutTimeStart").toLocalTime());
                    bill.setCheckOutTimeEnd(rs.getTime("CheckOutTimeEnd").toLocalTime());
                    bill.setStatus(rs.getString("Status"));
                    bill.setTotal_price(rs.getInt("Total_Price"));
                    bill.setAmount(rs.getInt("Amount"));
                    bill.setHotel_ID(rs.getInt("Hotel_ID"));
                    list_bill.add(bill);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting bills: " + e);
        } finally {
            // Close resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e);
            }
        }
        return list_bill;
    }

    public static List<Bill> getBillByCustomerIDAndReservationID(int account_ID, int reservation_ID) {
        createBillView();
        List<Bill> list_bill = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DatabaseInfo.getConnect();

            if (conn != null) {
                String query = "SELECT * FROM Bill WHERE Account_ID = ? AND Reservation_ID = ?";
                ps = conn.prepareStatement(query);
                ps.setInt(1, account_ID);
                ps.setInt(2, reservation_ID);
                rs = ps.executeQuery();

                while (rs.next()) {
                    Bill bill = new Bill();
                    bill.setAccount_ID(rs.getInt("Account_ID"));
                    bill.setReservationID(rs.getInt("Reservation_ID"));
                    bill.setCheckInDate(rs.getDate("CheckInDate").toLocalDate());
                    bill.setCheckOutDate(rs.getDate("CheckOutDate").toLocalDate());
                    bill.setNumber_of_guest(rs.getInt("Number_of_guests"));
                    bill.setReservationDate(rs.getDate("Reservation_Date").toLocalDate());
                    bill.setRoom_ID(rs.getInt("Room_ID"));
                    bill.setRoom_Name(rs.getString("Room_Name"));
                    bill.setRoom_price(rs.getInt("Room_Price"));
                    bill.setHotel_Name(rs.getString("Name"));
                    bill.setCheckInTimeStart(rs.getTime("CheckInTimeStart").toLocalTime());
                    bill.setCheckInTimeEnd(rs.getTime("CheckInTimeEnd").toLocalTime());
                    bill.setCheckOutTimeStart(rs.getTime("CheckOutTimeStart").toLocalTime());
                    bill.setCheckOutTimeEnd(rs.getTime("CheckOutTimeEnd").toLocalTime());
                    bill.setStatus(rs.getString("Status"));
                    bill.setTotal_price(rs.getInt("Total_Price"));
                    bill.setAmount(rs.getInt("Amount"));
                    bill.setHotel_ID(rs.getInt("Hotel_ID"));
                    list_bill.add(bill);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting service by HotelServiceID: " + e);
        }
        return list_bill;
    }

    public static void main(String[] args) throws SQLException {
        List<Bill> list = BillDB.getBillByCustomerID(1);
        for (Bill b : list) {
            System.out.println(b.toString());
        }

    }

}
