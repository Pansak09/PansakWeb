/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestSQLSelect {

    public static void main(String[] args) {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/order",
                    "root", "venus_123456");

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(
                    "SELECT * FROM food WHERE name=''orange");
            String name, type, taste, toppings;
            double price;

            while (resultSet.next()) {
                name = resultSet.getString("foodname");
                type = resultSet.getString("type").trim();
                taste = resultSet.getString("taste").trim();
                toppings = resultSet.getString("toppings").trim();
                price = resultSet.getDouble("price");

                System.out.println("Name: " + name
                        + ", Type: " + type
                        + ", Taste: " + taste
                        + ", Toppings: " + toppings
                        + ", Price: " + price);
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException exception) {
            System.out.println(exception);
        }
    }
}