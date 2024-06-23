package com.travelink.Model;

import java.time.LocalDateTime;

public class RefundingReservation {

    private int refundingReservation_ID;
    private LocalDateTime cancelDate;
    private int amount;
    private LocalDateTime refundTime;
    private String status;
    private int reservation_ID;

    // Constructor
    public RefundingReservation(int refundingReservation_ID, LocalDateTime cancelDate, int amount, LocalDateTime refundTime, String status, int reservation_ID) {
        this.refundingReservation_ID = refundingReservation_ID;
        this.cancelDate = cancelDate;
        this.amount = amount;
        this.refundTime = refundTime;
        this.status = status;
        this.reservation_ID = reservation_ID;
    }

    // Default constructor
    public RefundingReservation() {
    }

    // Getters and Setters
    public int getRefundingReservationId() {
        return refundingReservation_ID;
    }

    public void setRefundingReservationId(int refundingReservation_ID) {
        this.refundingReservation_ID = refundingReservation_ID;
    }

    public LocalDateTime getCancelDate() {
        return cancelDate;
    }

    public void setCancelDate(LocalDateTime cancelDate) {
        this.cancelDate = cancelDate;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public LocalDateTime getRefundTime() {
        return refundTime;
    }

    public void setRefundTime(LocalDateTime refundTime) {
        this.refundTime = refundTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getReservationId() {
        return reservation_ID;
    }

    public void setReservationId(int reservation_ID) {
        this.reservation_ID = reservation_ID;
    }

    @Override
    public String toString() {
        return "RefundingReservation{"
                + "refundingReservation_ID=" + refundingReservation_ID
                + ", cancelDate=" + cancelDate
                + ", amount=" + amount
                + ", refundTime=" + refundTime
                + ", status='" + status + '\''
                + ", reservation_ID=" + reservation_ID
                + '}';
    }
}
