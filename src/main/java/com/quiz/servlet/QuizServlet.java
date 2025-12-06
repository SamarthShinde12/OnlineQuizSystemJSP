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
import jakarta.servlet.http.HttpSession;

@WebServlet("/QuizServlet")
public class QuizServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();

        String countParam = req.getParameter("count");

        // If no count param, show start page
        if (countParam == null || countParam.trim().isEmpty()) {
            req.getRequestDispatcher("quiz.jsp").forward(req, res);
            return;
        }

        int count = 1;
        try {
            count = Integer.parseInt(countParam);
            if (count < 1) count = 1;
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Please enter a valid number of questions.");
            req.getRequestDispatcher("quiz.jsp").forward(req, res);
            return;
        }

        // Fetch questions from DAO
        QuestionDOA dao = new QuestionDOA();
        List<Question> questions = dao.getQuestion(count);

        if (questions == null || questions.isEmpty()) {
            req.setAttribute("error", "No questions available.");
            req.getRequestDispatcher("quiz.jsp").forward(req, res);
            return;
        }

        // Store questions in session for later use
        session.setAttribute("quizQuestions", questions);

        // Also pass to request for JSP rendering
        req.setAttribute("questions", questions);
        req.setAttribute("totalQuestions", questions.size());

        // Forward to quiz page
        req.getRequestDispatcher("quiz.jsp").forward(req, res);
    }
}
