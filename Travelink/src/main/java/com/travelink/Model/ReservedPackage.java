/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Model;

/**
 *
 * @author ASUS
 */
public class ReservedPackage {

    private int reservedPackageID;
    private byte packageAmount; // Use byte for TINYINT
    private int reservationID;
    private int packageID;

    // Default constructor
    public ReservedPackage() {
    }

    // Constructor with all member variables
    public ReservedPackage(byte packageAmount, int reservationID, int packageID) {
        this.packageAmount = packageAmount;
        this.reservationID = reservationID;
        this.packageID = packageID;
    }

    public int getReservedPackageID() {
        return reservedPackageID;
    }

    public void setReservedPackageID(int reservedPackageID) {
        this.reservedPackageID = reservedPackageID;
    }

    public byte getPackageAmount() {
        return packageAmount;
    }

    public void setPackageAmount(byte packageAmount) {
        this.packageAmount = packageAmount;
    }

    public int getReservationID() {
        return reservationID;
    }

    public void setReservationID(int reservationID) {
        this.reservationID = reservationID;
    }

    public int getPackageID() {
        return packageID;
    }

    public void setPackageID(int packageID) {
        this.packageID = packageID;
    }

    @Override
    public String toString() {
        return "ReservedPackage{"
                + "reservedPackageID=" + reservedPackageID
                + ", packageAmount=" + packageAmount
                + ", reservationID=" + reservationID
                + ", packageID=" + packageID
                + '}';
    }
}
