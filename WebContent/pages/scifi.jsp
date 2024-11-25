<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Digital Art Gallery/Sci-fi</title>
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/mainPageStyle.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/fonts.css">
    <script src="http://localhost/mp/script/mainPagescript.js"></script>
</head>
<body>
    <form id="form1">
    <%
        // Include header and menu
        request.getRequestDispatcher("topTitle.jsp").include(request, response);
        request.getRequestDispatcher("menuBar.jsp").include(request, response);

        // Redirect to login page if not logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("logger") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        // Define image names and links
        String[][] images = {
            {"bygone planet.jpg", "http://localhost/mp/image/scifi/bygone%20planet.jpg"},
            {"coldfleet.png", "http://localhost/mp/image/scifi/coldfleet.png"},
            {"astrojup.jpg", "http://localhost/mp/image/scifi/astrojup.jpg"},
            {"interstellar.png", "http://localhost/mp/image/scifi/interstellar.png"},
            {"parcolaypse.png", "http://localhost/mp/image/scifi/parcolaypse.png"},
            {"purplespace.jpg", "http://localhost/mp/image/scifi/purplespace.jpg"},
            {"spaceCrash_man.png", "http://localhost/mp/image/scifi/spaceCrash_man.png"},
            {"Wall-E and Eve.png", "http://localhost/mp/image/scifi/Wall-E%20and%20Eve.png"},
            {"unitProduction.png", "http://localhost/mp/image/scifi/unitProduction.png"}
        };
    %>

    <br>
    <p class="pageTitle">CATEGORY: Sci-Fi</p>
    <br>
    <div class="allContainer2">
        <% 
            // Loop through images array to render each image dynamically
            for (int i = 0; i < images.length; i++) {
                String imageName = images[i][0];
                String imageLink = images[i][1];
        %>
            <div class="container2">
                <center>
                    <img class="contentImage" src="<%= imageLink %>" alt="<%= imageName %>">
                </center>
                <a class="hideLink" href="imageViewer.jsp?src=<%= java.net.URLEncoder.encode(imageLink, "UTF-8") %>" target="_blank">
                    <input type="button" id="View" value="View" class="subBtn">
                </a>
                <a download="<%= imageName %>" href="<%= imageLink %>">
                    <input type="button" onclick="thanks()" id="Download" value="Download" class="subBtn">
                </a>
                <% if (i == 3 || i == 7) { %>
                    <center>
                        <input type="button" style="background-color: black; border: 1px solid cyan; font-family: Raleway; color: white; position: absolute;" value="premium">
                        <img src="http://localhost/mp/image/heart.jpg" style="position: absolute; width: 20px; height:20px; margin-left: 83px; margin-top: 2px;">
                    </center>
                    <% 
                        // Include premium logic for premium images
                        request.setAttribute("link", imageLink);
                        request.setAttribute("nm", imageName);
                        request.getRequestDispatcher("P_download.jsp").include(request, response);
                    %>
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
