<%@ page import="java.io.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="topTitle.jsp" %>  <!-- Includes title and logo of page -->
<%@ include file="menuBar.jsp" %>   <!-- Includes menu buttons along with logged username -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Digital Art Gallery/Logout</title>
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/mainPageStyle.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/fonts.css">
    <script src="http://localhost/mp/script/mainPagescript.js"></script>
</head>
<body>
    <form id="form1" action="http://localhost/mp/pages/index.jsp" method="post">
        <h1 class="pageTitle">LOGOUT?</h1>
        
        <% 
            // Retrieve the logged-in user's session attribute
           // HttpSession session = request.getSession(false);
          // 	String logger = (session != null) ? (String) session.getAttribute("logger") : null;

            if (logger != null && !logger.isEmpty()) {
                // Display the logged-in username, removing "Signed in as,"
                String username = logger.replace("Signed in as,", "").trim();
        %>
        <center>
            <p class="tnc" style="font-size:x-large;">Currently logged in as: <%= username %></p>
        </center>
        <% 
            } else {
                out.println("<center><p class='tnc' style='font-size:x-large;'>No user is currently logged in.</p></center>");
            }
        %>

        <center>
            <input type="submit" name="logout" value="LOGOUT" class="subBtn" 
                   style="border:2px solid red; height: 35px; box-shadow: 0px 1px 0px 0px #ff9100;">
        </center>
        
        <%@ include file="logSubStatusDb.jsp" %> <!-- Includes logout status handling -->

        <div class="PageEnd">
            <p style="text-align: right; margin-top: 18%;">copyright 2024</p>
        </div>
    </form>
</body>
</html>
