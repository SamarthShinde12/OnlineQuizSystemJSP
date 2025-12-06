<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Quiz Result</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body { background:#0d0d0d; color:white; font-family:Poppins, sans-serif; padding:40px 0; }
        .box { background:rgba(255,255,255,0.06); padding:26px; border-radius:12px; max-width:900px; margin:auto; }
        .correct { background: rgba(76,175,80,0.15); border-left: 4px solid #4caf50; }
        .wrong { background: rgba(244,67,54,0.1); border-left: 4px solid #f44336; }
        .option { padding:8px 12px; border-radius:6px; margin-bottom:6px; display:block; color:#f0f0f0; }
        .btn-java { background:#fcca3f; color:black; font-weight:600; margin-top:20px; }
        h5 span.badge { background: #6c757d; }
    </style>
</head>
<body>
<div class="container">
    <div class="box">
        <h2 class="text-warning text-center">Quiz Result</h2>

        <%
            Integer score = (Integer) request.getAttribute("score");
            Integer total = (Integer) request.getAttribute("total");
            List<Map<String,Object>> details = (List<Map<String,Object>>) request.getAttribute("details");
            double percent = 0.0;
            if (score != null && total != null && total > 0) percent = (score * 100.0) / total;
        %>

        <div class="text-center my-3">
            <h3>Your Score: <strong><%= score %></strong> / <%= total %></h3>
            <p>Percentage: <strong><%= String.format("%.1f", percent) %>%</strong></p>
            <a href="user-home.jsp" class="btn btn-outline-light me-2" style="margin-top: 20px">Back Home</a>
            <a href="quiz.jsp" class="btn btn-java">Try Again</a>
        </div>

        <hr style="border-color:rgba(255,255,255,0.06)">

        <h4 class="text-warning mt-4">Review</h4>

        <%
            if (details != null) {
                int i = 1;
                for (Map<String,Object> row : details) {
                    String question = (String) row.get("question");
                    String[] opts = (String[]) row.get("options");
                    Integer selected = (Integer) row.get("selected");
                    Integer correct = (Integer) row.get("correct");
        %>

        <div class="mt-3 p-3 <%= (selected != null && selected.equals(correct)) ? "correct" : "wrong" %>">
            <h5><span class="badge"><%= i++ %></span> <%= question %></h5>
            <div class="mt-2">
                <% for (int k=0;k<opts.length;k++) {
                       int optIndex = k+1;
                       String label = opts[k];
                       boolean isCorrect = (optIndex == correct);
                       boolean isSelected = (selected != null && selected == optIndex);
                %>
                    <div class="option" style="<%= isCorrect ? "background: rgba(252,202,63,0.12); border-left:4px solid #fcca3f;" : "" %>">
                        <strong><%= (char)('A' + k) %>.</strong> <%= label %>
                        <span class="small ms-2" style="<%= isCorrect ? "color: #ffffff;" : "color: #bbbbbb;" %>">
  									<%= isCorrect ? " (Correct answer)" : (isSelected ? " (Your choice)" : "") %>
						</span>

                    </div>
                <% } %>
            </div>
        </div>

        <%      } // end for
            } // end if details
        %>

    </div>
</div>
</body>
</html>
