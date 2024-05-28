/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Model;

/**
 *
 * @author ASUS
 */
public class ReservedService {
    private int reserved_Service_ID;
    private byte amountOfDays;
    private int reservation_ID;
    private int hotel_Service_ID;

    // Constructor
    public ReservedService() {}

    // Getters and Setters
    public int getReserved_Service_ID() {
        return reserved_Service_ID;
    }

    public void setReserved_Service_ID(int reserved_Service_ID) {
        this.reserved_Service_ID = reserved_Service_ID;
    }

    public byte getAmountOfDays() {
        return amountOfDays;
    }

    public void setAmountOfDays(byte amountOfDays) {
        this.amountOfDays = amountOfDays;
    }

    public int getReservation_ID() {
        return reservation_ID;
    }

    public void setReservation_ID(int reservation_ID) {
        this.reservation_ID = reservation_ID;
    }

    public int getHotel_Service_ID() {
        return hotel_Service_ID;
    }

    public void setHotel_Service_ID(int hotel_Service_ID) {
        this.hotel_Service_ID = hotel_Service_ID;
    }

    // toString method
    @Override
    public String toString() {
        return "ReservedService{" +
                "reserved_Service_ID=" + reserved_Service_ID +
                ", amountOfDays=" + amountOfDays +
                ", reservation_ID=" + reservation_ID +
                ", hotel_Service_ID=" + hotel_Service_ID +
                '}';
    }
}

