<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <style>
        body {
            margin: 0;
            font-family: Poppins, sans-serif;
            background: url('image/hand-points-word-39java39-screen-code_284520-2541.avif')
                        no-repeat center center fixed;
            background-size: cover;
        }
        body::before {
            content: "";
            position: absolute;
            inset: 0;
            background: rgba(0,0,0,0.55);
        }

        .box {
            position: relative;
            width: 500px;
            margin: 8% auto;
            background: rgba(255,255,255,0.12);
            padding: 40px;
            border-radius: 15px;
            text-align: center;
            border: 1px solid rgba(255,255,255,0.25);
            color: white;
            box-shadow: 0 8px 25px rgba(0,0,0,0.4);
            animation: fadeIn 0.8s ease-in-out;
        }

        h2 {
            color: #fcca3f;
            font-weight: 700;
        }

        .btn-java {
            background: #fcca3f;
            color: black;
            font-weight: 600;
            border-radius: 10px;
            padding: 12px;
            width: 100%;
        }
        .btn-java:hover {
            background: #ffdf7f;
        }

        .btn-outline-java {
            border: 2px solid #fcca3f;
            color: #fcca3f;
            font-weight: 600;
            border-radius: 10px;
            padding: 10px;
            width: 100%;
            
        }
        .btn-outline-java:hover {
            background: #fcca3f;
            color: black;
        }
	a{
	display: flex;
	justify-content:center;
	align-items:center;
	margin: 15px;
	}
        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(15px);}
            to   {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>

<body>

<div class="box">
	
    <h2>Admin Dashboard</h2>
    <p>Manage Quiz Questions</p>

    <a href="addQuestion.jsp" class="btn-java mb-3">Add New Question</a>

    <a href="ViewServlet" class="btn-java mb-3">View All Questions</a>

    <a href="login.jsp" class="btn-outline-java">Logout</a>

</div>

</body>
</html>
