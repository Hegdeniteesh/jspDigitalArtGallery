<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Digital Art Gallery/Admin</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style/mainPageStyle.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style/fonts.css">
    <script src="<%= request.getContextPath() %>/script/mainPagescript.js"></script>
</head>
<body>
    <form id="form1" action="<%= request.getContextPath() %>/pages/home.jsp" method="post">
        <%-- Include reusable components for title and menu --%>
        <jsp:include page="topTitle.jsp" />
        <jsp:include page="menuBar.jsp" />

        <% 
            // Redirect to login page if the user is not logged in
            if (session.getAttribute("logger") == null) {
                response.sendRedirect(request.getContextPath() + "/pages/index.jsp");
                return;
            }
        %>
        <div style="margin-top: 10%;">
            <center>
                <p class="pageTitle">Congratulations!</p>
                <br>
                <label class="tnc">You are now a <b>premium user</b></label>
                <br>
                <label class="tnc">Subscription pack: &#8377
                <%= request.getParameter("val") %> 
                for 
                <%= request.getParameter("dateQt") %>
                </label>
                <br>
                <br>
                <input type="submit" value="OK" name="premiumExit" class="subBtn">
            </center>
        </div>
    </form>
</body>
</html>
