<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Java Quiz Portal</title>
    <meta charset="UTF-8">

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            height: 100vh;

            /* Java-themed background */
            background: url('image/hand-points-word-39java39-screen-code_284520-2541.avif') no-repeat center center fixed;
            background-size: cover;

            /* Dark gradient overlay */
            position: relative;
        }

        body::before {
            content: "";
            position: absolute;
            inset: 0;
            background: rgba(0,0,0,0.55); /* overlay */
            backdrop-filter: blur(2px);
        }

        .container-box {
            position: relative;
            max-width: 500px;
            margin-top: 10%;
            background: rgba(255,255,255,0.12);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 8px 30px rgba(0,0,0,0.4);
            border: 1px solid rgba(255,255,255,0.25);
            color: white;
            animation: fadeIn 0.8s ease-in-out;
        }

        h2 {
            font-weight: 700;
            color: #fcca3f; /* Java yellow theme */
        }

        p {
            color: #ebeaea;
        }

        .btn-custom {
            padding: 12px;
            font-size: 16px;
            border-radius: 10px;
            width: 100%;
            font-weight: 600;
        }

        .btn-java {
            background-color: #fcca3f;
            color: black;
            border: none;
        }

        .btn-java:hover {
            background-color: #ffdd74;
            color: black;
        }

        .btn-outline-java {
            border: 2px solid #fcca3f;
            color: #fcca3f;
        }

        .btn-outline-java:hover {
            background-color: #fcca3f;
            color: black;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        .footer-text {
            position: absolute;
            bottom: 20px;
            width: 100%;
            text-align: center;
            color: #f5f5f5;
            font-size: 14px;
        }
    </style>
</head>

<body>

<div class="container d-flex justify-content-center">
    <div class="container-box text-center">

        <h2>Java Quiz Portal</h2>
        <p>Sharpen your Java skills with interactive quizzes!</p>

        <hr style="border-color: rgba(255,255,255,0.3);">

        <a href="login.jsp" class="btn btn-java btn-custom mb-3">Login</a>
        <a href="register.jsp" class="btn btn-outline-java btn-custom">Register</a>
    </div>
</div>

<p class="footer-text">© 2025 Java Quiz Portal • Powered by Samarth S. Shinde</p>

</body>
</html>
