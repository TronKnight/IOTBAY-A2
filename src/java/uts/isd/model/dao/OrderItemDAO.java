/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model.dao;

import java.sql.*;
import uts.isd.model.OrderItem;
/**
 *
 * @author martin
 */

public class OrderItemDAO {
    private Connection conn;

    public OrderItemDAO(Connection conn) {
        this.conn = conn;
    }

    public void createOrderItem(OrderItem orderItem) throws SQLException {
        String query = "INSERT INTO OrderItem (itemID, orderID, itemName, quantity) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, orderItem.getItemID());
        stmt.setInt(2, orderItem.getOrderID());
        stmt.setString(3, orderItem.getItemName());
        stmt.setInt(4, orderItem.getQuantity());
        stmt.executeUpdate();
    }

    // add updateORder() and deleteOrder()
}
