<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Java Quiz Portal</title>
    <meta charset="UTF-8">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: url('image/hand-points-word-39java39-screen-code_284520-2541.avif')
                      no-repeat center center fixed;
            background-size: cover;
        }
        body::before {
            content: "";
            position: absolute; inset: 0;
            background: rgba(0,0,0,0.55);
            backdrop-filter: blur(2px);
        }
        .box {
            position: relative;
            max-width: 450px;
            margin-top: 8%;
            background: rgba(255,255,255,0.12);
            padding: 35px;
            border-radius: 15px;
            color: white;
            box-shadow: 0px 8px 30px rgba(0,0,0,0.4);
        }
        .btn-java { background: #fcca3f; color: black; font-weight: 600; }
        h2 { color: #fcca3f; }
        
       
    </style>
</head>

<body>

<div class="container d-flex justify-content-center">
    <div class="box text-center">
    
        <h2>Create Account</h2>
        <p>Start your Java learning journey!</p>
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

        <form action="RegisterServlet" method="post">
            <input type="text" name="username" class="form-control mb-3" placeholder="Username" required>
            <input type="password" name="password" class="form-control mb-3" placeholder="Password" required>


            <button class="btn btn-java w-100">Register</button>
        </form>

        <p class="mt-3">Already have an account?  
            <a href="login.jsp" class="text-warning">Login</a>
        </p>
        
    </div>
</div>

</body>
</html>
