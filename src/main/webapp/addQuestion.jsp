<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Question</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: url('image/hand-points-word-39java39-screen-code_284520-2541.avif') 
                       no-repeat center center fixed;
            background-size: cover;
            position: relative;
        }
        body::before {
            content: "";
            position: absolute;
            inset: 0;
            background: rgba(0,0,0,0.55);
        }
        .box {
            position: relative;
            max-width: 600px;
            margin: 6% auto;
            background: rgba(255,255,255,0.12);
            border-radius: 15px;
            padding: 40px;
            color: white;
            border: 1px solid rgba(255,255,255,0.25);
            box-shadow: 0px 8px 30px rgba(0,0,0,0.4);
            animation: fadeIn 0.8s ease-in-out;
        }
        h2 { color: #fcca3f; font-weight: 700; }

        .btn-java {
            background-color: #fcca3f;
            color: black;
            font-weight: 600;
            border-radius: 10px;
        }
        .btn-java:hover {
            background: #ffe17d;
        }
        @keyframes fadeIn {
            from {opacity:0; transform:translateY(10px);}
            to   {opacity:1; transform:translateY(0);}
        }
        #toast {
            visibility: hidden;
            position: fixed;
            top: 30px;
            right: 30px;
            background-color: rgba(0,0,0,0.75);
            color: #fcca3f;
            padding: 15px 22px;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            box-shadow: 0px 5px 20px rgba(0,0,0,0.4);
            border-left: 5px solid #fcca3f;
            z-index: 1000;
            opacity: 0;
            transition: opacity 0.6s, visibility 0.6s;
        }

        #toast.show {
            visibility: visible;
            opacity: 1;
        }
    </style>
</head>

<body>

<div class="box">
    <h2>Add New Question</h2>
    <% if (request.getAttribute("error") != null) { %>
    <div style="
        background: rgba(255, 0, 0, 0.2);
        color: #ff6b6b;
        border-left: 5px solid #ff6b6b;
        padding: 12px 15px;
        margin-bottom: 15px;
        border-radius: 8px;
        font-weight: 600;
        text-align: center;">
        
        <%= request.getAttribute("error") %>
    </div>
<% } %>
    <form action="AddQuestionServlet" method="post">

        <label class="form-label">Question Text</label>
        <textarea name="question" class="form-control mb-3" required></textarea>

        <label class="form-label">Option 1</label>
        <input type="text" name="optA" class="form-control mb-3" required>

        <label class="form-label">Option 2</label>
        <input type="text" name="optB" class="form-control mb-3" required>

        <label class="form-label">Option 3</label>
        <input type="text" name="optC" class="form-control mb-3" required>

        <label class="form-label">Option 4</label>
        <input type="text" name="optD" class="form-control mb-3" required>

        <label class="form-label">Correct Answer (1/2/3/4)</label>
        <input type="number" name="correct" class="form-control mb-3" required>

        <button class="btn btn-java w-100" type="submit">Add Question</button>
        
    </form>
     <form action="BackServlet" method="post">
        <button class="btn btn-java w-100 back" style="margin-top: 20px" type="submit">Back</button>
        </form>
</div>
<div id="toast">Question Added Successfully!</div>
<script>
    <% if (request.getParameter("success") != null) { %>
    let toast = document.getElementById("toast");
    toast.classList.add("show");

    setTimeout(() => {
        toast.classList.remove("show");
    }, 3000);
    <% } %>
    
</script>
</body>
</html>
