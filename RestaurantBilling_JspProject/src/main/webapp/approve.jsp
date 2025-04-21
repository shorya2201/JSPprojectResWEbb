<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.connection.DbConnection"%>
<%@ page import="java.util.Date"%>
<%@page import="java.sql.*"%>

<%
	

			String id = request.getParameter("order_id");
			try {
		Connection con = DbConnection.takeConnection();
		
		String q1 = "update orders set status = 'Approved'  where order_id="+id;

		PreparedStatement ps1 = con.prepareStatement(q1);

		ps1.execute();

		con.close();
			} catch (Exception e) {
		e.printStackTrace();
			}

			response.sendRedirect("manageOrder.jsp?updateSuccess");
	%>

