<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.*" %>

<%
  //  HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("logger") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String username = (String) session.getAttribute("logger");
    String subscription = request.getParameter("subs");
    
    if (subscription == null) {
        out.println("<p>Invalid subscription plan.</p>");
        return;
    }

    int price = Integer.parseInt(subscription);

    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/usermp5", "root", "");

        // Update the user's subscription in the database
        String sql = "UPDATE custname SET status = 'premium', subscription = ? WHERE user = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, price);
        ps.setString(2, username);

        int rowsUpdated = ps.executeUpdate();

        if (rowsUpdated > 0) {
            out.println("<p>Subscription purchased successfully!</p>");
            response.setHeader("Refresh", "2; URL=dashboard.jsp"); // Redirect after 2 seconds
        } else {
            out.println("<p>Error: Unable to process the subscription. Please try again later.</p>");
        }

        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
