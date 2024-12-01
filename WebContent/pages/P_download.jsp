<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<% 
    // Database connection
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet res = null;

    String userSession = (String) session.getAttribute("metric");
    String status = null;

    // Retrieve the 'link' from the request
    String link = request.getParameter("link");
    String nm = link != null ? link.substring(link.lastIndexOf("/") + 1) : "default_image.png"; // Extract filename

    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usermp5", "root", "root");

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
