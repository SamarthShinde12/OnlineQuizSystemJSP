package com.quiz.servlet;

import java.io.IOException;

import com.quiz.dao.QuestionDOA;
import com.quiz.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LoadQuestionServlet")
public class LoadQuestionServlet extends HttpServlet {
    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        QuestionDOA dao = new QuestionDOA();
        Question q = dao.getQuestionById(id);

        req.setAttribute("questionData", q);
        req.getRequestDispatcher("editQuestion.jsp").forward(req, res);
    }
}
