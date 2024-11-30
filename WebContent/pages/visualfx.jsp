<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ page import="java.net.URLEncoder" %>

<!DOCTYPE html>
<html>
<head>
    <title>Digital Art Gallery/Visual Effects</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style/mainPageStyle.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style/fonts.css">
    <script src="<%= request.getContextPath() %>/script/mainPagescript.js"></script>
</head>
<body>
    <form id="form1">
        <%-- Include reusable components for title and menu bar --%>
        <jsp:include page="topTitle.jsp" />
        <jsp:include page="menuBar.jsp" />

        <br>
        <p class="pageTitle">CATEGORY: Visual Effects</p>

        <%-- Redirect to login page if the user is not logged in --%>
        <% 
            if (session.getAttribute("logger") == null) {
                response.sendRedirect(request.getContextPath() + "/pages/index.jsp");
                return;
            }
        %>

        <br>
        <div class="allContainer2">
            <%-- Define the images and their details dynamically --%>
            <%
                String[] imageNames = {
                    "Ayran.png", "emoji_focus.png", "roseRightblur.png", 
                    "image framed.png", "emoji_halfCreepy.png", "Foundue.png", 
                    "parcolaypse.png", "emoji_sun.png"
                };

                String imageBasePath = request.getContextPath() + "/image/visual/";
                for (int i = 0; i < imageNames.length; i++) {
                    String imageName = imageNames[i];
                    String imagePath = imageBasePath + imageName;
            %>
            <div class="container2">
                <center>
                    <% if (i % 2 == 0) { %> <!-- Add premium badge for even images -->
                        <input type="button" style="background-color: black; border: 1px solid cyan; font-family: Raleway; color: white; position: absolute;" value="premium">
                        <img src="<%= request.getContextPath() %>/image/heart.jpg" style="position: absolute; width: 20px; height:20px; margin-left: 83px; margin-top: 2px;">
                    <% } %>
                    <img class="contentImage" src="<%= imagePath %>">
                </center>
                <% if (i % 2 == 0) { %>
                    <%-- For premium images, include a download feature dynamically --%>
                    <jsp:include page="P_download.jsp">
                        <jsp:param name="link" value="<%= imagePath %>" />
                        <jsp:param name="nm" value="<%= imageName %>" />
                    </jsp:include>
                <% } else { %>
                    <a class="hideLink" href="imageViewer.jsp?src=<%= URLEncoder.encode(imagePath, "UTF-8") %>" target="_blank">
                        <input type="button" id="View" value="View" class="subBtn">
                    </a>
                    <a download="<%= imageName %>" href="<%= imagePath %>">
                        <input type="button" onclick="thanks()" id="Download" value="Download" class="subBtn">
                    </a>
                <% } %>
            </div>
            <% } %>
        </div>

        <div class="PageEnd">
            <p style="text-align: right;">copyright 2024</p>
        </div>
    </form>
</body>
</html>
