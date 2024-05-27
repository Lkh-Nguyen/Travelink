/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.Feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class FeedbackDB implements DatabaseInfo {

    public static Feedback getFeedbackByID(int feedbackID) {
        Feedback feedback = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Feedback WHERE Feedback_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, feedbackID); // Set the ID parameter
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    feedback = new Feedback();
                    feedback.setFeedbackID(resultSet.getInt("Feedback_ID"));
                    feedback.setDescription(resultSet.getString("Description"));
                    feedback.setRating(resultSet.getByte("Rating"));
                    feedback.setDate(resultSet.getDate("Date"));
                    feedback.setLikesCount(resultSet.getInt("LikesCount"));
                    feedback.setDislikesCount(resultSet.getInt("DislikesCount"));
                    feedback.setCustomerID(resultSet.getInt("Customer_ID"));
                    feedback.setHotelID(resultSet.getInt("Hotel_ID"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting feedback by ID: " + e);
        }
        return feedback;
    }

    // You can add more functions as needed, such as:
    // - Get all feedback for a specific hotel
    // - Create new feedback
    // - Update existing feedback
    // - Delete feedback (consider security measures)
    public static void main(String[] args) throws SQLException {

        // Test getFeedbackByID
        System.out.println("\n** Test getFeedbackByID **");
        int testFeedbackID = 5; // Replace with an existing feedback ID
        Feedback feedback = FeedbackDB.getFeedbackByID(testFeedbackID);
        if (feedback == null) {
            System.out.println("Feedback with ID " + testFeedbackID + " not found.");
        } else {
            System.out.println("Details of Feedback (ID: " + testFeedbackID + "):");
            System.out.println(feedback); // Assuming your Feedback model has a toString() method
        }
    }

}
