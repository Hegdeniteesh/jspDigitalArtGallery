<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // Start or retrieve the session
    // HttpSession session = request.getSession(false);

    // Redirect to login page if session attribute 'logger' is not set
    if (session == null || session.getAttribute("logger") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Digital Art Gallery/Home</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style/mainPageStyle.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style/fonts.css">
    <script src="<%= request.getContextPath() %>/script/mainPagescript.js"></script>
</head>
<body>
    <form id="form1">
        <%@ include file="topTitle.jsp" %> <!-- includes title and logo of page -->
        <%@ include file="menuBar.jsp" %> <!-- includes menu button along with logged username -->
       <jsp:include page="sub_validDb.jsp" />

        <br>
        <!-- different category images with links to their pages upon clicking -->
        <div class="allContainer">
            <div class="container" id="contLeft" onclick="enterAes()">
                <img src="<%= request.getContextPath() %>/image/car4.png" class="hmImg1">
                <div class="imgtext">
                    <div>Aesthetic</div>
                </div>
            </div>
            <div class="container" id="contMid" onclick="enterAbs()">
                <img src="<%= request.getContextPath() %>/image/black_moon_scene.png" class="hmImg1">
                <div class="imgtext">
                    <div>Abstract</div>
                </div>
            </div>
            <div class="container" id="contRight" onclick="enterCha()">
                <img src="<%= request.getContextPath() %>/image/sand_focus.png" class="hmImg1">
                <div class="imgtext">
                    <div>Character</div>
                </div>
            </div>
            <br><br>
            <div class="container" id="contLeft" onclick="enterFan()">
                <img src="<%= request.getContextPath() %>/image/sadMan_spaced.png" class="hmImg1">
                <div class="imgtext">
                    <div>Fantasy</div>
                </div>
            </div>
            <div class="container" id="contMid" onclick="enterSci()">
                <img src="<%= request.getContextPath() %>/image/spaceCrash.png" class="hmImg1">
                <div class="imgtext">
                    <div>Sci-fi</div>
                </div>
            </div>
            <div class="container" id="contRight" onclick="enterVis()">
                <img src="<%= request.getContextPath() %>/image/fondue.png" class="hmImg1">
                <div class="imgtext">
                    <div>Visual Effects</div>
                </div>
            </div>
            <br><br>
            <div class="PageEnd">
                <p style="text-align: right;">&copy; 2024</p>
            </div>
        </div>
    </form>
</body>
</html>
