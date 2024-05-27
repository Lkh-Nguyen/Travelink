/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Model;

/**
 *
 * @author ASUS
 */
public class FavouriteHotel {

  private int hotelID;
  private int customerID;

  public FavouriteHotel() {
    // Default constructor
  }

  public FavouriteHotel(int hotelID, int customerID) {
    this.hotelID = hotelID;
    this.customerID = customerID;
  }

  public int getHotelID() {
    return hotelID;
  }

  public void setHotelID(int hotelID) {
    this.hotelID = hotelID;
  }

  public int getCustomerID() {
    return customerID;
  }

  public void setCustomerID(int customerID) {
    this.customerID = customerID;
  }

  @Override
  public String toString() {
    return "FavouriteHotel{" +
        "hotelID=" + hotelID +
        ", customerID=" + customerID +
        '}';
  }
}

