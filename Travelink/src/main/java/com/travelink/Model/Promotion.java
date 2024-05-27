/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Model;

/**
 *
 * @author ASUS
 */
public class Promotion {

  private int promotionID;
  private String name;
  private int discount;
  private java.sql.Date startDate;
  private java.sql.Date endDate;

  public Promotion() {
    // Default constructor
  }

  public Promotion(int promotionID, String name, int discount, java.sql.Date startDate, 
                     java.sql.Date endDate) {
    this.promotionID = promotionID;
    this.name = name;
    this.discount = discount;
    this.startDate = startDate;
    this.endDate = endDate;
  }

  // Getters and Setters for all member variables

  public int getPromotionID() {
    return promotionID;
  }

  public void setPromotionID(int promotionID) {
    this.promotionID = promotionID;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getDiscount() {
    return discount;
  }

  public void setDiscount(int discount) {
    this.discount = discount;
  }

  public java.sql.Date getStartDate() {
    return startDate;
  }

  public void setStartDate(java.sql.Date startDate) {
    this.startDate = startDate;
  }

  public java.sql.Date getEndDate() {
    return endDate;
  }

  public void setEndDate(java.sql.Date endDate) {
    this.endDate = endDate;
  }

  @Override
  public String toString() {
    return "Promotion{" +
        "promotionID=" + promotionID +
        ", name='" + name + '\'' +
        ", discount=" + discount +
        ", startDate=" + startDate +
        ", endDate=" + endDate +
        '}';
  }
}
