/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.View;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author admin
 */
public class Bill {
    private int reservationID;
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    private int number_of_guest;
    private LocalDate reservationDate;
    private int room_ID;
    private String room_Name;
    private int room_price;
    private String hotel_Name;
    private LocalTime checkInTimeStart;
    private LocalTime checkInTimeEnd;
    private LocalTime checkOutTimeStart;
    private LocalTime checkOutTimeEnd;
    private String service_Name;
    private int service_ID;
    private int hotelService_price;
    private int account_ID;
    private String status;
    private int total_price;
    private int amount;
    
    public Bill() {
    }

    public Bill(int reservationID, LocalDate checkInDate, LocalDate checkOutDate, int number_of_guest, LocalDate reservationDate, int room_ID, String room_Name, int room_price, String hotel_Name, LocalTime checkInTimeStart, LocalTime checkInTimeEnd, LocalTime checkOutTimeStart, LocalTime checkOutTimeEnd, String service_Name, int service_ID, int hotelService_price, int account_ID, String status, int total_price, int amount) {
        this.reservationID = reservationID;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.number_of_guest = number_of_guest;
        this.reservationDate = reservationDate;
        this.room_ID = room_ID;
        this.room_Name = room_Name;
        this.room_price = room_price;
        this.hotel_Name = hotel_Name;
        this.checkInTimeStart = checkInTimeStart;
        this.checkInTimeEnd = checkInTimeEnd;
        this.checkOutTimeStart = checkOutTimeStart;
        this.checkOutTimeEnd = checkOutTimeEnd;
        this.service_Name = service_Name;
        this.service_ID = service_ID;
        this.hotelService_price = hotelService_price;
        this.account_ID = account_ID;
        this.status = status;
        this.total_price = total_price;
        this.amount = amount;
    }

    public int getReservationID() {
        return reservationID;
    }

    public void setReservationID(int reservationID) {
        this.reservationID = reservationID;
    }

    public LocalDate getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(LocalDate checkInDate) {
        this.checkInDate = checkInDate;
    }

    public LocalDate getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(LocalDate checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public int getNumber_of_guest() {
        return number_of_guest;
    }

    public void setNumber_of_guest(int number_of_guest) {
        this.number_of_guest = number_of_guest;
    }

    public LocalDate getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(LocalDate reservationDate) {
        this.reservationDate = reservationDate;
    }

    public int getRoom_ID() {
        return room_ID;
    }

    public void setRoom_ID(int room_ID) {
        this.room_ID = room_ID;
    }

    public String getRoom_Name() {
        return room_Name;
    }

    public void setRoom_Name(String room_Name) {
        this.room_Name = room_Name;
    }

    public int getRoom_price() {
        return room_price;
    }

    public void setRoom_price(int room_price) {
        this.room_price = room_price;
    }

    public String getHotel_Name() {
        return hotel_Name;
    }

    public void setHotel_Name(String hotel_Name) {
        this.hotel_Name = hotel_Name;
    }

    public LocalTime getCheckInTimeStart() {
        return checkInTimeStart;
    }

    public void setCheckInTimeStart(LocalTime checkInTimeStart) {
        this.checkInTimeStart = checkInTimeStart;
    }

    public LocalTime getCheckInTimeEnd() {
        return checkInTimeEnd;
    }

    public void setCheckInTimeEnd(LocalTime checkInTimeEnd) {
        this.checkInTimeEnd = checkInTimeEnd;
    }

    public LocalTime getCheckOutTimeStart() {
        return checkOutTimeStart;
    }

    public void setCheckOutTimeStart(LocalTime checkOutTimeStart) {
        this.checkOutTimeStart = checkOutTimeStart;
    }

    public LocalTime getCheckOutTimeEnd() {
        return checkOutTimeEnd;
    }

    public void setCheckOutTimeEnd(LocalTime checkOutTimeEnd) {
        this.checkOutTimeEnd = checkOutTimeEnd;
    }

    public String getService_Name() {
        return service_Name;
    }

    public void setService_Name(String service_Name) {
        this.service_Name = service_Name;
    }

    public int getService_ID() {
        return service_ID;
    }

    public void setService_ID(int service_ID) {
        this.service_ID = service_ID;
    }

    public int getHotelService_price() {
        return hotelService_price;
    }

    public void setHotelService_price(int hotelService_price) {
        this.hotelService_price = hotelService_price;
    }

    public int getAccount_ID() {
        return account_ID;
    }

    public void setAccount_ID(int account_ID) {
        this.account_ID = account_ID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    

    @Override
    public String toString() {
        return "Bill{" + "reservationID=" + reservationID + ", checkInDate=" + checkInDate + ", checkOutDate=" + checkOutDate + ", number_of_guest=" + number_of_guest + ", reservationDate=" + reservationDate + ", room_ID=" + room_ID + ", room_Name=" + room_Name + ", room_price=" + room_price + ", hotel_Name=" + hotel_Name + ", checkInTimeStart=" + checkInTimeStart + ", checkInTimeEnd=" + checkInTimeEnd + ", checkOutTimeStart=" + checkOutTimeStart + ", checkOutTimeEnd=" + checkOutTimeEnd + ", service_Name=" + service_Name + ", service_ID=" + service_ID + ", hotelService_price=" + hotelService_price + ", account_ID=" + account_ID + ", status=" + status + ", total_price=" + total_price + ", amount=" + amount + '}';
    }

    
}