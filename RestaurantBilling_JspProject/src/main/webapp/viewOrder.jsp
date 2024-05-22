<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@page import="com.connection.DbConnection"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/include/header.jsp"></jsp:include>
<meta charset="ISO-8859-1">
<title>User Orders</title>
</head>
<body>
<jsp:include page="/include/navbar.jsp"></jsp:include>


<div class="row">
		<div class="col=md-1"></div>
		<div class="col=md-10">
			<table class="table table-hover">
				<tr>
					<th>Order-Id</th>
					<th>Placed-By</th>
					<th>Order-Date</th>
					<th>Order-Amount</th>
				</tr>
				<%
				

								String appPer = (String) session.getAttribute("username");
								Date d = new Date();
								String appDate = d.toString();
								try {
									Connection con = DbConnection.takeConnection();
									String q = "select * from orders";
									PreparedStatement ps = con.prepareStatement(q);
									ResultSet rs = ps.executeQuery();
									while (rs.next()) {
										out.println("<tr>");
										out.println("<td>" + rs.getString(1) + "</td>");
										out.println("<td>" + rs.getString(2) + "</td>");
										out.println("<td>" + rs.getString(3) + "</td>");
										out.println("<td>" + rs.getString(4) + "</td>");
										out.println("</tr>");
									}
									con.close();
								} catch (Exception e) {
									e.printStackTrace();
								}
				%>
			</table>
		</div>
		<div class="col=md-1"></div>
	</div>

</body>
</html>