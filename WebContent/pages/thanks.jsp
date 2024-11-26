<!DOCTYPE html>
<html>
<head>
    <title>Digital Art Gallery/Thanks</title>
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/mainPageStyle.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/fonts.css">
</head>
<body>
    <form id="form1">
        <%@ include file="topTitle.jsp" %> <!-- Includes title and logo of the page -->
        <br>
        <center>
            <!-- Only muted videos can be autoplayed in the browser! -->
            <video width="260" height="260" autoplay muted>
                <source src="http://localhost/mp/image/gif-maker.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
            <p class="title_name">Thanks for downloading!</p>
        </center>
    </form>
</body>
</html>
