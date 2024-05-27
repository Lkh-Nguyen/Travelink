/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Model;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 *
 * @author ASUS
 */
public class Package {

    private int packageID;
    private int roomTypeID;
    private int hotelServiceID;
    private BigDecimal price;
    private LocalDate priceStartDate;
    private LocalDate priceEndDate;

    public Package() {
        // Default constructor
    }

    public Package(int roomTypeID, int hotelServiceID, BigDecimal price, LocalDate priceStartDate, LocalDate priceEndDate) {
        this.roomTypeID = roomTypeID;
        this.hotelServiceID = hotelServiceID;
        this.price = price;
        this.priceStartDate = priceStartDate;
        this.priceEndDate = priceEndDate;
    }

    // Getters and Setters for member variables
    public int getPackageID() {
        return packageID;
    }

    public void setPackageID(int packageID) {
        this.packageID = packageID;
    }

    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public int getHotelServiceID() {
        return hotelServiceID;
    }

    public void setHotelServiceID(int hotelServiceID) {
        this.hotelServiceID = hotelServiceID;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public LocalDate getPriceStartDate() {
        return priceStartDate;
    }

    public void setPriceStartDate(LocalDate priceStartDate) {
        this.priceStartDate = priceStartDate;
    }

    public LocalDate getPriceEndDate() {
        return priceEndDate;
    }

    public void setPriceEndDate(LocalDate priceEndDate) {
        this.priceEndDate = priceEndDate;
    }

    @Override
    public String toString() {
        return "Package{"
                + "packageID=" + packageID
                + ", roomTypeID=" + roomTypeID
                + ", hotelServiceID=" + hotelServiceID
                + ", price=" + price
                + ", priceStartDate=" + priceStartDate
                + ", priceEndDate=" + priceEndDate
                + '}';
    }
}
