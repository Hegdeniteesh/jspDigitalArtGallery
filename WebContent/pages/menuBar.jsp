<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    String logger = (String) session.getAttribute("logger"); // Directly use the implicit session variable
%>

<div id="navbar"> <!-- openHam() lets you open or close the button -->
    <input type="button" class="hamButton" name="hamburgerButton" onclick="openHam()" value="&#9776">
    <label class="signin">
        <!-- Checks if 'logger' session attribute is set and prints it if present -->
        <%= logger != null ? logger : "" %>
    </label>
</div> 

<div id="navBack" style="display: none; width: 18%;">
    <center>
        <table cellspacing="20px" width="100%"> <!-- Different options inside hamburger menu -->
            <tr>
                <td class="menuLine"><a class="menuLink" href="<%= request.getContextPath() %>/pages/home.jsp">Home</a></td>
            </tr>
            <tr>
                <td class="menuLine"><a class="menuLink" href="<%= request.getContextPath() %>/pages/logout.jsp">Logout</a></td>
            </tr>
            <tr>
                <td class="menuLine"><a class="menuLink" href="<%= request.getContextPath() %>/pages/premium.jsp">Buy Premium</a></td>
            </tr>
            <tr>
                <td class="menuLine"><a class="menuLink" href="<%= request.getContextPath() %>/pages/TnC.jsp">Terms and Conditions</a></td>
            </tr>
            <tr>
                <td class="menuLine"><a class="menuLink" href="mailto:lakshithpc666@gmail.com?subject=Digital art gallery">Contact us</a></td>
            </tr>
        </table>
    </center>
</div>
