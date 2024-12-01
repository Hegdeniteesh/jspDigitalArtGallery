<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.*, jakarta.servlet.*, java.io.*" %>

<%
    // Database connection setup
    String admin = "lxander";
    Connection con = null;
    boolean isConnected = false;  // Track whether connection is successful
    try {
    	
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usermp5", "root", "root"); // Establish connection
        isConnected = true;  // Set to true if connection is successful

        // HttpSession session = request.getSession(false); // Retrieve the current session, do not create a new one
        if (session == null) {
            session = request.getSession(); // Create session only if none exists
        }

        // Handle "signup" action
        if (request.getParameter("signup") != null) {
            String Fname = request.getParameter("Fullname");
            String user = request.getParameter("Username");
            String pass = request.getParameter("Password");
            String email = request.getParameter("Email");

            String sql = "INSERT INTO custname (fname, user, pass, email, status, subEnd) VALUES (?, ?, ?, ?, 'casual', CURDATE())";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, Fname);
            stmt.setString(2, user);
            stmt.setString(3, pass);
            stmt.setString(4, email);

            int res = stmt.executeUpdate();
            if (res > 0) {
            	
                response.sendRedirect("http://localhost/mp/pages/index.jsp");
                return;
            } else {
                out.println("<p style='color:red;'>*Username already exists</p>");
            }
        }

        // Handle "logout" action
        if (request.getParameter("logout") != null) {
            session.invalidate(); // Destroy the session
            response.sendRedirect("http://localhost/mp/pages/index.jsp");
            return;
        }

        // Handle "login" action
        if (request.getParameter("login") != null) {
            String loguser = request.getParameter("Username");
            String logpass = request.getParameter("Password");

            String sql = "SELECT user, pass FROM custname WHERE user = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, loguser);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String user = rs.getString("user");
                String pass = rs.getString("pass");
                out.println("<script>alert('executed')</script>");
                if (user.equals(admin) && pass.equals(logpass)) {
                    session.setAttribute("logger", "Signed in as, " + user);
                    session.setAttribute("metric", user);

                    String sql2 = "INSERT INTO entries (user, loginTm) VALUES (?, CURDATE())";
                    PreparedStatement stmt2 = con.prepareStatement(sql2);
                    stmt2.setString(1, user);
                    stmt2.executeUpdate();

                    response.sendRedirect("http://localhost/mp/pages/adminPage.jsp?admin=" + admin);
                    return;
                } else if (user.equals(loguser) && pass.equals(logpass)) {
                    session.setAttribute("logger", "Signed in as, " + user);
                    session.setAttribute("metric", user);

                    String sql2 = "INSERT INTO entries (user, loginTm) VALUES (?, CURDATE())";
                    PreparedStatement stmt2 = con.prepareStatement(sql2);
                    stmt2.setString(1, user);
                    stmt2.executeUpdate();

                    response.sendRedirect("http://localhost/mp/pages/home.jsp");
                    return;
                } else {
                    out.println("<script>alert('INCORRECT CREDENTIALS!')</script>");
                }
            } else {
                out.println("<script>alert('INCORRECT CREDENTIALS!')</script>");
            }
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                out.println("<p style='color:red;'>Error closing connection: " + e.getMessage() + "</p>");
            }
        }
        
    }
%>
