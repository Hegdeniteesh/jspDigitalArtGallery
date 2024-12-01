<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="java.net.URLEncoder" %>
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
      //  HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("logger") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        // Define image names and links
       
    %>

    <br>
    <p class="pageTitle">CATEGORY: Sci-Fi</p>
    <br>
    <div class="allContainer2">
    <%-- Define the images and their details dynamically --%>
    <%
        // List of image names
        String[] imageNames = {
            "bygone planet.jpg", "coldfleet.png", "astrojup.jpg", "interstellar.png", 
            "parcolaypse.png", "purplespace.jpg", "spaceCrash_man.png", 
            "Wall-E and Eve.png", "unitProduction.png"
        };

        // Base path for images
        String imageBasePath = request.getContextPath() + "/image/scifi/";

        // Loop through the image array to dynamically render images
        for (int i = 0; i < imageNames.length; i++) {
            String imageName = imageNames[i];
            String imagePath = imageBasePath + imageName;
    %>
    <div class="container2">
        <center>
            <% 
                // Add premium badge for even images (i.e., 0-based index, so i % 2 == 0)
                if (i % 2 == 0) { 
            %>
                <input type="button" style="background-color: black; border: 1px solid cyan; font-family: Raleway; color: white; position: absolute;" value="premium">
                <img src="<%= request.getContextPath() %>/image/heart.jpg" style="position: absolute; width: 20px; height: 20px; margin-left: 83px; margin-top: 2px;">
            <% } %>
            <!-- Image display -->
            <img class="contentImage" src="<%= imagePath %>" alt="<%= imageName %>">
        </center>

        <% 
            // If it's a premium image, include the premium download logic
            if (i % 2 == 0) { 
        %>
            <jsp:include page="P_download.jsp">
                <jsp:param name="link" value="<%= imagePath %>" />
                <jsp:param name="nm" value="<%= imageName %>" />
            </jsp:include>
        <% 
            } else { 
        %>
            <!-- Regular view and download buttons for non-premium images -->
            <a class="hideLink" href="imageViewer.jsp?src=<%= java.net.URLEncoder.encode(imagePath, "UTF-8") %>" target="_blank">
                <input type="button" id="View" value="View" class="subBtn">
            </a>
            <a download="<%= imageName %>" href="<%= imagePath %>">
                <input type="button" onclick="thanks()" id="Download" value="Download" class="subBtn">
            </a>
        <% 
            } 
        %>
    </div>
    <% } %>
</div>


    
    <div class="PageEnd">
        <p style="text-align: right;">copyright 2024</p>
    </div>
    </form>
</body>
</html>
