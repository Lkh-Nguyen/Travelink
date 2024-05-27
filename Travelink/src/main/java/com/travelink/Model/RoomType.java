/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Model;

/**
 *
 * @author ASUS
 */
public class RoomType {

    private int roomTypeID;
    private String name; // Not null
    private String roomDescription;
    private int capacity;
    private int totalRooms;
    private int hotelID;

    // Getters and Setters
    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRoomDescription() {
        return roomDescription;
    }

    public void setRoomDescription(String roomDescription) {
        this.roomDescription = roomDescription;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getTotalRooms() {
        return totalRooms;
    }

    public void setTotalRooms(int totalRooms) {
        this.totalRooms = totalRooms;
    }

    public int getHotelID() {
        return hotelID;
    }

    public void setHotelID(int hotelID) {
        this.hotelID = hotelID;
    }

    // Optional: Constructor
    public RoomType(int roomTypeID, String name, String roomDescription, int capacity, int totalRooms, int hotelID) {
        this.roomTypeID = roomTypeID;
        this.name = name;
        this.roomDescription = roomDescription;
        this.capacity = capacity;
        this.totalRooms = totalRooms;
        this.hotelID = hotelID;
    }

    public RoomType() {
    }

    // Optional: Override toString() for better printing
    @Override
    public String toString() {
        return "RoomType{"
                + "roomTypeID=" + roomTypeID
                + ", name='" + name + '\''
                + ", roomDescription='" + roomDescription + '\''
                + ", capacity=" + capacity
                + ", totalRooms=" + totalRooms
                + ", hotelID=" + hotelID
                + '}';
    }
}
