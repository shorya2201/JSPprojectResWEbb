<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.DbConnection"%>
<%
String user = request.getParameter("user");
String pass = request.getParameter("pass");
String role = request.getParameter("role");
session.setAttribute("user", user);
boolean status = DbConnection.checkLogin(user, pass);
if (status == true) {


	session.setAttribute("username", user);
	if (role.equals("user"))
		response.sendRedirect("user.jsp");
	else if (role.equals("admin"))
		response.sendRedirect("admin.jsp");
} else {
	response.sendRedirect("index.jsp?status=false");

}
%>