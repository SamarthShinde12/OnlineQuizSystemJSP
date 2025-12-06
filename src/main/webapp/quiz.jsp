<%@ page import="java.util.*, com.quiz.dao.QuestionDOA, com.quiz.model.Question" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Start Quiz</title>

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<style>
    body {
        background:#0d0d0d;
        color:white;
        font-family:Poppins, sans-serif;
    }

    .center-box {
        max-width:700px;
        margin:40px auto;
    }

    .input-box, .quiz-box {
        background:rgba(255,255,255,0.12);
        padding:25px;
        border-radius:12px;
        animation: fadeIn .6s ease-in-out;
    }

    .q-box {
        background:rgba(255,255,255,0.10);
        padding:20px;
        border-radius:12px;
        margin-bottom:20px;
    }

    .btn-java {
        background:#fcca3f;
        color:black;
        font-weight:600;
    }

    .back-btn {
        background:#555;
        color:white;
        font-weight:600;
    }
</style>
</head>

<body>

<div class="container">

    <%
        String countParam = request.getParameter("count");

        // If user has not entered question count yet
        if (countParam == null) {
    %>

    <div class="center-box">
        <div class="input-box">
            <h3 class="text-warning text-center">Start Your Java Quiz</h3>

            <form method="get" action="quiz.jsp" class="mt-3">
                <label class="form-label">How many questions do you want?</label>
                <input type="number" name="count" min="1" max="50" required class="form-control">
                <button class="btn btn-java w-100 mt-3">Load Quiz</button>
            </form>

            <a href="user-home.jsp" class="btn back-btn w-100 mt-3">⬅ Back</a>
        </div>
    </div>

    <% 
        } else { 
            int count = Integer.parseInt(countParam);
            QuestionDOA dao = new QuestionDOA();
            List<Question> qList = dao.getQuestion(count);

            session.setAttribute("quizQuestions", qList);
    %>

    <div class="center-box">
        <div class="quiz-box">

            <h3 class="text-warning text-center">Java Quiz</h3>
            <p class="text-center mb-4">Answer all questions below:</p>

            <form action="SubmitQuizServlet" method="post">

                <%
                    int index = 1;
                    for (Question q : qList) {
                %>

                <div class="q-box">
                    <h5><%= index++ %>. <%= q.getQuestionText() %></h5>

                    <%
                        String[] opts = q.getOptions();
                        for (int i = 0; i < opts.length; i++) {
                    %>

                    <div class="form-check mt-2">
                        <input class="form-check-input" type="radio"
                               name="q<%= q.getId() %>" 
                               value="<%= i+1 %>" required>
                        <label class="form-check-label"><%= opts[i] %></label>
                    </div>

                    <% } %>
                </div>

                <% } %>

                <button class="btn btn-java w-100 mt-3">Submit Quiz</button>
                <a href="quiz.jsp" class="btn back-btn w-100 mt-3">⬅ Back</a>

            </form>

        </div>
    </div>

    <% } %>

</div>

</body>
</html>
