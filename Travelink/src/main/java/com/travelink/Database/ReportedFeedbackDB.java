package com.travelink.Database;

import com.travelink.Model.ReportedFeedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class ReportedFeedbackDB {

    public static boolean insertReportFeedback(ReportedFeedback reportFeedback) {
        Connection con = DatabaseInfo.getConnect();
        try {
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO Reported_Feedback (ReportTime, Reason, Feedback_ID, Account_ID) VALUES (?, ?, ?, ?)");
            // Set parameters
            pstmt.setTimestamp(1, reportFeedback.getReportTime());
            pstmt.setString(2, reportFeedback.getReason());
            pstmt.setInt(3, reportFeedback.getFeedbackId());
            pstmt.setInt(4, reportFeedback.getAccountId());

            // Execute the SQL statement
            int rowsInserted = pstmt.executeUpdate();
            // Close resources
            pstmt.close();
            con.close();

            // Return true if at least one row was inserted
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Handle database error appropriately
        } finally {
            // Close resources in a finally block
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace(); // Handle database error appropriately
            }
        }
        return false;
    }
    
    public static boolean checkReportFeedback(int feedbackId, int accountId) {
        Connection con = DatabaseInfo.getConnect();
        try {
            PreparedStatement pstmt = con.prepareStatement("SELECT COUNT(*) FROM Reported_Feedback WHERE Feedback_ID = ? AND Account_ID = ?");
            pstmt.setInt(1, feedbackId);
            pstmt.setInt(2, accountId);

            ResultSet rs = pstmt.executeQuery();
            rs.next();
            int count = rs.getInt(1);
            rs.close();
            pstmt.close();
            con.close();

            return count > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Handle database error appropriately
        } finally {
            // Close resources in a finally block
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace(); // Handle database error appropriately
            }
        }
        return false;
    }

    public static void main(String[] args) {
        // Create a ReportFeedback object
        Timestamp reportTime = Timestamp.valueOf("2024-12-03 12:05:03");
        String reason = "Sleep";
        int feedbackId = 1;
        int accountId = 2;

        ReportedFeedback reportFeedback = new ReportedFeedback(reportTime, reason, feedbackId, accountId);

        // Insert the feedback
        boolean check = checkReportFeedback(6,2);
        System.out.println(check);
    }
}