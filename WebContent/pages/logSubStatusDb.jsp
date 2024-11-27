<%@ page import="java.sql.*" %>
<%
    // Database connection details
    String jdbcURL = "jdbc:mysql://localhost:3308/usermp5";
    String jdbcUsername = "root";
    String jdbcPassword = "";
    Connection con = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        // Retrieve 'metric' from session, equivalent to `$_SESSION['metric']` in PHP
        HttpSession session = request.getSession(false);
        String metric = (session != null) ? (String) session.getAttribute("metric") : null;

        if (metric != null) {
            // SQL query to fetch user subscription status and end date
            String sql = "SELECT status, subEnd FROM custname WHERE user=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, metric);
            ResultSet res = pstmt.executeQuery();

            // Iterate through the result set
            while (res.next()) {
                String status = res.getString("status");
                String validDt = res.getString("subEnd");

                if ("premium".equals(status)) {
                    out.println("<p class='tnc' style='font-size:x-large;'>Your Premium subscription ends on " + validDt + " </p>");
                } else if ("casual".equals(status)) {
                    out.println("<p class='tnc' style='font-size:x-large;'>Consider buying premium :)</p>");
                }
            }
        } else {
            out.println("<p class='tnc' style='font-size:x-large;'>No user session found.</p>");
        }
    } catch (Exception e) {
        out.println("<p class='tnc' style='font-size:x-large; color: red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                out.println("<p class='tnc' style='font-size:x-large; color: red;'>Error closing connection: " + e.getMessage() + "</p>");
            }
        }
    }
%>
