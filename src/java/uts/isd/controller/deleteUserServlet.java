package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
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

public class deleteUserServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        UserManagerDAO manager = (UserManagerDAO) session.getAttribute("userManager");
        User user = (User)session.getAttribute("user");
        validator.clear(session);

        if (!validator.validateEmail(email)) {
            session.setAttribute("emailErr", "Error: Incorrect Email");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        } else if (!validator.validatePassword(password)) {
            session.setAttribute("passErr", "Error: Incorrect Password");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        } else {
            try {
                // Find the matching user
                user = manager.findUser(email, password);
                if ( user != null ) {
                  response.sendRedirect("deleteUserSuccessful.jsp");
                  manager.deleteUser(email);
                } else {
                    session.setAttribute("existErr", "Error: User Does Not Exist");
                    request.getRequestDispatcher("userEdit.jsp").include(request, response);
                }
            } catch (SQLException | NullPointerException ex) {
                System.out.println(ex.getMessage() == null ? "Incorrect Email or Password" : "Welcome");
            }
        }
    }

}
