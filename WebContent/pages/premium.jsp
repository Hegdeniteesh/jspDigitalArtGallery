<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Digital Art Gallery/Home</title>
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/mainPageStyle.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/fonts.css">
    <script src="http://localhost/mp/script/mainPagescript.js"></script>
</head>
<body>
    <% 
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("logger") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
    %>
    
    <!-- Include topTitle.jsp for the title and logo -->
    <jsp:include page="topTitle.jsp" />
    <!-- Include menuBar.jsp for the menu bar and logged username -->
    <jsp:include page="menuBar.jsp" />

    <p class="pageTitle">Buy Premium</p>
    <br>
    <center>
        <form method="post" action="payDb.jsp">
            <table class="userForm">
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td class="form"><b>Choose a subscription</b></td>
                </tr>
                <tr>
                    <td class="form">
                        <label>&#8377; 200 for 1 month &nbsp;&nbsp;</label>
                        <input type="radio" name="subs" value="200" required>
                    </td>
                </tr>
                <tr>
                    <td class="form">
                        <label>&#8377; 500 for 3 months &nbsp;&nbsp;</label>
                        <input type="radio" name="subs" value="500" required>
                    </td>
                </tr>
                <tr>
                    <td class="form">
                        <label>&#8377; 1900 for 1 year &nbsp;&nbsp;&nbsp;</label>
                        <input type="radio" name="subs" value="1900" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <center>
                            <input type="submit" name="buy" value="BUY" class="subBtn">
                        </center>
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
