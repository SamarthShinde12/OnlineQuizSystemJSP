package com.quiz.servlet;

import java.io.IOException;
import java.util.*;
import com.quiz.model.Question;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SubmitQuizServlet")
public class SubmitQuizServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        List<Question> qList = (List<Question>) session.getAttribute("quizQuestions");

        if (qList == null || qList.isEmpty()) {
            res.sendRedirect("quiz.jsp");
            return;
        }

        int score = 0;
        List<Map<String, Object>> details = new ArrayList<>();

        for (Question q : qList) {
            String userAnsStr = req.getParameter("q" + q.getId());
            Integer userAns = null;

            try {
                if (userAnsStr != null && !userAnsStr.trim().isEmpty()) {
                    userAns = Integer.parseInt(userAnsStr.trim());
                }
            } catch (NumberFormatException e) {
                // Ignore invalid input
            }

            if (userAns != null && userAns.equals(q.getCorrectAnswer())) {
                score++;
            }

            Map<String, Object> row = new HashMap<>();
            row.put("question", q.getQuestionText());
            row.put("options", q.getOptions());
            row.put("selected", userAns);
            row.put("correct", q.getCorrectAnswer());
            details.add(row);
        }

        req.setAttribute("score", score);
        req.setAttribute("total", qList.size());
        req.setAttribute("details", details);

        // Optional: Save score to DB for leaderboard
        // Integer userId = (Integer) session.getAttribute("userId");
        // if(userId != null) saveScore(userId, score, qList.size());

        // Clear quiz from session after submission
        session.removeAttribute("quizQuestions");

        req.getRequestDispatcher("result.jsp").forward(req, res);
    }
}
