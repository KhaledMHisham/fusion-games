package gov.iti.fusion.servlets;

import gov.iti.fusion.utils.CookiesUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie cookie = CookiesUtils.getCookie(req.getCookies(), "auth_token");
        cookie.setValue("");
        cookie.setMaxAge(0);
        resp.addCookie(cookie);
        resp.sendRedirect("http://localhost:8888/fusion/home");
    }
}
