<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.*" %>
<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet res = null;

    try {
        // Database connection
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usermp5", "root", "root");

        // Retrieve user status
        String userMetric = (String) session.getAttribute("metric"); // Fetch from session
        String query = "SELECT status FROM custname WHERE user = ?";
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, userMetric);
        res = pstmt.executeQuery();

        boolean isPremium = false;

        while (res.next()) {
            String status = res.getString("status");
            if ("premium".equalsIgnoreCase(status)) {
                isPremium = true;
                out.println("<script>alert('You are already a premium user!!!');");
                out.println("location.href='http://localhost/mp/pages/home.jsp';</script>");
                break;
            }
        }

        if (!isPremium && request.getParameter("buy") != null) {
            String val = request.getParameter("subs");
            String dateQt = "";

            // Determine subscription duration
            if ("200".equals(val)) {
                dateQt = "1 MONTH";
            } else if ("500".equals(val)) {
                dateQt = "3 MONTH";
            } else if ("1900".equals(val)) {
                dateQt = "12 MONTH";
            }

            // Update user subscription details
            String updateQuery = "UPDATE custname SET status = 'premium', subEnd = DATE_ADD(subEnd, INTERVAL " + dateQt + "), counter = 0 WHERE user = ?";
            pstmt = con.prepareStatement(updateQuery);
            pstmt.setString(1, userMetric);
            int updateResult = pstmt.executeUpdate();

            if (updateResult > 0) {
                response.sendRedirect("upgrade.jsp?val=" + val + "&dateQt=" + dateQt);
                return; // Stop further execution
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
    } finally {
        try {
            if (res != null) res.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<script>alert('Error closing connection: " + e.getMessage() + "');</script>");
        }
    }
%>
