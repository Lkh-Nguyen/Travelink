/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travelink.Servlet;

import com.travelink.Database.FeedbackDB;
import com.travelink.Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DUYAN
 */
public class ReactFeedbackServlet extends HttpServlet {

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
            out.println("<title>Servlet ReactFeedbackServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReactFeedbackServlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        int feedbackID = Integer.parseInt(request.getParameter("feedbackID"));
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        int accountID = account.getAccount_ID();

        try {
            switch (action) {
                case "like":
                    handleLikeAction(accountID, feedbackID);
                    break;
                case "unlike":
                    handleUnlikeAction(accountID, feedbackID);
                    break;
                case "dislike":
                    handleDislikeAction(accountID, feedbackID);
                    break;
                case "undislike":
                    handleUndislikeAction(accountID, feedbackID);
                    break;
            }
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (SQLException ex) {
            Logger.getLogger(ReactFeedbackServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private void handleLikeAction(int accountID, int feedbackID) throws SQLException {
        if (!FeedbackDB.hasUserLikedFeedback(accountID, feedbackID)) {
            FeedbackDB.incrementLikesCount(feedbackID);
            FeedbackDB.addUserFeedbackLike(accountID, feedbackID);
        }
    }

    private void handleUnlikeAction(int accountID, int feedbackID) throws SQLException {
        if (FeedbackDB.hasUserLikedFeedback(accountID, feedbackID)) {
            FeedbackDB.decrementLikesCount(feedbackID);
            FeedbackDB.removeUserLike(accountID, feedbackID);
        }
    }

    private void handleDislikeAction(int accountID, int feedbackID) throws SQLException {
        if (!FeedbackDB.hasUserDislikedFeedback(accountID, feedbackID)) {
            FeedbackDB.incrementDisLikesCount(feedbackID);
            FeedbackDB.addUserFeedbackDislike(accountID, feedbackID);
        }
    }

    private void handleUndislikeAction(int accountID, int feedbackID) throws SQLException {
        if (FeedbackDB.hasUserDislikedFeedback(accountID, feedbackID)) {
            FeedbackDB.decrementDisLikesCount(feedbackID);
            FeedbackDB.removeUserDislike(accountID, feedbackID);
        }
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
