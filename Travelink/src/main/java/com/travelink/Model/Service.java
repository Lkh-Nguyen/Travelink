/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Model;

/**
 *
 * @author ASUS
 */
public class Service {

    private int serviceID;
    private String name;

    public Service() {
        // Default constructor
    }

    public Service(int serviceID, String name) {
        this.serviceID = serviceID;
        this.name = name;
    }

    // Getters and Setters for member variables
    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Service{"
                + "serviceID=" + serviceID
                + ", name='" + name + '\''
                + '}';
    }
}
