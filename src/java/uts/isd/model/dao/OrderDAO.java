/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model.dao;
import java.sql.*;
import uts.isd.model.Order;
/**
 *
 * @author Martin
 */

public class OrderDAO {
    private Connection conn;

    public OrderDAO(Connection conn) {
        this.conn = conn;
    }

    public void createOrder(Order order) throws SQLException {
        String query = "INSERT INTO Order (orderID, email, orderDate, status, paymentID) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, order.getOrderID());
        stmt.setString(2, order.getEmail());
        stmt.setDate(3, order.getOrderDate());
        stmt.setString(4, order.getStatus());
        stmt.setInt(5, order.getPaymentID());
        stmt.executeUpdate();
    }
    
    // add updateORder() and deleteOrder()
    
}
