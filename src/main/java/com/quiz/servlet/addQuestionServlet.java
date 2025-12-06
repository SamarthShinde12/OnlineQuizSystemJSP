package com.quiz.servlet;

import java.io.IOException;

import com.quiz.dao.DataAccessException;
import com.quiz.dao.QuestionDOA;
import com.quiz.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddQuestionServlet")
public class addQuestionServlet extends HttpServlet{
		
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String question = req.getParameter("question");
		String optA = req.getParameter("optA");
		String optB = req.getParameter("optB");
		String optC = req.getParameter("optC");
		String optD = req.getParameter("optD");
		String correction = req.getParameter("correct"); 
		
		int correct = Integer.parseInt(correction);
		
		String[] option= {optA, optB, optC, optD};
		Question q = new Question(question, option,correct);
		
		QuestionDOA doa = new QuestionDOA();
		try {
		boolean success = doa.addQuestion(q);
		if (success) {
	        res.sendRedirect("addQuestion.jsp?success=1");
	    } else {
	        req.setAttribute("error", "Failed to Save!");
	        req.getRequestDispatcher("addQuestion.jsp").forward(req, res);
	    }

	} catch (DataAccessException e) {
	    req.setAttribute("error", "Question Exist allready: " + e.getMessage());
	    req.getRequestDispatcher("addQuestion.jsp").forward(req, res);
	}
	}
}
