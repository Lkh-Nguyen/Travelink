/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import com.travelink.Model.Province;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class ProvinceDB implements DatabaseInfo {

    public static List<Province> getAllProvince() {
        List<Province> provinces = new ArrayList<>();
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM province Order by name"; // Replace "province" with your actual table name
                statement = connection.createStatement();
                resultSet = statement.executeQuery(query);

                while (resultSet.next()) {
                    Province province = new Province();
                    province.setProvince_ID(resultSet.getInt("province_ID"));
                    province.setName(resultSet.getString("name"));
                    provinces.add(province);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting all provinces: " + e);
        }
        return provinces;
    }

    public static Province getProvinceByID(int id) {
        Province province = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseInfo.getConnect();

            if (connection != null) {
                String query = "SELECT * FROM province WHERE province_ID = ?"; // Replace "province" with your actual table name
                statement = connection.prepareStatement(query);
                statement.setInt(1, id); // Set the ID parameter
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    province = new Province();
                    province.setProvince_ID(resultSet.getInt("province_ID"));
                    province.setName(resultSet.getString("name"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting province by ID: " + e);
        }
        return province;
    }

    public static void main(String[] args) {
        List<Province> provinces;
        provinces = getAllProvince();

        System.out.println("List of Provinces:");
        for (Province province : provinces) {
            System.out.println("ID: " + province.getProvince_ID() + ", Name: " + province.getName());
        }
        
        int ID = 5;
        Province province = getProvinceByID(ID);
        System.out.println("Provinces with ID : " + ID);
        System.out.println("ID: " + province.getProvince_ID() + ", Name: " + province.getName());
    }
}
