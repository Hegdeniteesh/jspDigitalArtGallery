<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.IOException" %>
<% 
    // Get the image source URL passed as a parameter in the URL
    String imageSrc = request.getParameter("src");

    if (imageSrc == null || imageSrc.isEmpty()) {
        out.println("Image source is missing or invalid.");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Image Viewer</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #000;
        }
        img {
            max-width: 90%;
            max-height: 90%;
            border: 5px solid white;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.7);
        }
        /* Centering text */
        .overlay {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 24px;
            text-align: center;
            z-index: 10;
        }
    </style>
</head>
<body>

<!-- Image Display -->
<img src="<%= imageSrc %>" alt="Image">


<!-- Optional: Add a watermark or overlay message -->
<div class="overlay" style="background-color:black; opacity:60%">
    <h1>PREVIEW ONLY DIGITAL ART STORE.</h1>
</div>

<script>
    // Disable right-click context menu
    document.addEventListener('contextmenu', function(event) {
        event.preventDefault(); // Prevent the default context menu
    });
</script>

</body>
</html>
