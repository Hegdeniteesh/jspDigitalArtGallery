<html>
<head>
    <title>Digital Art Gallery/Fantasy</title>
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/mainPageStyle.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/fonts.css">
    <script src="http://localhost/mp/script/mainPagescript.js"></script>
</head>
<body>
    <form id="form1">
    <%@ include file="topTitle.jsp" %> <!-- includes title and logo of the page -->
    <%@ include file="menuBar.jsp" %> <!-- includes menu button along with logged username -->
    <br>
    <p class="pageTitle">CATEGORY: Fantasy</p>
    <% // Redirect to login page if the user is not logged in
        if (session.getAttribute("logger") == null) {
            response.sendRedirect("http://localhost/mp/pages/index.jsp");
            return;
        }
    %>
    <br>
    <div class="allContainer2">
    <% 
        // Array of image names
        String[] fantasyImages = {
            "manFloating.jpg", "sadMan_spaced.png", "dragonf2f.jpg", 
            "snekRear.png", "interstellar.png", "spaceCrash_man.png", 
            "stone frnd.png", "unitProduction.png", "facing stone.png"
        };
        
        // Base path for fantasy images
        String fantasyBasePath = "http://localhost/mp/image/fantasy/";

        // Loop through the images dynamically
        for (int i = 0; i < fantasyImages.length; i++) {
            String imageName = fantasyImages[i];
            String imagePath = fantasyBasePath + imageName;
    %>
    <div class="container2">
        <center>
            <% if (i % 2 == 0) { %> <!-- Add premium badge for the first image -->
                <input type="button" style="background-color: black; border: 1px solid cyan; font-family: Raleway; color: white; position: absolute;" value="premium">
                <img src="<%= request.getContextPath() %>/image/heart.jpg" style="position: absolute; width: 20px; height:20px; margin-left: 83px; margin-top: 2px;">
            <% } %>
            <img class="contentImage" src="<%= imagePath %>">
        </center>
        <% if (i % 2 == 0) { %>
            <%-- Include premium download feature --%>
            <jsp:include page="P_download.jsp">
                <jsp:param name="link" value="<%= imagePath %>" />
                <jsp:param name="nm" value="<%= imageName %>" />
            </jsp:include>
        <% } else { %>
            <%-- View and download buttons for other images --%>
            <a class="hideLink" href="imageViewer.jsp?src=<%= java.net.URLEncoder.encode(imagePath, "UTF-8") %>" target="_blank">
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
