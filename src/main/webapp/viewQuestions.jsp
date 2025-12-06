<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.quiz.model.Question, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Questions</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <style>
        body {
            position: relative;
            background: url('image/hand-points-word-39java39-screen-code_284520-2541.avif') 
                        no-repeat center fixed;
            background-size: cover;
            font-family: Poppins, sans-serif;
        }
        body::before {
            content: "";
            position: absolute;
            inset: 0;
            background: rgba(0,0,0,0.55);
            z-index: -1;
        }
        .table-box {
            margin: 5% auto;
            width: 90%;
            background: rgba(255,255,255,0.12);
            padding: 30px;
            border-radius: 15px;
            color: white;
            border: 1px solid rgba(255,255,255,0.25);
        }
        h2 { color: #fcca3f; }
        .btn-java {
            background: #fcca3f;
            color: black;
            padding: 5px 15px;
            border-radius: 8px;
            text-decoration: none;
            border: none;
        }
        #toast {
            visibility:hidden;
            position:fixed;
            top:30px;
            right:30px;
            background:rgba(0,0,0,0.75);
            color:#fcca3f;
            padding:12px 18px;
            border-left:5px solid #fcca3f;
            border-radius:8px;
            z-index:9999;
            opacity:0;
            transition:opacity .4s, visibility .4s;
            font-weight:600;
        }
        #toast.show { visibility:visible; opacity:1; }
        form { display:inline; }
    </style>
</head>

<body>

<div class="table-box">
    <h2 class="text-center">All Questions</h2>

    <table class="table table-dark table-striped mt-4">
        <thead>
        <tr>
            <th>No.</th>
            <th>Question</th>
            <th>Correct</th>
            <th>Actions</th>
        </tr>
        </thead>

        <tbody>
        <%
            List<Question> list = (List<Question>) request.getAttribute("allQuestion");
            int index = 1;

            if (list != null && !list.isEmpty()) {
                for (Question q : list) {
        %>

        <tr>
            <td><%= index++ %></td>
            <td><%= q.getQuestionText() %></td>
            <td><%= q.getOptions()[ q.getCorrectAnswer() - 1 ] %></td>

            <td>

               
                <form action="LoadQuestionServlet" method="post">
                    <input type="hidden" name="id" value="<%= q.getId() %>">
                    <button type="submit" class="btn-java">Edit</button>
                </form>

                
                <form action="DeleteQuestionServlet" method="post"
                      onsubmit="return confirm('Are you sure?');">
                    <input type="hidden" name="id" value="<%= q.getId() %>">
                    <button type="submit" class="btn-java">Delete</button>
                </form>

            </td>
        </tr>

        <% 
                }
            } else { 
        %>

        <tr>
            <td colspan="4" class="text-center text-warning">No questions found.</td>
        </tr>

        <% } %>
        </tbody>
    </table>

    <div class="text-center mt-3">
        <a class="btn-java" href="admin-home.jsp">Back</a>
    </div>
</div>


<div id="toast">Question Updated Successfully!</div>

<script>
    <% 
        
        String msg = (String) session.getAttribute("success");
        if (msg != null) { 
    %>
        let t = document.getElementById("toast");
        t.textContent = "<%= msg %>";
        t.classList.add("show");
        setTimeout(() => t.classList.remove("show"), 3000);
    <% 
        session.removeAttribute("success"); 
        } 
    %>
</script>

</body>
</html>
