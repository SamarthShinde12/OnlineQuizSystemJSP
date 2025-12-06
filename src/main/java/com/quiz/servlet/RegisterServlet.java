package com.quiz.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.quiz.dao.DataAccessException;
import com.quiz.dao.UserDOA;
import com.quiz.model.User;
import com.quiz.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet{
		@Override
		protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			
			User u = new User(username, password, "user");
			try {
			    boolean success = UserDOA.registerUser(u);

			    if (success) {
			        res.sendRedirect("login.jsp?success=1");
			    } else {
			        req.setAttribute("error", "Registration failed!");
			        req.getRequestDispatcher("register.jsp").forward(req, res);
			    }

			} catch (DataAccessException e) {
			    req.setAttribute("error", "Username Exist allready: " + e.getMessage());
			    req.getRequestDispatcher("register.jsp").forward(req, res);
			}

		}
}
