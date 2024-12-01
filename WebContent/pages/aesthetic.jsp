<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Digital Art Gallery/Aesthetic</title>
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/mainPageStyle.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/fonts.css">
    <script src="http://localhost/mp/script/mainPagescript.js"></script>
</head>
<body>
    <form id="form1">
        <%@ include file="topTitle.jsp" %> <!-- includes title and logo of page -->
        <%@ include file="menuBar.jsp" %> <!-- includes menubutton along with logged username -->

        <%
            // Redirect if not logged in
            if (session.getAttribute("logger") == null) {
                response.sendRedirect("http://localhost/mp/pages/index.jsp");
                return;
            }
        %>
        <br>
        <p class="pageTitle">CATEGORY: Aesthetic</p>
        <br>
       <div class="allContainer2">
    <% 
        // Image data setup
        String[] images = {
            "car4.png", "cubeYellowBlue.png", "sadMan_2.png", "eevee_sun_ocean.png", "astroJup.jpg", 
            "longsword.png", "shark_with_glow2.png", "spce2.png", "FullcubeYB.png", "dragonf2f.jpg", "manFloat.jpg"
        };
        for (int i = 0; i < images.length; i++) {
            String imageName = images[i];
            String imageLink = "http://localhost/mp/image/aesthetic/" + imageName;
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
            <img class="contentImage" src="<%= imageLink %>" alt="<%= imageName %>">
        </center>

        <% 
            // View and Download Buttons
            if (i % 3 == 0) { 
        %>
            <!-- For premium images, include a download feature dynamically -->
            <jsp:include page="P_download.jsp">
                <jsp:param name="link" value="<%= imageLink %>" />
                <jsp:param name="nm" value="<%= imageName %>" />
            </jsp:include>
        <% 
            } else { 
        %>
            <!-- For non-premium images, provide view and download buttons -->
            <a class="hideLink" href="imageViewer.jsp?src=<%= java.net.URLEncoder.encode(imageLink, "UTF-8") %>" target="_blank">
                <input type="button" id="View" value="View" class="subBtn">
            </a>
            <a download="<%= imageName %>" href="<%= imageLink %>">
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
