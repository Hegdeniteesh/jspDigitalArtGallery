<%@ page import="java.sql.*, java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<%
    String jdbcURL = "jdbc:mysql://localhost:3306/usermp5";
    String jdbcUsername = "root";
    String jdbcPassword = "root";
    Connection con = null;

    try {
        // Establish database connection
        con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        // Retrieve 'metric' from session
        /* HttpSession session = request.getSession(false);  */// false prevents creating a new session
        if (session == null || session.getAttribute("metric") == null) {
            out.println("<script>alert('User session not found. Please log in again.');</script>");
            response.sendRedirect("login.jsp");
            return;
        }
        String metric = (String) session.getAttribute("metric");


        // Check counter
        String counterQuery = "SELECT counter FROM custname WHERE user=?";
        PreparedStatement counterStmt = con.prepareStatement(counterQuery);
        counterStmt.setString(1, metric);
        ResultSet counterRes = counterStmt.executeQuery();

        if (counterRes.next()) {
            int counter = counterRes.getInt("counter");
            if (counter == 0) {
                // Check subscription status and expiry date
                String statusQuery = "SELECT status, subEnd FROM custname WHERE user=?";
                PreparedStatement statusStmt = con.prepareStatement(statusQuery);
                statusStmt.setString(1, metric);
                ResultSet statusRes = statusStmt.executeQuery();

                while (statusRes.next()) {
                    String status = statusRes.getString("status");
                    String validDt = statusRes.getString("subEnd");
                    if ("premium".equalsIgnoreCase(status.trim())) {
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                        LocalDate validDate = LocalDate.parse(validDt, formatter);

                        if (validDate.isBefore(LocalDate.now())) {
                            // Update user to 'casual'
                            String updateQuery = "UPDATE custname SET status='casual', subEnd=CURDATE(), counter=1 WHERE user=?";
                            PreparedStatement updateStmt = con.prepareStatement(updateQuery);
                            updateStmt.setString(1, metric);
                            int updateResult = updateStmt.executeUpdate();

                            if (updateResult > 0) {
                                out.println("<script>alert('Your premium subscription has ended. Please renew it!');</script>");
                            } else {
                                out.println("<script>alert('Failed to update user status.');</script>");
                            }
                        }
                    }
                }
            }
        } else {
            out.println("<script>alert('No user found for metric: " + metric + "');</script>");
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
