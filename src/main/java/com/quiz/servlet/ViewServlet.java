package com.quiz.servlet;

import java.io.IOException;
import java.util.List;

import com.quiz.dao.QuestionDOA;
import com.quiz.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        loadQuestions(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        loadQuestions(req, res);
    }

    private void loadQuestions(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        QuestionDOA dao = new QuestionDOA();
        List<Question> list = dao.allQuestion();

        req.setAttribute("allQuestion", list);

        req.getRequestDispatcher("viewQuestions.jsp").forward(req, res);
    }
}
