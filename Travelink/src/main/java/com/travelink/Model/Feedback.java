/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Model;

import java.sql.Date;

/**
 *
 * @author ASUS
 */
public class Feedback {

  private int feedbackID;
  private String description;
  private byte rating; // Assuming rating is stored as a byte (0-127)
  private java.sql.Date date;
  private int likesCount;
  private int dislikesCount;
  private int account_ID;
  private int hotelID;

  public Feedback() {
    // Default constructor
  }

    public Feedback(String description, byte rating, Date date, int likesCount, int dislikesCount, int account_ID, int hotelID) {
        this.description = description;
        this.rating = rating;
        this.date = date;
        this.likesCount = likesCount;
        this.dislikesCount = dislikesCount;
        this.account_ID = account_ID;
        this.hotelID = hotelID;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public byte getRating() {
        return rating;
    }

    public void setRating(byte rating) {
        this.rating = rating;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getLikesCount() {
        return likesCount;
    }

    public void setLikesCount(int likesCount) {
        this.likesCount = likesCount;
    }

    public int getDislikesCount() {
        return dislikesCount;
    }

    public void setDislikesCount(int dislikesCount) {
        this.dislikesCount = dislikesCount;
    }

    public int getAccount_ID() {
        return account_ID;
    }

    public void setAccount_ID(int account_ID) {
        this.account_ID = account_ID;
    }

    public int getHotelID() {
        return hotelID;
    }

    public void setHotelID(int hotelID) {
        this.hotelID = hotelID;
    }

    @Override
    public String toString() {
        return "Feedback{" + "feedbackID=" + feedbackID + ", description=" + description + ", rating=" + rating + ", date=" + date + ", likesCount=" + likesCount + ", dislikesCount=" + dislikesCount + ", account_ID=" + account_ID + ", hotelID=" + hotelID + '}';
    }


}
