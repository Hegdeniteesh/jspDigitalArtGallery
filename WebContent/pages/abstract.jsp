<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
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
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("logger") == null) {
                response.sendRedirect("http://localhost/mp/pages/index.jsp");
                return;
            }
        %>

        <br> 
        <div class="allContainer2">
            <!-- Dynamic Variables for Images -->
            <%
                String[] imageNames = {
                    "split_heart.png", "black_moon_scene.png", "emoji_neon.png", 
                    "snekFront.png", "mask_grass_gold_different%20light4.png", 
                    "wireframe_blue_evee.png", "shark_with_glow2.png", 
                    "instascene.png", "cube_blue.png"
                };

                String[] links = new String[imageNames.length];
                for (int i = 0; i < imageNames.length; i++) {
                    links[i] = "http://localhost/mp/image/abstract/" + imageNames[i];
                }
            %>

            <!-- Image Display Section -->
            <c:forEach var="index" begin="0" end="8">
                <div class="container2">
                    <center>
                        <img class="contentImage" src="<%= links[index] %>">
                    </center>
                    <a class="hideLink" href="imageViewer.jsp?src=<%= java.net.URLEncoder.encode(links[index], "UTF-8") %>" target="_blank">
                        <input type="button" id="View" value="View" class="subBtn">
                    </a>
                    <a download="<%= imageNames[index] %>" href="<%= links[index] %>">
                        <input type="button" onclick="thanks()" id="Download" value="Download" class="subBtn">
                    </a>
                </div>
            </c:forEach>
        </div>

        <div class="PageEnd">
            <p style="text-align: right;">copyright 2024</p>
        </div>
    </form>
</body>
</html>
