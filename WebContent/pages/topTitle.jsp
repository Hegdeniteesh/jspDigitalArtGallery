<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Digital Art Store</title>
    <link rel="stylesheet" type="text/css" href="style/mainPageStyle.css"> <!-- Update with your CSS path -->
    <link rel="stylesheet" type="text/css" href="style/fonts.css"> <!-- Font styles -->
</head>
<body>
    <div id="titleOutsideBox">
        <!-- Dynamically load the logo path -->
        <img id="Image1" src="<%= request.getContextPath() %>/image/logoDATranscrop.png" alt="Digital Art Store Logo"> 
        <!-- 'request.getContextPath()' ensures paths are relative to the web app's root -->
    </div>
    <div id="DAGtitle">
        <span class="title_name">DIGITAL <strong>ART</strong> STORE</span> <!-- Title text -->
    </div>
</body>
</html>
