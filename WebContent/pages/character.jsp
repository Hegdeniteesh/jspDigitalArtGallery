<html>
<head>
    <title>Digital Art Gallery/Character</title>
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/mainPageStyle.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/fonts.css">
    <script src="http://localhost/mp/script/mainPagescript.js"></script>
</head>
<body>
    <form id="form1">
    <jsp:include page="topTitle.jsp" />
	<jsp:include page="menuBar.jsp" />

    <br>
    <p class="pageTitle">CATEGORY: Character</p>
    <%  // Trying to access through URL without logging in will result in redirection to login page
        if (session.getAttribute("logger") == null) {
            response.sendRedirect("http://localhost/mp/pages/index.jsp");
            return;
        }
    %>
    <br>
    <div class="allContainer2">
    <% 
        // Array to hold image names
        String[] imageNames = {
            "roseRightblur.png", "bwdragongirl.jpg", "sand_focus.png", 
            "Wall-E and Eve.png", "mello.png", "mandrake.png", 
            "ghostv1.png", "stone frnd.png", "stairs_statue_edit.jpg", 
            "J BRAVO.png", "facing stone.png"
        };
        
        // Base path for images
        String imageBasePath = "http://localhost/mp/image/character/";
        
        // Loop through image names and generate containers dynamically
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

    <!-- Repeat similar containers for each image (link3, link4, ...) -->
    <div class="PageEnd">
        <p style="text-align: right;">copyright 2024</p>
    </div>
    </form>
</body>
</html>
