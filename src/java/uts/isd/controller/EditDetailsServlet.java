package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.dao.UserManagerDAO;

/**
 * @author Dev
 */
public class EditDetailsServlet extends HttpServlet {
    
    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String phoneNumber = request.getParameter("phonenum");
        String streetNumber = request.getParameter("streetnum");
        String streetName = request.getParameter("streetname");
        String suburb = request.getParameter("suburb");
        String state = request.getParameter("state");
        String postcode = request.getParameter("postcode");
        String country = request.getParameter("country");
        String confirmed = request.getParameter("cpass");
        UserManagerDAO manager = (UserManagerDAO) session.getAttribute("userManager");
        validator.clear(session);
        
        if ( !password.equals(confirmed) ) {
            session.setAttribute("matchErr", "Passwords do not match");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        } else if ( !validator.validateEmail(email) ) {
            session.setAttribute("emailErr", "Error: Incorrect Email Format");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        } else if ( !validator.validateFirstName(firstName) )  {
            session.setAttribute("fnameErr", "Error: Incorrect Name Format");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        } else if ( !validator.validateLastName(lastName) )  {
            session.setAttribute("lnameErr", "Error: Incorrect Name Format");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        } else if ( !validator.validatePassword(password) )  {
            session.setAttribute("passErr", "Error: Incorrect Password Format");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        } else if ( !validator.validatePhone(phoneNumber) )  {
            session.setAttribute("phoneErr", "Error: Incorrect Phone Format");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        } else if ( !validator.validateStreetNum(streetNumber) )  {
            session.setAttribute("streetNumErr", "Error: Incorrect Street Number Format");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        } else if ( !validator.validatePostcode(postcode) )  {
            session.setAttribute("postcodeErr", "Error: Incorrect Postcode Format");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        } else {   
            try {
                int userID = manager.getUserID(email);
                manager.updateUser(userID, firstName, lastName, email, password, phoneNumber, streetNumber, streetName, suburb, state, postcode, country);
                System.out.println(userID);
                System.out.println(firstName);
                System.out.println(lastName);
                System.out.println(email);
                System.out.println(password);
                System.out.println(phoneNumber);
                System.out.println(streetNumber);
                System.out.println(streetName);
                System.out.println("User Updated");
            } catch (SQLException | NullPointerException ex) {
                    System.out.println(ex.getMessage());
                    Logger.getLogger(EditDetailsServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        request.getRequestDispatcher("main.jsp").include(request, response);
        
    }
    
}