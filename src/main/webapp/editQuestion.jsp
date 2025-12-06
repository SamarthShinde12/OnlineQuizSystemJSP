<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.quiz.model.Question" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Question</title>
    <meta charset="UTF-8">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body { margin:0; font-family:'Poppins',sans-serif;
               background: url('image/hand-points-word-39java39-screen-code_284520-2541.avif') no-repeat center fixed;
               background-size: cover; }
        body::before { content:""; position:absolute; inset:0; background:rgba(0,0,0,0.55); }
        .box { position:relative; max-width:700px; margin:5% auto; padding:30px;
              border-radius:12px; background:rgba(255,255,255,0.12); color:#fff; }
        h2 { color:#fcca3f; font-weight:700; }
        .btn-java { background:#fcca3f; color:black; font-weight:600; border-radius:8px; }
       
    </style>
</head>
<body>

<%
    Question q = (Question) request.getAttribute("questionData");
%>

<div class="box">
    <% if (q == null) { %>
        <h2>No question loaded!</h2>
        <p>Please open this page via the question list (click Edit from View Questions).</p>
        <div class="mt-3">
            <a class="btn btn-java" href="ViewServlet">Back to Questions</a>
        </div>
    <% } else { 
         String[] opts = q.getOptions();
         int correctIndex = q.getCorrectAnswer(); // stores 1..4 as in your DB
    %>

    <h2 class="text-center">Edit Question</h2>

    <% if (request.getAttribute("error") != null) { %>
        <div style="background: rgba(255,0,0,0.15); color:#ff6b6b; padding:10px; border-left:4px solid #ff6b6b; border-radius:6px; margin-bottom:12px;">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>

    <form action="EditQuestionServlet" method="post">
        <input type="hidden" name="id" value="<%= q.getId() %>">

        <label class="form-label">Question Text</label>
        <textarea name="question" class="form-control mb-3" rows="3" required><%= q.getQuestionText() %></textarea>

        <label class="form-label">Option 1</label>
        <input type="text" name="optA" class="form-control mb-3" value="<%= opts[0] %>" required>

        <label class="form-label">Option 2</label>
        <input type="text" name="optB" class="form-control mb-3" value="<%= opts[1] %>" required>

        <label class="form-label">Option 3</label>
        <input type="text" name="optC" class="form-control mb-3" value="<%= opts[2] %>" required>

        <label class="form-label">Option 4</label>
        <input type="text" name="optD" class="form-control mb-3" value="<%= opts[3] %>" required>

        <label class="form-label">Correct Answer (1-4)</label>
        <input type="text" name="correct" min="1" max="4" class="form-control mb-4" value="<%= correctIndex %>" required>

        <button class="btn btn-java w-100" type="submit">Update Question</button>
    </form>

    <div class="text-center mt-3">
        <!-- link back to servlet so list is fetched -->
        <a class="btn btn-light" href="ViewServlet">⬅ Back to Questions</a>
    </div>

    <% } %>
</div>



</body>
</html>
