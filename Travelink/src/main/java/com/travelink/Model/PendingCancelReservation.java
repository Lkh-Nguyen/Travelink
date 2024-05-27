/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Model;

import java.time.LocalDate;

/**
 *
 * @author ASUS
 */
public class PendingCancelReservation {

    private int pendingCancelReservationID;
    private LocalDate cancelDate;
    private int reservationID;

    // Default constructor
    public PendingCancelReservation() {
    }

    // Constructor with all member variables
    public PendingCancelReservation(LocalDate cancelDate, int reservationID) {
        this.cancelDate = cancelDate;
        this.reservationID = reservationID;
    }

    public int getPendingCancelReservationID() {
        return pendingCancelReservationID;
    }

    public void setPendingCancelReservationID(int pendingCancelReservationID) {
        this.pendingCancelReservationID = pendingCancelReservationID;
    }

    public LocalDate getCancelDate() {
        return cancelDate;
    }

    public void setCancelDate(LocalDate cancelDate) {
        this.cancelDate = cancelDate;
    }

    public int getReservationID() {
        return reservationID;
    }

    public void setReservationID(int reservationID) {
        this.reservationID = reservationID;
    }

    @Override
    public String toString() {
        return "PendingCancelReservation{"
                + "pendingCancelReservationID=" + pendingCancelReservationID
                + ", cancelDate=" + cancelDate
                + ", reservationID=" + reservationID
                + '}';
    }
}
