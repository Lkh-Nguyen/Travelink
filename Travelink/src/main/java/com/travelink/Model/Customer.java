/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Model;

import java.sql.Date;

public class Customer {

    private int customer_ID;
    private String email;
    private String password;
    private String cmnd;
    private String name;
    private char gender;
    private java.sql.Date dateOfBirth;
    private String phoneNumber;
    private String avatarURL;
    private String address;

    public int getCustomer_ID() {
        return customer_ID;
    }

    public void setCustomer_ID(int customer_ID) {
        this.customer_ID = customer_ID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCmnd() {
        return cmnd;
    }

    public void setCmnd(String cmnd) {
        this.cmnd = cmnd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public char getGender() {
        return gender;
    }

    public void setGender(char gender) {
        this.gender = gender;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAvatarURL() {
        return avatarURL;
    }

    public void setAvatarURL(String avatarURL) {
        this.avatarURL = avatarURL;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    // Getters and Setters (omitted for brevity)
    public Customer(String email, String password, String cmnd, String name, char gender, java.sql.Date dateOfBirth, String phoneNumber, String avatarURL, String address) {
        this.email = email;
        this.password = password;
        this.cmnd = cmnd;
        this.name = name;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.avatarURL = avatarURL;
        this.address = address;
    }

    
    // Additional methods (optional)
    // - toString() method for printing object details
    // - Validation methods for specific fields (e.g., email format)

    public Customer(String email, String password, String name, String phoneNumber) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.phoneNumber = phoneNumber;
    }
   public Customer() {
    }

    public Customer(int customer_ID, String email, String password, String cmnd, String name, char gender, Date dateOfBirth, String phoneNumber, String avatarURL, String address) {
        this.customer_ID = customer_ID;
        this.email = email;
        this.password = password;
        this.cmnd = cmnd;
        this.name = name;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.avatarURL = avatarURL;
        this.address = address;
    }

    public Customer(String email, String name, String phoneNumber) {
        this.email = email;
        this.name = name;
        this.phoneNumber = phoneNumber;
    }

    public Customer(String email, String name) {
        this.email = email;
        this.name = name;
    }

    public Customer(String email, String password, String name, String phoneNumber, String avatarURL) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.avatarURL = avatarURL;
    }

    @Override
    public String toString() {
        return "Customer{" + "customer_ID=" + customer_ID + ", email=" + email + ", password=" + password + ", cmnd=" + cmnd + ", name=" + name + ", gender=" + gender + ", dateOfBirth=" + dateOfBirth + ", phoneNumber=" + phoneNumber + ", avatarURL=" + avatarURL + ", address=" + address + '}';
    }
    
    
}