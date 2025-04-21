<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@page import="com.connection.DbConnection"%>
<%
session.invalidate();
response.sendRedirect("index.jsp");
try {
	Connection con = DbConnection.takeConnection();
	PreparedStatement ps = con.prepareStatement("truncate table cart");
ps.execute();
	con.close();
	
} catch (Exception e) {
	e.printStackTrace();
}
%>