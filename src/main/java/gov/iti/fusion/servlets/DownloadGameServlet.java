package gov.iti.fusion.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

public class DownloadGameServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("SHIT");
        String[] urlParts = request.getRequestURI().split("/");
        String fileName = urlParts[urlParts.length - 1];

        String filePath = "C:\\fusion-games\\games\\files\\" + fileName;

        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

        InputStream in = new FileInputStream(filePath);
        OutputStream out = response.getOutputStream();

        byte[] buffer = new byte[1024];
        int bytesRead = 0;
        while ((bytesRead = in.read(buffer)) != -1) {
            out.write(buffer, 0, bytesRead);
        }

        in.close();
        out.close();

        response.sendRedirect("/fusion/library-page");
    }
}
