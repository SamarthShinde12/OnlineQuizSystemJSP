<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Java Quiz Portal</title>
    <meta charset="UTF-8">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <style>
        body {
            margin: 0;
            font-family: Poppins, sans-serif;
            background: url('image/hand-points-word-39java39-screen-code_284520-2541.avif') no-repeat center center fixed;
            background-size: cover;
        }
        body::before {
            content: ""; position: absolute; inset: 0;
            background: rgba(0,0,0,0.55);
        }
        .box {
            position: relative;
            max-width: 550px;
            margin-top: 8%;
            background: rgba(255,255,255,0.12);
            padding: 40px;
            border-radius: 15px;
            color: white;
            text-align: center;
        }
        .btn-java { background: #fcca3f; color:black; font-weight:600; }
        h2 { color: #fcca3f; font-weight:700; }
    </style>
</head>

<body>

<div class="container d-flex justify-content-center">
    <div class="box">
		<form action="dashboard" method="post">
        <h2>Welcome, <%= session.getAttribute("username") %></h2>
        <p>Select an option below:</p>

        <a href="QuizServlet" class="btn btn-java w-100 mb-3">Start Quiz</a>

        <a href="LogoutServlet" class="btn btn-outline-light w-100">Logout</a>
		</form>
    </div>
</div>

</body>
</html>
