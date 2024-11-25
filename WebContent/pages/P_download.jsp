<%@ page import="java.sql.*" %>
<% 
    // Database connection
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet res = null;

    String userSession = (String) session.getAttribute("metric");
    String status = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3308/usermp5", "root", "");

        // SQL query to fetch status
        String sql = "SELECT status FROM custname WHERE user = ?";
        stmt = con.prepareStatement(sql);
        stmt.setString(1, userSession);
        res = stmt.executeQuery();

        // Check the status
        if (res.next()) {
            status = res.getString("status");

            if ("premium".equalsIgnoreCase(status)) {
%>
                <a class="hideLink" href="<%= link %>" target="_blank">
                    <input type="button" id="View" value="View" class="subBtn">
                </a>
                <a download="<%= nm %>" href="<%= link %>">
                    <input type="button" onclick="thanks()" id="Download" value="Download" class="subBtn">
                </a>
<%          } else { %>
                <p style="text-align:center; color:white; margin: 5px 0px 4px 0px;">
                    For <b style="color:cyan;">premium</b> users
                </p>
<%          }
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        // Close resources
        if (res != null) try { res.close(); } catch (SQLException ignored) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
        if (con != null) try { con.close(); } catch (SQLException ignored) {}
    }
%>
