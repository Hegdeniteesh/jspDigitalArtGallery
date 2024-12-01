<%@ page import="java.sql.*, java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<%
    // JavaScript to handle reload logic
%>
<script>
    window.onload = function() {
        if (!window.location.hash) {
            window.location = window.location + "#loaded";
            window.location.reload();
        }
    }
</script>

<%
    // Database connection details
    String jdbcURL = "jdbc:mysql://localhost:3306/usermp5";
    String jdbcUsername = "root";
    String jdbcPassword = "root";
    Connection con = null;

    try {
        // Establish database connection
        con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        // Retrieve 'metric' from session
     //   HttpSession session = request.getSession(false);
        String metric = (session != null) ? (String) session.getAttribute("metric") : null;

        if (metric != null) {
            // Query to get the counter value
            String counterQuery = "SELECT counter FROM custname WHERE user=?";
            PreparedStatement counterStmt = con.prepareStatement(counterQuery);
            counterStmt.setString(1, metric);
            ResultSet counterRes = counterStmt.executeQuery();

            while (counterRes.next()) {
                int counter = counterRes.getInt("counter");

                if (counter == 0) {
                    // Query to check subscription status and end date
                    String statusQuery = "SELECT status, subEnd FROM custname WHERE user=?";
                    PreparedStatement statusStmt = con.prepareStatement(statusQuery);
                    statusStmt.setString(1, metric);
                    ResultSet statusRes = statusStmt.executeQuery();

                    while (statusRes.next()) {
                        String status = statusRes.getString("status");
                        String validDt = statusRes.getString("subEnd");

                        // Check if the subscription has expired
                        if ("premium".equals(status) && LocalDate.parse(validDt).isBefore(LocalDate.now())) {
                            // Update user to 'casual' status and reset counter
                            String updateQuery = "UPDATE custname SET status='casual', subEnd=CURDATE(), counter=1 WHERE user=?";
                            PreparedStatement updateStmt = con.prepareStatement(updateQuery);
                            updateStmt.setString(1, metric);
                            int updateResult = updateStmt.executeUpdate();

                            if (updateResult > 0) {
                                // Notify user about subscription expiration
                                out.println("<script>alert('Your premium subscription has ended. Please renew it!');</script>");
                            }
                        }
                    }
                }
            }
        } else {
            out.println("<script>alert('User session is not available!');</script>");
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
