/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Model;

import java.time.LocalDateTime;

public class ReportedFeedback {
    private int reportedFeedbackId;
    private LocalDateTime reportTime;
    private String reason;
    private int feedbackId;
    private int accountId;

    public ReportedFeedback() {
    }

    
    
    // Constructor
    public ReportedFeedback(int reportedFeedbackId, LocalDateTime reportTime, String reason, int feedbackId, int accountId) {
        this.reportedFeedbackId = reportedFeedbackId;
        this.reportTime = reportTime;
        this.reason = reason;
        this.feedbackId = feedbackId;
        this.accountId = accountId;
    }

    // Getters and Setters
    public int getReportedFeedbackId() {
        return reportedFeedbackId;
    }

    public void setReportedFeedbackId(int reportedFeedbackId) {
        this.reportedFeedbackId = reportedFeedbackId;
    }

    public LocalDateTime getReportTime() {
        return reportTime;
    }

    public void setReportTime(LocalDateTime reportTime) {
        this.reportTime = reportTime;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    @Override
    public String toString() {
        return "ReportedFeedback{" +
                "reportedFeedbackId=" + reportedFeedbackId +
                ", reportTime=" + reportTime +
                ", reason='" + reason + '\'' +
                ", feedbackId=" + feedbackId +
                ", accountId=" + accountId +
                '}';
    }
}

