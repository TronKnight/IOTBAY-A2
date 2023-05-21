package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.User;
import uts.isd.model.dao.UserManagerDAO;

/**
 * @author Dev
 */
public class AccLogsServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserManagerDAO manager = (UserManagerDAO) session.getAttribute("userManager");
        ArrayList<User> logs = new ArrayList<>();
        User user = (User) session.getAttribute("user");
        String email = user.getEmail();
        String password = user.getPassword();
        try {
            // Get an Array of the Account Logs
            int userID = manager.getUserID(email);
            logs = manager.getStatusLogs(userID);
            session.setAttribute("logs", logs);

        } catch (SQLException | NullPointerException ex) {
            System.out.println(ex.getMessage());
        }
            request.getRequestDispatcher("userLogs.jsp").include(request, response);
    }
}
