/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
import uts.isd.model.dao.StaffDAO;
import uts.isd.model.dao.UserManagerDAO;

/**
 * @author Dev
 */
public class StaffEditServlet extends HttpServlet {
    
    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String phoneNumber = request.getParameter("phonenum");
        String country = request.getParameter("country");
        String confirmed = request.getParameter("cpass");
        StaffDAO manager = (StaffDAO) session.getAttribute("staffManager");
        validator.clear(session);
        
        if ( !password.equals(confirmed) ) {
            session.setAttribute("matchErr", "Passwords do not match");
            request.getRequestDispatcher("staffEdit.jsp").include(request, response);
        } else if ( !validator.validateEmail(email) ) {
            session.setAttribute("emailErr", "Error: Incorrect Email Format");
            request.getRequestDispatcher("staffEdit.jsp").include(request, response);
        } else if ( !validator.validateFirstName(firstName) )  {
            session.setAttribute("fnameErr", "Error: Incorrect Name Format");
            request.getRequestDispatcher("staffEdit.jsp").include(request, response);
        } else if ( !validator.validateLastName(lastName) )  {
            session.setAttribute("lnameErr", "Error: Incorrect Name Format");
            request.getRequestDispatcher("staffEdit.jsp").include(request, response);
        } else if ( !validator.validatePassword(password) )  {
            session.setAttribute("passErr", "Error: Incorrect Password Format");
            request.getRequestDispatcher("staffEdit.jsp").include(request, response);
        } else if ( !validator.validatePhone(phoneNumber) )  {
            session.setAttribute("phoneErr", "Error: Incorrect Phone Format");
            request.getRequestDispatcher("staffEdit.jsp").include(request, response);
        } else {   
            try {
                int userID = manager.getStaffID(email);
                manager.updateStaff(userID, firstName, lastName, email, password, phoneNumber, country);
                System.out.println(userID);
                System.out.println(firstName);
                System.out.println(lastName);
                System.out.println(email);
                System.out.println(password);
                System.out.println(phoneNumber);
                System.out.println("Staff Updated");
            } catch (SQLException | NullPointerException ex) {
                    System.out.println(ex.getMessage());
                    Logger.getLogger(EditDetailsServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        request.getRequestDispatcher("staffMain.jsp").include(request, response);
        
    }
    
}