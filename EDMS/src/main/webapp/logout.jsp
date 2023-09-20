<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    // Invalidate the current session
    //session.setAttribute("loggedInUser", null);
HttpSession sessin = request.getSession(false);
if (sessin != null) {
    sessin.invalidate();
}
    // Redirect to the login page or any other appropriate page
    response.sendRedirect("Home.jsp"); // Replace "login.jsp" with your login page URL
%>
