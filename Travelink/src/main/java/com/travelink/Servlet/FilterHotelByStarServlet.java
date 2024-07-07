/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travelink.Servlet;

import com.travelink.Database.HotelImageDB;
import com.travelink.Model.Hotel;
import com.travelink.Model.HotelImage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FilterHotelByStarServlet", urlPatterns = {"/filterHotelByStarServlet"})
public class FilterHotelByStarServlet extends HttpServlet {

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
            out.println("<title>Servlet FilterHotelByStarServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterHotelByStarServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        String location = request.getParameter("location");
        int people = Integer.parseInt(request.getParameter("people"));
        int roomSize = Integer.parseInt(request.getParameter("room"));
        int star = Integer.parseInt(request.getParameter("star"));
        List<Hotel> hotelList = (List<Hotel>) session.getAttribute("hotelList");
        request.setAttribute("location", location);
        request.setAttribute("people", people);
        request.setAttribute("room", roomSize);
        List<Hotel> filteredHotels = new ArrayList<>();
        for (Hotel h : hotelList) {
            if (h.getStar() == star) {
                filteredHotels.add(h);
            }
        }
        List<String> hotelImageList = new ArrayList<>();
        for (int i = 0; i < filteredHotels.size(); i++) {
            List<HotelImage> hotelImgList = HotelImageDB.getHotelImagesByHotelID(filteredHotels.get(i).getHotel_ID());
            PrintWriter printWriter = response.getWriter();

            String img = hotelImgList.get(0).getUrl();
            hotelImageList.add(img);
        }
        request.setAttribute("star", star);
        request.setAttribute("filterStarList", filteredHotels);
        request.setAttribute("hotelImgList", hotelImageList);
        request.getRequestDispatcher("Search_Hotel.jsp").forward(request, response);
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
        processRequest(request, response);
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
