package com.quiz.servlet;

import java.io.IOException;

import com.quiz.dao.UserDOA;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        String role = UserDOA.loginUser(username, password);

        if (role != null) {
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);

            if (role.equals("admin")) {
                res.sendRedirect("admin-home.jsp");
            } else {
                res.sendRedirect("user-home.jsp");
            }

        } else {
            req.setAttribute("error", "Invalid Username or Password!");
            req.getRequestDispatcher("login.jsp").forward(req, res);
        }
    }
}
