package com.quiz.servlet;

import java.io.IOException;

import com.quiz.dao.QuestionDOA;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteQuestionServlet")
public class DeleteQuestionServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		int id =Integer.parseInt(req.getParameter("id"));
		QuestionDOA doa = new QuestionDOA();
		boolean deleted = doa.deleteQuestion(id);
		
		if(deleted) {
			req.getSession().setAttribute("success", "Question Deleted Successfully!");
		}else {
			req.getSession().setAttribute("error", "Failed to delete a Question!");
		}
			resp.sendRedirect("ViewServlet");
		}catch(Exception e) {
			req.getSession().setAttribute("error", "Failed to delete a Question!");
			resp.sendRedirect("ViewServlet");
		}
	}
}
