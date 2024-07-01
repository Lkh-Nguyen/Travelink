/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.ReportedFeedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class ReportedFeedbackDB {

    public static ReportedFeedback getReportedFeedbackByReportedFeedbackId(int reportedFeedbackId) {
        Connection con = DatabaseInfo.getConnect();
        try {
            ReportedFeedback reportedFeedback = null;
            PreparedStatement st = con.prepareStatement("SELECT * FROM Reported_Feedback WHERE Reported_Feedback_ID = ?");
            st.setInt(1, reportedFeedbackId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                reportedFeedback = new ReportedFeedback();
                reportedFeedback.setReportedFeedbackId(rs.getInt("Reported_Feedback_ID"));

                // Convert SQL Timestamp to LocalDateTime
                LocalDateTime reportTime = rs.getTimestamp("ReportTime").toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
                reportedFeedback.setReportTime(reportTime);

                reportedFeedback.setReason(rs.getString("Reason"));
                reportedFeedback.setFeedbackId(rs.getInt("Feedback_ID"));
                reportedFeedback.setAccountId(rs.getInt("Account_ID"));
            }

            return reportedFeedback;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return null;
    }

    public static List<ReportedFeedback> getReportedFeedbacksByAccountId(int accountId) {
        List<ReportedFeedback> reportedFeedbackList = new ArrayList<>();
        Connection con = DatabaseInfo.getConnect();

        try {
            PreparedStatement st = con.prepareStatement("SELECT * FROM Reported_Feedback WHERE Account_ID = ?");
            st.setInt(1, accountId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                ReportedFeedback reportedFeedback = new ReportedFeedback();
                reportedFeedback.setReportedFeedbackId(rs.getInt("Reported_Feedback_ID"));

                // Convert SQL Timestamp to LocalDateTime
                LocalDateTime reportTime = rs.getTimestamp("ReportTime").toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
                reportedFeedback.setReportTime(reportTime);

                reportedFeedback.setReason(rs.getString("Reason"));
                reportedFeedback.setFeedbackId(rs.getInt("Feedback_ID"));
                reportedFeedback.setAccountId(rs.getInt("Account_ID"));

                reportedFeedbackList.add(reportedFeedback);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return reportedFeedbackList;
    }

    public static List<ReportedFeedback> getReportedFeedbackByFeedbackId(int feedbackId) {
        List<ReportedFeedback> reportedFeedbackList = new ArrayList<>();
        Connection con = DatabaseInfo.getConnect();

        try {
            PreparedStatement st = con.prepareStatement("SELECT * FROM Reported_Feedback WHERE Feedback_ID = ?");
            st.setInt(1, feedbackId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                ReportedFeedback reportedFeedback = new ReportedFeedback();
                reportedFeedback.setReportedFeedbackId(rs.getInt("Reported_Feedback_ID"));

                // Convert SQL Timestamp to LocalDateTime
                LocalDateTime reportTime = rs.getTimestamp("ReportTime").toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
                reportedFeedback.setReportTime(reportTime);

                reportedFeedback.setReason(rs.getString("Reason"));
                reportedFeedback.setFeedbackId(rs.getInt("Feedback_ID"));
                reportedFeedback.setAccountId(rs.getInt("Account_ID"));

                reportedFeedbackList.add(reportedFeedback);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return reportedFeedbackList;
    }

}
