/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travelink.Servlet;

import com.travelink.Database.HotelDB;
import com.travelink.Database.OwnedHotelDB;
import com.travelink.Model.Account;
import com.travelink.Model.Hotel;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class UpdateHotelInformationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request   servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException           if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateHotelInformationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateHotelInformationServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

//        if (account == null) {
//            response.sendRedirect("HotelHost_Login.jsp");
//            return;
//        }
        //Phân Trang
        int page = 1;
        int recordsPerPage = 10;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

//        List<Hotel> hotel_list = OwnedHotelDB.getHotelsByAccountID(account.getAccount_ID());
        List<Hotel> hotel_list;
        int noOfRecords;
        hotel_list = HotelDB.getAllHotels();
        noOfRecords = hotel_list.size();
        // Calculate total number of pages
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        // Calculate the start and end indices for the current page
        int start = (page - 1) * recordsPerPage;
        int end = Math.min(start + recordsPerPage, noOfRecords);
        // Get the sublist for the current page

        hotel_list = hotel_list.subList(start, end);

        request.setAttribute("hotel_list", hotel_list);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);

//        request.setAttribute("hotel_list", hotel_list);
        request.getRequestDispatcher("HotelHost_HotelInformation.jsp").forward(request, response);
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
        String action = request.getParameter("action");

        switch (action) {
            case "update":
                updateHotel(request, response);
                break;
            case "add":
                addHotel(request, response);
                break;
            default:
                break;
        }
    }    

    private void updateHotel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int hotelID = Integer.parseInt(request.getParameter("hotelid"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String status = request.getParameter("status");
        Hotel newHotel = new Hotel(name, email, phone, address, status);
        
        
        if(HotelDB.updateHotel(newHotel, HotelDB.getHotelByID(hotelID))){
            request.getRequestDispatcher("UpdateHotelInformationServlet").forward(request, response);
        }
    }

    private void addHotel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String co taining servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

          