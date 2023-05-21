package uts.isd.model;

import java.sql.Date;

public class Order {
    private int orderID;
    private String email;
    private Date orderDate;
    private String status;
    private int paymentID;

    // Default constructor
    public Order() {
    }

    // Constructor with all parameters
    public Order(int orderID, String email, Date orderDate, String status, int paymentID) {
        this.orderID = orderID;
        this.email = email;
        this.orderDate = orderDate;
        this.status = status;
        this.paymentID = paymentID;
    }
    
    public Order(String email, Date orderDate) {
        this.email = email;
        this.orderDate = orderDate;
        this.status = "Saved";  // Assuming a default status here.
        this.paymentID = 0;     // Assuming a default paymentID here.
    }
    
    // Getters and setters
    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }
}
