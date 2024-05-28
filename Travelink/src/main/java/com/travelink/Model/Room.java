/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Model;

/**
 *
 * @author ASUS
 */
public class Room {
    private int room_ID;
    private String name;
    private String roomDescription;
    private int capacity;
    private int totalRooms;
    private int price;
    private int hotel_ID;

    // Constructor
    public Room() {}

    // Getters and Setters
    public int getRoom_ID() {
        return room_ID;
    }

    public void setRoom_ID(int room_ID) {
        this.room_ID = room_ID;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getHotel_ID() {
        return hotel_ID;
    }

    public void setHotel_ID(int hotel_ID) {
        this.hotel_ID = hotel_ID;
    }

    public Room(String name, String roomDescription, int capacity, int totalRooms, int price, int hotel_ID) {
        this.name = name;
        this.roomDescription = roomDescription;
        this.capacity = capacity;
        this.totalRooms = totalRooms;
        this.price = price;
        this.hotel_ID = hotel_ID;
    }

    @Override
    public String toString() {
        return "Room{" + "room_ID=" + room_ID + ", name=" + name + ", roomDescription=" + roomDescription + ", capacity=" + capacity + ", totalRooms=" + totalRooms + ", price=" + price + ", hotel_ID=" + hotel_ID + '}';
    }
}

