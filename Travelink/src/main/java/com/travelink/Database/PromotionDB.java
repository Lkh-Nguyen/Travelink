/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.Promotion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class PromotionDB implements DatabaseInfo {

    public static Promotion getPromotionByID(int promotionID) {
        Promotion promotion = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Promotion WHERE Promotion_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, promotionID); // Set the ID parameter
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    promotion = new Promotion();
                    promotion.setPromotionID(resultSet.getInt("Promotion_ID"));
                    promotion.setName(resultSet.getString("Name"));
                    promotion.setDiscount(resultSet.getInt("Discount"));
                    promotion.setStartDate(resultSet.getDate("StartDate"));
                    promotion.setEndDate(resultSet.getDate("EndDate"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting promotion by ID: " + e);
        }
        return promotion;
    }

    // You can add more functions as needed, such as:
    // - Get all active promotions (between start and end date)
    // - Create a new promotion
    // - Update an existing promotion
    // - Delete a promotion (consider security measures)
    public static void main(String[] args){

        // Test getPromotionByID
        System.out.println("\n** Test getPromotionByID **");
        int testPromotionID = 2; // Replace with an existing promotion ID
        Promotion promotion = PromotionDB.getPromotionByID(testPromotionID);
        if (promotion == null) {
            System.out.println("Promotion with ID " + testPromotionID + " not found.");
        } else {
            System.out.println("Details of Promotion (ID: " + testPromotionID + "):");
            System.out.println(promotion); // Assuming your Promotion model has a toString() method
        }
    }

}
