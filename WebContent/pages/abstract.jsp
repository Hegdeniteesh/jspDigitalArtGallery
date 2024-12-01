<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Digital Art Gallery/Abstract</title>
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/mainPageStyle.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/fonts.css">
    <script src="http://localhost/mp/script/mainPagescript.js"></script>
</head>
<body>
    <form id="form1">
        <!-- Includes for header and menu -->
        <jsp:include page="topTitle.jsp" />
        <jsp:include page="menuBar.jsp" />

        <br>
        <p class="pageTitle">CATEGORY: Abstract</p>

        <!-- Redirect to login page if not logged in -->
        <% 
           // HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("logger") == null) {
                response.sendRedirect("http://localhost/mp/pages/index.jsp");
                return;
            }
        %>

        <br> 
       <div class="allContainer2">
    <% 
        // Image data setup
        String[] imageNames = {
            "split_heart.png", "black_moon_scene.png", "emoji_neon.png", 
            "snekFront.png", "mask_grass_gold_different%20light4.png", 
            "wireframe_blue_evee.png", "shark_with_glow2.png", 
            "instascene.png", "cube_blue.png"
        };

        for (int i = 0; i < imageNames.length; i++) {
            String imageLink = "http://localhost/mp/image/abstract/" + imageNames[i];
    %>
    <div class="container2">
        <center>
            <% 
                // Add premium badge for every third image (i % 3 == 0)
                if (i % 3 == 0) { 
            %>
                <input type="button" style="background-color: black; border: 1px solid cyan; font-family: Raleway; color: white; position: absolute;" value="premium">
                <img src="http://localhost/mp/image/heart.jpg" style="position: absolute; width: 20px; height:20px; margin-left: 83px; margin-top: 2px;">
            <% } %>
            <img class="contentImage" src="<%= imageLink %>" alt="<%= imageNames[i] %>">
        </center>

        <% 
            // View and Download Buttons
            if (i % 3 == 0) { 
        %>
            <!-- For premium images, include a download feature dynamically -->
            <jsp:include page="P_download.jsp">
                <jsp:param name="link" value="<%= imageLink %>" />
                <jsp:param name="nm" value="<%= imageNames[i] %>" />
            </jsp:include>
        <% 
            } else { 
        %>
            <!-- For non-premium images, provide view and download buttons -->
            <a class="hideLink" href="imageViewer.jsp?src=<%= java.net.URLEncoder.encode(imageLink, "UTF-8") %>" target="_blank">
                <input type="button" id="View" value="View" class="subBtn">
            </a>
            <a href="P_download.jsp?link=<%= java.net.URLEncoder.encode(imageLink, "UTF-8") %>">
                <input type="button" onclick="thanks()" id="Download" value="Download" class="subBtn">
            </a>
        <% 
            } 
        %>
    </div>
    <% } %>
</div>


        <div class="PageEnd">
            <p style="text-align: right;">&copy; 2024</p>
        </div>
    </form>
</body>
</html>
