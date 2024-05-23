
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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Random;

/**
 *
 * @author DUYAN
 */
public class RegisterServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet RegisterServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("Form_Login.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //Taking user input
        String name  = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        //Check customer existed
        Customer c = CustomerDB.getCustomer(email);
        if (c != null){
            request.setAttribute("errorLogin", "Email existed! You can not create account.");
            request.getRequestDispatcher("Form_Login.jsp").forward(request, response);
            return;
        }
        //Create customer
        c = new Customer(email, password, name, phone);
        c.setAvatarURL("/Travelink/img_Avatar/avatar_default.jpg");
        //Random token
        Random rand = new Random();
        int token = rand.nextInt(900000) + 100000; 
        String cToken = ((Integer) token).toString();
        //Store info of customer and token on session
        request.getSession().setAttribute("cToken", cToken);
        request.getSession().setAttribute("newCustomer", c);
        //Send email token
        SendEmail mail = new SendEmail();
        mail.sendRegisterToken(email, token);
        //Request to verify code jsp
        HttpSession session = request.getSession();
        session.setAttribute("action", "registerCustomer");        
        response.sendRedirect("Verify_Code.jsp");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}