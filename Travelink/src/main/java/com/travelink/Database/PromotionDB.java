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
import java.util.ArrayList;
import java.util.List;

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
    
    public static List<Promotion> getAllPromotions() {
        List<Promotion> promotions = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();
            String query = "SELECT * FROM Promotion";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Promotion promotion = new Promotion();
                promotion.setPromotionID(resultSet.getInt("Promotion_ID"));
                promotion.setName(resultSet.getString("Name"));
                promotion.setDiscount(resultSet.getInt("Discount"));
                promotion.setStartDate(resultSet.getDate("StartDate"));
                promotion.setEndDate(resultSet.getDate("EndDate"));
                promotions.add(promotion);
            }
        } catch (SQLException e) {
            System.out.println("Error getting all promotions: " + e);
        }

        return promotions;
    }

    public static void addPromotion(Promotion promotion) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DatabaseInfo.getConnect();
            String query = "INSERT INTO Promotion (Name, Discount, StartDate, EndDate) VALUES (?, ?, ?, ?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, promotion.getName());
            statement.setInt(2, promotion.getDiscount());
            statement.setDate(3, promotion.getStartDate());
            statement.setDate(4, promotion.getEndDate());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error adding promotion: " + e);
        }
    }

    public static void updatePromotion(Promotion promotion) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DatabaseInfo.getConnect();
            String query = "UPDATE Promotion SET Name = ?, Discount = ?, StartDate = ?, EndDate = ? WHERE Promotion_ID = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, promotion.getName());
            statement.setInt(2, promotion.getDiscount());
            statement.setDate(3, promotion.getStartDate());
            statement.setDate(4, promotion.getEndDate());
            statement.setInt(5, promotion.getPromotionID());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating promotion: " + e);
        }
    }

    public static void deletePromotion(int promotionID) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DatabaseInfo.getConnect();
            String query = "DELETE FROM Promotion WHERE Promotion_ID = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, promotionID);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error deleting promotion: " + e);
        }
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
