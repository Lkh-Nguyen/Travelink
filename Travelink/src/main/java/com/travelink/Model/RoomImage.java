/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Model;

/**
 *
 * @author ASUS
 */
public class RoomImage {

    private int roomImageID;
    private String name; // Optional: Name of the image
    private String url; // Not null, image URL
    private int roomTypeID;

    // Getters and Setters
    public int getRoomImageID() {
        return roomImageID;
    }

    public void setRoomImageID(int roomImageID) {
        this.roomImageID = roomImageID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public RoomImage() {
    }

    // Optional: Constructor
    public RoomImage(int roomImageID, String name, String url, int roomTypeID) {
        this.roomImageID = roomImageID;
        this.name = name;
        this.url = url;
        this.roomTypeID = roomTypeID;
    }

    // Optional: Override toString() for better printing
    @Override
    public String toString() {
        return "RoomImage{"
                + "roomImageID=" + roomImageID
                + ", name='" + name + '\''
                + ", url='" + url + '\''
                + ", roomTypeID=" + roomTypeID
                + '}';
    }
}
