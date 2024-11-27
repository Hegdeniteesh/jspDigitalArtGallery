<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String jdbcURL = "jdbc:mysql://localhost:3308/usermp5";
    String jdbcUsername = "root";
    String jdbcPassword = "";
    Connection con = null;

    try {
        // Connect to the database
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        if (request.getParameter("adminQuery") != null) {
            String dateVal = request.getParameter("date");
            if (dateVal != null && !dateVal.isEmpty()) {
                String sql3 = "SELECT COUNT(loginTm) AS count FROM entries WHERE loginTm=?";
                PreparedStatement pstmt = con.prepareStatement(sql3);
                pstmt.setString(1, dateVal);
                ResultSet res3 = pstmt.executeQuery();

                out.println("Query Results: <br>");
                out.println("Number of users logged in on <b>" + dateVal + "</b> is: ");
                while (res3.next()) {
                    out.println(res3.getInt("count"));
                }
            } else if (request.getParameter("customQuery") != null && !request.getParameter("customQuery").isEmpty()) {
                String secQuery = request.getParameter("customQuery");
                Statement stmt = con.createStatement();
                ResultSet res3 = stmt.executeQuery(secQuery);

                out.println("Query Results: <br>");
                while (res3.next()) {
                    ResultSetMetaData metaData = res3.getMetaData();
                    int columnCount = metaData.getColumnCount();
                    for (int i = 1; i <= columnCount; i++) {
                        String columnName = metaData.getColumnName(i);
                        String value = res3.getString(i);
                        out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + columnName + ": " + value + "<br>");
                    }
                }
            } else if (request.getParameter("customQuery2") != null && !request.getParameter("customQuery2").isEmpty()) {
                String secQuery2 = request.getParameter("customQuery2");
                Statement stmt2 = con.createStatement();
                ResultSet res4 = stmt2.executeQuery(secQuery2);

                out.println("Query Results: <br>");
                while (res4.next()) {
                    ResultSetMetaData metaData = res4.getMetaData();
                    int columnCount = metaData.getColumnCount();
                    for (int i = 1; i <= columnCount; i++) {
                        String columnName = metaData.getColumnName(i);
                        String value = res4.getString(i);
                        out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + columnName + ": " + value + "<br>");
                    }
                }
            }
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                out.println("Error closing connection: " + e.getMessage());
            }
        }
    }
%>
