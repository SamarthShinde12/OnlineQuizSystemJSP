package com.quiz.servlet;

import java.io.IOException;

import com.quiz.dao.QuestionDOA;
import com.quiz.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EditQuestionServlet")
public class UpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String question = req.getParameter("question");
            String optA = req.getParameter("optA");
            String optB = req.getParameter("optB");
            String optC = req.getParameter("optC");
            String optD = req.getParameter("optD");
            int correct = Integer.parseInt(req.getParameter("correct"));

            String[] options = { optA, optB, optC, optD };
            Question q = new Question(id, question, options, correct);

            QuestionDOA dao = new QuestionDOA();
            boolean isUpdated = dao.updateQuestion(q);

            if (isUpdated) {

                
                HttpSession session = req.getSession();
                session.setAttribute("success", "Question Updated Successfully!");

                res.sendRedirect("ViewServlet"); 
                return;
            }

            
            req.setAttribute("error", "Failed to update question!");
            req.setAttribute("questionData", dao.getQuestionById(id));
            req.getRequestDispatcher("editQuestion.jsp").forward(req, res);

        } catch (Exception e) {

            req.setAttribute("error", "Invalid Input or Update Failed!");
            req.getRequestDispatcher("editQuestion.jsp").forward(req, res);
        }
    }
}
