<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.connection.DbConnection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	

			int qty = Integer.parseInt(request.getParameter("quant"));
			String id = request.getParameter("id");
			try {
		Connection con = DbConnection.takeConnection();
		
	
		PreparedStatement ps1 = con.prepareStatement("update cart set quantity =?   where item_id=?");
		ps1.setInt(1, qty);
		ps1.setString(2,id);
		ps1.executeUpdate();

		con.close();
			} catch (Exception e) {
		e.printStackTrace();
			}
			

			response.sendRedirect("cart.jsp?msg=updateSuccess");
	%>

</body>
</html>