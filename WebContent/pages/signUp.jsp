<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Digital Art Gallery/Sign Up</title>
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/mainPageStyle.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/fonts.css">
    <script src="http://localhost/mp/script/mainPagescript.js"></script>
</head>
<body>
    <form name="signupForm" method="post">
    <% 
        // Include the header and menu (hidden here)
        request.getRequestDispatcher("topTitle.jsp").include(request, response);
        request.getRequestDispatcher("menuBar.jsp").include(request, response);
    %>

    <h1 class="pageTitle">CREATE YOUR ACCOUNT</h1>
    <center>
        <table class="userForm" cellspacing="15px">
            <tr>
                <td class="form">Full Name</td>
                <td>
                    <center>
                        <input 
                            type="text" 
                            name="Fullname" 
                            class="inputField2" 
                            required 
                            pattern="[a-zA-Z][a-zA-Z ]+" 
                            title="Name can't contain numbers or symbols">
                    </center>
                </td>
            </tr>  
            <tr>
                <td class="form">Username</td>
                <td>
                    <center>
                        <input type="text" name="Username" class="inputField2" required>
                    </center>
                </td>
            </tr>
            <tr>
                <td class="form">Password</td>
                <td>
                    <center>
                        <input 
                            type="password" 
                            name="Password" 
                            class="inputField2" 
                            required 
                            pattern="^.{5,16}$" 
                            title="Enter a password between 5 to 16 characters.">
                    </center>
                </td>
            </tr>
            <tr>
                <td class="form">Email</td>
                <td>
                    <center>
                        <input type="email" name="Email" class="inputField2" required>
                    </center>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <center>
                        <input type="submit" name="signup" value="SIGN UP" class="subBtn" style="position:relative;">
                    </center>
                </td>
            </tr>
            <tr>
                <td>
                    <a class="tnc" href="index.jsp">Back to login</a>
                </td>
            </tr>
        </table>    
    </center>    

    <br>             
    <div class="PageEnd">
       <p style="text-align: right;">copyright 2024</p>
    </div>
    </form>

    <%-- Database Logic --%>
    <%
        if (request.getParameter("signup") != null) {
            String fullname = request.getParameter("Fullname");
            String username = request.getParameter("Username");
            String password = request.getParameter("Password");
            String email = request.getParameter("Email");
			
            out.print("Full Name: " + fullname + ", Username: " + username + 
                    ", Password: " + password + ", Email: " + email);
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                // Database connection setup
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/usermp5", "root", "root");
                
                // Insert query
                String sql = "INSERT INTO custname VALUES (?, ?, ?, ?, 'free', NOW(), 0)";
                pstmt = conn.prepareStatement(sql);
                if (pstmt != null) 
                	out.print("connected");
                pstmt.setString(1, fullname);
                pstmt.setString(2, username);
                pstmt.setString(3, password);
                pstmt.setString(4, email);

                int result = pstmt.executeUpdate();
                out.print(result);
                if (result > 0) {
                    out.println("<script>alert('Sign-Up Successful! Please log in.'); window.location.href='index.jsp';</script>");
                } else {
                    out.println("<script>alert('Sign-Up Failed! Please try again.');</script>");
                }

            } catch (Exception e) {
                out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    out.println("<script>alert('Error closing connection: " + e.getMessage() + "');</script>");
                }
            }
        }
    %>
</body>
</html>
