
package com.travelink.Servlet;
import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/UploadFileServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, 
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 50) 
public class UploadImageAvatar extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            fileName = new File(fileName).getName();
            File imagesDir = new File(getServletContext().getRealPath("/img_Avatar"));
                if (!imagesDir.exists()) {
                imagesDir.mkdirs();
            }
           
            String uploadPath = getServletContext().getRealPath("/img_Avatar") + File.separator + fileName;
            part.write(uploadPath);    
            request.setAttribute("uploadedFilePath", fileName);
            break;
        }
        getServletContext().getRequestDispatcher("/jsp/View_Avatar.jsp").forward(request, response);
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
