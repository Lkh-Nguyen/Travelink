/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Model;

import java.time.LocalTime;

/**
 *
 * @author ASUS
 */
public class Hotel {

    private int hotel_ID;
    private String name;
    private String email;
    private String password; // Consider using a secure hashing mechanism for password storage
    private int star;
    private String phoneNumber;
    private String description;
    private LocalTime checkInTime;
    private LocalTime checkOutTime;
    private String address;
    private int ward_ID;

    // Getters and Setters
    public int getHotel_ID() {
        return hotel_ID;
    }

    public void setHotel_ID(int hotel_ID) {
        this.hotel_ID = hotel_ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        // Implement secure hashing mechanism before storing password
        this.password = password;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalTime getCheckInTime() {
        return checkInTime;
    }

    public void setCheckInTime(LocalTime checkInTime) {
        this.checkInTime = checkInTime;
    }

    public LocalTime getCheckOutTime() {
        return checkOutTime;
    }

    public void setCheckOutTime(LocalTime checkOutTime) {
        this.checkOutTime = checkOutTime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getWard_ID() {
        return ward_ID;
    }

    public void setWard_ID(int ward_ID) {
        this.ward_ID = ward_ID;
    }

    public Hotel() {
    }

    // Optional: Constructor
    public Hotel(int hotel_ID, String name, String email, String password, int star,
            String phoneNumber, String description, LocalTime checkInTime, LocalTime checkOutTime,
            String address, int ward_ID) {
        this.hotel_ID = hotel_ID;
        this.name = name;
        this.email = email;
        this.password = password;
        this.star = star;
        this.phoneNumber = phoneNumber;
        this.description = description;
        this.checkInTime = checkInTime;
        this.checkOutTime = checkOutTime;
        this.address = address;
        this.ward_ID = ward_ID;
    }

    // Optional: Override toString() for better printing
    @Override
    public String toString() {
        return "Hotel{"
                + "hotel_ID=" + hotel_ID
                + ", name='" + name + '\''
                + ", email='" + email + '\''
                + ", star=" + star
                + ", phoneNumber='" + phoneNumber + '\''
                + ", description='" + description + '\''
                + ", checkInTime=" + checkInTime
                + ", checkOutTime=" + checkOutTime
                + ", address='" + address + '\''
                + ", ward_ID=" + ward_ID
                + '}';
    }
}
