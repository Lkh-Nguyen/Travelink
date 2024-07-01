package com.travelink.Model;

import java.sql.Timestamp;

public class ReportFeedback {
    private Timestamp reportTime;
    private String reason;
    private int feedbackId;
    private int accountId;

    public ReportFeedback(Timestamp reportTime, String reason, int feedbackId, int accountId) {
        this.reportTime = reportTime;
        this.reason = reason;
        this.feedbackId = feedbackId;
        this.accountId = accountId;
    }

    public Timestamp getReportTime() {
        return reportTime;
    }

    public String getReason() {
        return reason;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public int getAccountId() {
        return accountId;
    }
}
