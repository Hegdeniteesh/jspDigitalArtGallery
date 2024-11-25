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
        <div class="container2">
        <% // Image variables and paths
            String nm1 = "manFloating.jpg";
            String nm2 = "sadMan_spaced.png";
            String nm3 = "dragonf2f.jpg";
            String nm4 = "snekRear.png";
            String nm5 = "interstellar.png";
            String nm6 = "spaceCrash_man.png";
            String nm7 = "stone frnd.png";
            String nm8 = "unitProduction.png";
            String nm9 = "facing stone.png";

            String link1 = "http://localhost/mp/image/fantasy/" + nm1;
            String link2 = "http://localhost/mp/image/fantasy/" + nm2;
            String link3 = "http://localhost/mp/image/fantasy/" + nm3;
            String link4 = "http://localhost/mp/image/fantasy/" + nm4;
            String link5 = "http://localhost/mp/image/fantasy/" + nm5;
            String link6 = "http://localhost/mp/image/fantasy/" + nm6;
            String link7 = "http://localhost/mp/image/fantasy/" + nm7;
            String link8 = "http://localhost/mp/image/fantasy/" + nm8;
            String link9 = "http://localhost/mp/image/fantasy/" + nm9;
        %>
        <center>
            <input type="button" style="background-color: black; border: 1px solid cyan; font-family: Raleway; color: white; position: absolute;" value="premium    ">
            <img src="http://localhost/mp/image/heart.jpg" style="position: absolute; width: 20px; height:20px; margin-left: 83px; margin-top: 2px;">
            <img class="contentImage" src="<%= link1 %>">
        </center>
        <% 
            // Send variables to P_download.jsp for download and view
            String link = link1;
            String nm = nm1;
            request.setAttribute("link", link);
            request.setAttribute("nm", nm);
            RequestDispatcher rd = request.getRequestDispatcher("P_download.jsp");
            rd.include(request, response);
        %>
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
        <div class="container2">
            <center>
                <img class="contentImage" src="<%= link3 %>">
            </center>
            <a class="hideLink" href="imageViewer.jsp?src=<%= java.net.URLEncoder.encode(link3, "UTF-8") %>" target="_blank">
                <input type="button" id="View" value="View" class="subBtn">
            </a>
            <a download="<%= nm3 %>" href="<%= link3 %>">
                <input type="button" onclick="thanks()" id="Download" value="Download" class="subBtn">
            </a>
        </div>
        <!-- Repeat similar containers for the rest of the images -->
    </div>
    <div class="PageEnd">
        <p style="text-align: right;">copyright 2024</p>
    </div>
    </form>
</body>
</html>
