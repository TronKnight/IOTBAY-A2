package uts.isd.controller;

import uts.isd.model.Order;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "OrderServlet", urlPatterns = {"/OrderServlet"})
public class OrderServlet extends HttpServlet {
    private DBConnector db;
    private OrderDAO orderDao;
    private Connection conn;

    @Override
    public void init() {
        try {
            db = new DBConnector();
            conn = db.openConnection();
            orderDao = new OrderDAO(conn);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String orderDateStr = request.getParameter("orderDate");

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date orderDate = null;
        try {
            java.util.Date parsedDate = format.parse(orderDateStr);
            orderDate = new Date(parsedDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        Order order = new Order(email, orderDate);

        try {
            orderDao.createOrder(order);
            request.getRequestDispatcher("success.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
        try {
            db.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
