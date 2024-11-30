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
        <div class="container2">
        <% // Changing these variables will change the name and link address of each image
            String nm1 = "roseRightblur.png";
            String nm2 = "bwdragongirl.jpg";
            String nm3 = "sand_focus.png";
            String nm4 = "Wall-E and Eve.png";
            String nm5 = "mello.png";
            String nm6 = "mandrake.png";
            String nm7 = "ghostv1.png";
            String nm8 = "stone frnd.png";
            String nm9 = "stairs_statue_edit.jpg";
            String nm10 = "J BRAVO.png";
            String nm11 = "facing stone.png";
            String link1 = "http://localhost/mp/image/character/" + nm1;
            String link2 = "http://localhost/mp/image/character/" + nm2;
            String link3 = "http://localhost/mp/image/character/" + nm3;
            String link4 = "http://localhost/mp/image/character/" + nm4;
            String link5 = "http://localhost/mp/image/character/" + nm5;
            String link6 = "http://localhost/mp/image/character/" + nm6;
            String link7 = "http://localhost/mp/image/character/" + nm7;
            String link8 = "http://localhost/mp/image/character/" + nm8;
            String link9 = "http://localhost/mp/image/character/" + nm9;
            String link10 = "http://localhost/mp/image/character/" + nm10;
            String link11 = "http://localhost/mp/image/character/" + nm11;
        %>
        <center>
            <img class="contentImage" src="<%= link1 %>">
        </center>
        <a class="hideLink" href="imageViewer.jsp?src=<%= java.net.URLEncoder.encode(link1, "UTF-8") %>" target="_blank">
            <input type="button" id="View" value="View" class="subBtn">
        </a>
        <a download="<%= nm1 %>" href="<%= link1 %>">
            <input type="button" onclick="thanks()" id="Download" value="Download" class="subBtn">
        </a>
    </div>
    <div class="container2">
        <center>
            <img class="contentImage" src="<%= link2 %>">
        </center>
        <a class="hideLink" href="imageViewer.jsp?src=<%= java.net.URLEncoder.encode(link2, "UTF-8") %>" target="_blank">
            <input type="button" id="View" value="View" class="subBtn">
        </a>
        <a download="<%= nm2 %>" href="<%= link2 %>">
            <input type="button" onclick="thanks()" id="Download" value="Download" class="subBtn">
        </a>
    </div>
    <!-- Repeat similar containers for each image (link3, link4, ...) -->
    <div class="PageEnd">
        <p style="text-align: right;">copyright 2024</p>
    </div>
    </form>
</body>
</html>
