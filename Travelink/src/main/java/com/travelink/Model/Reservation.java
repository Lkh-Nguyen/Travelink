/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Model;

/**
 *
 * @author ASUS
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.math.BigDecimal;
import java.time.LocalDate;

/**
 *
 * @author ASUS
 */
public class Reservation {

    private int reservationID;
    private LocalDate reservationDate;
    private int number_of_guests;
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    private BigDecimal totalPrice;
    private String paymentMethod;
    private String status;
    private int customerID;

    // Default constructor
    public Reservation() {
    }

    //All attributes
    public Reservation(LocalDate reservationDate, int number_of_guests, LocalDate checkInDate, LocalDate checkOutDate, BigDecimal totalPrice, String paymentMethod, String status, int customerID) {
        this.reservationDate = reservationDate;
        this.number_of_guests = number_of_guests;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.customerID = customerID;
    }


    public int getNumber_of_guests() {
        return number_of_guests;
    }

    public void setNumber_of_guests(int number_of_guests) {
        this.number_of_guests = number_of_guests;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }



    public int getReservationID() {
        return reservationID;
    }

    public void setReservationID(int reservationID) {
        this.reservationID = reservationID;
    }

    public LocalDate getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(LocalDate reservationDate) {
        this.reservationDate = reservationDate;
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

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    @Override
    public String toString() {
        return "Reservation{" + "reservationID=" + reservationID + ", reservationDate=" + reservationDate + ", number_of_guests=" + number_of_guests + ", checkInDate=" + checkInDate + ", checkOutDate=" + checkOutDate + ", totalPrice=" + totalPrice + ", paymentMethod=" + paymentMethod + ", status=" + status + ", customerID=" + customerID + '}';
    }

}
