<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Digital Art Gallery/Admin</title>
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/mainPageStyle.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/mp/style/fonts.css">
    <script src="http://localhost/mp/script/mainPagescript.js"></script>
</head>
<body>
    <form id="form1" method="post">
        <%@ include file="topTitle.jsp" %> <!-- includes title and logo of page -->
        <%@ include file="menuBar.jsp" %>  <!-- includes menubutton along with logged username -->
        <%
            // Redirect if not logged in or unauthorized
            String metric = (String) session.getAttribute("metric");
            if (metric == null) {
                response.sendRedirect("http://localhost/mp/pages/index.jsp");
                return;
            }
            if (!"lxander".equals(metric)) {
                response.sendRedirect("http://localhost/mp/pages/home.jsp");
                return;
            }
        %>
        <br>
        <center>
            <p class="pageTitle">Admin Page</p>
            <br>
            <label class="tnc">Total logins on date:</label>
            <input type="date" name="date" style="width: 230px; border-radius: 7px;">
            <br>
            <label class="tnc">OR</label>
            <br>
            <label class="tnc">Select a query</label>
            <select name="customQuery" style="border-radius: 7px;">
                <option value="" selected>select a query</option>
                <option value="select user, loginTm as Date from entries order by loginTm desc limit 25">Login list(user,date) limit 25</option>
                <option value="select distinct user from entries">Login list(user)</option>
                <option value="SELECT loginTm as Date, COUNT(loginTm) as total FROM entries GROUP BY loginTm HAVING COUNT(loginTm)=(SELECT MAX(mycount) FROM (SELECT loginTm, COUNT(loginTm) AS mycount FROM entries GROUP BY loginTm) as dt)">Max activity date</option>
                <option value="SELECT loginTm as Date, COUNT(loginTm) as total FROM entries GROUP BY loginTm HAVING COUNT(loginTm)=(SELECT MIN(mycount) FROM (SELECT loginTm, COUNT(loginTm) AS mycount FROM entries GROUP BY loginTm) as dt)">Min activity date</option>
            </select>
            <br>
            <label class="tnc">OR</label>
            <br>
            <label class="tnc">Enter a custom query</label>
            <input type="text" style="border-radius: 7px;" name="customQuery2" placeholder="Enter valid MYSQL query">
            <br>
            <br>
            <input type="submit" name="adminQuery" class="subBtn" style="margin-left: 0px;">
            <input type="reset" name="adminQueryReset" class="subBtn" style="margin-left: 30px;">
            <p class="tnc">
                <%
                    // Include database processing logic
                    if (request.getParameter("adminQuery") != null) {
                        String query = request.getParameter("customQuery");
                        String customQuery2 = request.getParameter("customQuery2");
                        String selectedQuery = (query != null && !query.isEmpty()) ? query : customQuery2;

                        if (selectedQuery != null && !selectedQuery.isEmpty()) {
                            try {
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mp", "username", "password");
                                Statement stmt = conn.createStatement();
                                ResultSet rs = stmt.executeQuery(selectedQuery);

                                out.println("<table border='1'><tr>");
                                ResultSetMetaData metaData = rs.getMetaData();
                                int columnCount = metaData.getColumnCount();
                                for (int i = 1; i <= columnCount; i++) {
                                    out.println("<th>" + metaData.getColumnName(i) + "</th>");
                                }
                                out.println("</tr>");
                                while (rs.next()) {
                                    out.println("<tr>");
                                    for (int i = 1; i <= columnCount; i++) {
                                        out.println("<td>" + rs.getString(i) + "</td>");
                                    }
                                    out.println("</tr>");
                                }
                                out.println("</table>");
                                rs.close();
                                stmt.close();
                                conn.close();
                            } catch (Exception e) {
                                out.println("Error: " + e.getMessage());
                            }
                        } else {
                            out.println("No query provided.");
                        }
                    }
                %>
            </p>
        </center>
    </form>
</body>
</html>
