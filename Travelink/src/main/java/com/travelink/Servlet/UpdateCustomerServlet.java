/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travelink.Servlet;

import com.travelink.Database.CustomerDB;
import com.travelink.Model.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author MSI
 */
public class UpdateCustomerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateCustomerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateCustomerServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String dob = request.getParameter("DOB");
        String cmnd = request.getParameter("CMND");
        String phone = request.getParameter("phone");
        String genderJsp = request.getParameter("gender");
        System.out.println(genderJsp);
        String address = request.getParameter("address");
        java.sql.Date dateOfBirth = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            dateOfBirth = new java.sql.Date(dateFormat.parse(dob).getTime());
        } catch (ParseException e) {
            e.printStackTrace(); // Handle parsing exception appropriately
        }
        String phoneStr = null;
        if (phone == null) {
            phoneStr = null;
        } else if (phone != null) {
            phoneStr = phone;
        }
        char gender = ' ';
        if (genderJsp == null) {
            gender = ' ';
        } else if (genderJsp.contains("Male")) {
            gender = 'M';
        } else if (genderJsp.contains("Female")) {
            gender = 'F';
        }
        Customer newCustomer = new Customer(email, cmnd, name, gender, dateOfBirth, phoneStr, address);
        Customer oldCustomer = CustomerDB.getCustomer(email);
        newCustomer.setCustomer_ID(oldCustomer.getCustomer_ID());
        newCustomer.setPassword(oldCustomer.getPassword());
        newCustomer.setAvatarURL(oldCustomer.getAvatarURL());
        newCustomer.setAddress(oldCustomer.getAddress());
        newCustomer.setAddress(address);
        Customer customerUpdate = CustomerDB.updateCustomer(oldCustomer, newCustomer);
        HttpSession hs = request.getSession();
        hs.setAttribute("customer", customerUpdate);
        request.setAttribute("statusUpdate", "Update successfully customer !!!");
        PrintWriter printWriter = response.getWriter();
        request.getRequestDispatcher("My_Account_Update.jsp").forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
