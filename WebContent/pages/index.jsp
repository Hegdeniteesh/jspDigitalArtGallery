<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ include file="topTitle.jsp" %> <!-- Includes title and logo of page --> --%>
<%-- <%@ include file="signDb.jsp" %> <!-- Includes code for database connection --> --%>
<!DOCTYPE html>
<html>
<head>
    <title>Digital Art Gallery/Login</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style/mainPageStyle.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style/fonts.css">
    <script src="<%= request.getContextPath() %>/script/mainPagescript.js"></script>
</head>
<body>
    <form id="form1" method="post"  action="<%= request.getContextPath() %>/pages/signDb.jsp">
		<div style="display: none;"><!--Hides the menu bar but allows the session to start -->
            <%@ include file="menuBar.jsp" %> <!-- Includes menu button with logged username -->
        </div>
        <br>
        <h1 class="pageTitle">SIGN IN</h1>
        <center>
            <table class="userForm">
                <tr><td></td></tr>
                <tr><td></td></tr>
                <tr><td></td></tr>
                <tr>
                    <td class="form">Username</td>
                </tr>
                <tr>
                    <td>
                        <center>
                            <input type="text" name="Username" placeholder="Username" class="inputField" required>
                        </center>
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td class="form">Password</td>
                </tr>
                <tr>
                    <td>
                        <center>
                            <input type="password" name="Password" placeholder="Password" class="inputField" required>
                        </center>
                    </td>
                </tr>
                <tr>
                    <td>
                        <center>
                            <input type="submit" name="login" value="SIGN IN" class="subBtn">
                        </center>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="border-radius: 0px 0px 25px 25px; text-align:center; background-color:#0f0e0e;">
                        <a class="menuLink" href="<%= request.getContextPath() %>/pages/signUp.jsp">Create Account</a>
                    </td>
                </tr>
            </table>
        </center>
        <br>
        <div class="PageEnd">
            <p style="text-align: right;">&copy; 2024</p>
        </div>
    </form>
</body>
</html>
