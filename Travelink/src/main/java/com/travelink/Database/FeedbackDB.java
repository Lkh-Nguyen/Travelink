/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.Account;
import com.travelink.Model.Feedback;
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
                    feedback.setAccount_ID(resultSet.getInt("Account_ID"));
                    feedback.setHotelID(resultSet.getInt("Hotel_ID"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting feedback by ID: " + e);
        }
        return feedback;
    }

    // Get feedbacks by Hotel ID
    public static List<Feedback> getFeedbacksByHotelID(int hotelID) {
        List<Feedback> feedbacks = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Feedback WHERE Hotel_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, hotelID); // Set the ID parameter
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Feedback feedback = new Feedback();
                    feedback.setFeedbackID(resultSet.getInt("Feedback_ID"));
                    feedback.setDescription(resultSet.getString("Description"));
                    feedback.setRating(resultSet.getByte("Rating"));
                    feedback.setDate(resultSet.getDate("Date"));
                    feedback.setLikesCount(resultSet.getInt("LikesCount"));
                    feedback.setDislikesCount(resultSet.getInt("DislikesCount"));
                    feedback.setAccount_ID(resultSet.getInt("Account_ID"));
                    feedback.setHotelID(resultSet.getInt("Hotel_ID"));
                    feedbacks.add(feedback);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting feedbacks by Hotel ID: " + e);
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                /* Ignored */ }
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                /* Ignored */ }
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                /* Ignored */ }
        }
        return feedbacks;
    }

    //Get Account By Feedback ID
    public static Account getAccountByFeedbackID(int feedbackID) {
        Account account = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT a.* FROM Account a "
                        + "JOIN Feedback f ON a.Account_ID = f.Account_ID "
                        + "WHERE f.Feedback_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, feedbackID);
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    account = new Account();
                    account.setAccount_ID(resultSet.getInt("Account_ID"));
                    account.setEmail(resultSet.getString("Email"));
                    account.setPassword(resultSet.getString("Password"));
                    account.setCmnd(resultSet.getString("CMND"));
                    account.setName(resultSet.getString("Name"));
                    account.setGender(resultSet.getString("Gender").charAt(0));
                    account.setDateOfBirth(resultSet.getDate("DateOfBirth"));
                    account.setPhoneNumber(resultSet.getString("PhoneNumber"));
                    account.setAvatarURL(resultSet.getString("AvatarURL"));
                    account.setAddress(resultSet.getString("Address"));
                    account.setRole(resultSet.getInt("Role"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting account by feedback ID: " + e);
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                /* Ignored */ }
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                /* Ignored */ }
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                /* Ignored */ }
        }
        return account;
    }

    // Insert a new feedback
    public static void insertFeedback(Feedback feedback) throws SQLException {
        Connection connection = DatabaseInfo.getConnect();

        if (connection != null) {
            String query = "INSERT INTO Feedback (Description, Rating, Date, LikesCount, DislikesCount, Account_ID, Hotel_ID)"
                    + " VALUES (?, ?, ?, 0, 0, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, feedback.getDescription());
            statement.setByte(2, feedback.getRating());
            statement.setDate(3, feedback.getDate());
            statement.setInt(4, feedback.getAccount_ID());
            statement.setInt(5, feedback.getHotelID());

            statement.executeUpdate();
            connection.close();
        } else {
            System.out.println("Error: Connection failed!");
        }
    }
    
    public static void updateStatusBill(int reservationID) throws SQLException {
        Connection connection = DatabaseInfo.getConnect();

        if (connection != null) {
            String query = "update Reservation "
                    + "set status = 'FINISH' "
                    + "where Reservation_ID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, reservationID);
            statement.executeUpdate();
            connection.close();
        } else {
            System.out.println("Error: Connection failed!");
        }
    }
    // Update an existing feedback
    public static void updateFeedback(Feedback feedback) throws SQLException {
        Connection connection = DatabaseInfo.getConnect();

        if (connection != null) {
            String query = "UPDATE Feedback SET Description = ?, Rating = ? WHERE Feedback_ID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, feedback.getDescription());
            statement.setByte(2, feedback.getRating());
            statement.setInt(3, feedback.getFeedbackID());

            statement.executeUpdate();
            connection.close();
        } else {
            System.out.println("Error: Connection failed!");
        }
    }

    // Delete a feedback
    public static void deleteFeedback(int feedbackID) throws SQLException {
        Connection connection = DatabaseInfo.getConnect();

        if (connection != null) {
            String query = "DELETE FROM Feedback WHERE Feedback_ID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, feedbackID);

            statement.executeUpdate();
            connection.close();
        } else {
            System.out.println("Error: Connection failed!");
        }
    }

    // Get feedbacks by Account ID
    public static List<Feedback> getFeedbacksByAccountID(int accountID) {
        List<Feedback> feedbacks = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM Feedback WHERE Account_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, accountID);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Feedback feedback = new Feedback();
                    feedback.setFeedbackID(resultSet.getInt("Feedback_ID"));
                    feedback.setDescription(resultSet.getString("Description"));
                    feedback.setRating(resultSet.getByte("Rating"));
                    feedback.setDate(resultSet.getDate("Date"));
                    feedback.setLikesCount(resultSet.getInt("LikesCount"));
                    feedback.setDislikesCount(resultSet.getInt("DislikesCount"));
                    feedback.setAccount_ID(resultSet.getInt("Account_ID"));
                    feedback.setHotelID(resultSet.getInt("Hotel_ID"));
                    feedbacks.add(feedback);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting feedbacks by Account ID: " + e);
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                /* Ignored */ }
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                /* Ignored */ }
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                /* Ignored */ }
        }
        return feedbacks;
    }
 public static boolean hasUserLikedFeedback(int accountID, int feedbackID) throws SQLException {
        Connection conn = DatabaseInfo.getConnect();
        String query = "SELECT Liked FROM [Travelink].[dbo].[UserFeedbackLikes] WHERE Account_ID = ? AND Feedback_ID = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, accountID);
        ps.setInt(2, feedbackID);
        ResultSet rs = ps.executeQuery();
        boolean liked = false;
        if (rs.next()) {
            liked = rs.getBoolean("Liked");
        }
        rs.close();
        ps.close();
        conn.close();
        return liked;
    }

    public static boolean hasUserDislikedFeedback(int accountID, int feedbackID) throws SQLException {
        Connection conn = DatabaseInfo.getConnect();
        String query = "SELECT Disliked FROM [Travelink].[dbo].[UserFeedbackLikes] WHERE Account_ID = ? AND Feedback_ID = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, accountID);
        ps.setInt(2, feedbackID);
        ResultSet rs = ps.executeQuery();
        boolean disliked = false;
        if (rs.next()) {
            disliked = rs.getBoolean("Disliked");
        }
        rs.close();
        ps.close();
        conn.close();
        return disliked;
    }

    public static void addUserFeedbackLike(int accountID, int feedbackID) throws SQLException {
        Connection conn = DatabaseInfo.getConnect();
        String query = "MERGE INTO [Travelink].[dbo].[UserFeedbackLikes] WITH (HOLDLOCK) AS target " +
                "USING (SELECT ? AS Account_ID, ? AS Feedback_ID) AS source " +
                "ON target.Account_ID = source.Account_ID AND target.Feedback_ID = source.Feedback_ID " +
                "WHEN MATCHED THEN " +
                "    UPDATE SET Liked = 1, Disliked = 0 " +
                "WHEN NOT MATCHED THEN " +
                "    INSERT (Account_ID, Feedback_ID, Liked, Disliked) VALUES (?, ?, 1, 0);";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, accountID);
        ps.setInt(2, feedbackID);
        ps.setInt(3, accountID);
        ps.setInt(4, feedbackID);
        ps.executeUpdate();
        ps.close();
        conn.close();
    }

    public static void addUserFeedbackDislike(int accountID, int feedbackID) throws SQLException {
        Connection conn = DatabaseInfo.getConnect();
        String query = "MERGE INTO [Travelink].[dbo].[UserFeedbackLikes] WITH (HOLDLOCK) AS target " +
                "USING (SELECT ? AS Account_ID, ? AS Feedback_ID) AS source " +
                "ON target.Account_ID = source.Account_ID AND target.Feedback_ID = source.Feedback_ID " +
                "WHEN MATCHED THEN " +
                "    UPDATE SET Disliked = 1, Liked = 0 " +
                "WHEN NOT MATCHED THEN " +
                "    INSERT (Account_ID, Feedback_ID, Liked, Disliked) VALUES (?, ?, 0, 1);";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, accountID);
        ps.setInt(2, feedbackID);
        ps.setInt(3, accountID);
        ps.setInt(4, feedbackID);
        ps.executeUpdate();
        ps.close();
        conn.close();
    }

    public static void removeUserLike(int accountID, int feedbackID) throws SQLException {
        Connection conn = DatabaseInfo.getConnect();
        String query = "UPDATE [Travelink].[dbo].[UserFeedbackLikes] SET Liked = 0 WHERE Account_ID = ? AND Feedback_ID = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, accountID);
        ps.setInt(2, feedbackID);
        ps.executeUpdate();
        ps.close();
        conn.close();
    }

    public static void removeUserDislike(int accountID, int feedbackID) throws SQLException {
        Connection conn = DatabaseInfo.getConnect();
        String query = "UPDATE [Travelink].[dbo].[UserFeedbackLikes] SET Disliked = 0 WHERE Account_ID = ? AND Feedback_ID = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, accountID);
        ps.setInt(2, feedbackID);
        ps.executeUpdate();
        ps.close();
        conn.close();
    }
    public static void incrementLikesCount(int feedbackID) throws SQLException {
        Connection connection = DatabaseInfo.getConnect();

        if (connection != null) {
            String query = "UPDATE Feedback SET LikesCount = LikesCount + 1 WHERE Feedback_ID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, feedbackID);

            statement.executeUpdate();
            connection.close();
        } else {
            System.out.println("Error: Connection failed!");
        }
    }
    
        public static void decrementLikesCount(int feedbackID) throws SQLException {
        Connection connection = DatabaseInfo.getConnect();

        if (connection != null) {
            String query = "UPDATE Feedback SET LikesCount = LikesCount - 1 WHERE Feedback_ID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, feedbackID);

            statement.executeUpdate();
            connection.close();
        } else {
            System.out.println("Error: Connection failed!");
        }
    }
        
     public static void incrementDisLikesCount(int feedbackID) throws SQLException {
        Connection connection = DatabaseInfo.getConnect();

        if (connection != null) {
            String query = "UPDATE Feedback SET DislikesCount = DislikesCount + 1 WHERE Feedback_ID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, feedbackID);

            statement.executeUpdate();
            connection.close();
        } else {
            System.out.println("Error: Connection failed!");
        }
    }
    
        public static void decrementDisLikesCount(int feedbackID) throws SQLException {
        Connection connection = DatabaseInfo.getConnect();

        if (connection != null) {
            String query = "UPDATE Feedback SET DislikesCount = DislikesCount - 1 WHERE Feedback_ID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, feedbackID);

            statement.executeUpdate();
            connection.close();
        } else {
            System.out.println("Error: Connection failed!");
        }
    }
        

    public static boolean isFeedbackOwner(int feedbackID, int userID) throws SQLException {
        Connection connection = DatabaseInfo.getConnect();

        if (connection != null) {
            String query = "SELECT COUNT(*) FROM Feedback WHERE feedbackID = ? AND account_ID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, feedbackID);
            statement.setInt(2, userID);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } else {
            System.out.println("Error: Connection failed!");
        }
        return false;
    }

    // You can add more functions as needed, such as:
    // - Get all feedback for a specific hotel
    // - Create new feedback
    // - Update existing feedback
    // - Delete feedback (consider security measures)
    public static void main(String[] args) throws SQLException {

        // Test getFeedbackByID
        FeedbackDB.updateStatusBill(2);
    }

}
