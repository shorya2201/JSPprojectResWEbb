<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.connection.DbConnection"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.approve {
	color: green;
	margin-right: 1px;
	border: 2px black solid;
}

.decline {
	color: red;
	border: 2px black solid;
	margin-left: 1px;
}


table,td,th,tr{
border:1px black solid;
text-align:center;
font-size:large;
}

</style>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<jsp:include page="/include/navbar.jsp"></jsp:include>
<h1
			style="border: 4px #a881af solid; background-color:#a881af; border-radius:10px; color: black; text-align: center; max-width: fit-content; margin-left: auto; margin-right: auto;">Manage Orders</h1>
		
	<hr>
	<br>
	<div class="row">
		<div class="col=md-1"></div>
		<div class="col=md-10">
			<table class="table table-hover">
				<tr>
					<th>Order-Id</th>
					<th>Placed-By</th>
					<th>Order-Date</th>
					<th>Order-Amount</th>
					<th>Status</th>
				</tr>
				<%
				

								String appPer = (String) session.getAttribute("username");
								Date d = new Date();
								String appDate = d.toString();
								try {
									Connection con = DbConnection.takeConnection();
									PreparedStatement ps = con.prepareStatement("select * from orders");
									ResultSet rs = ps.executeQuery();
									while (rs.next()) {
										out.println("<tr>");
										out.println("<td>" + rs.getString(1) + "</td>");
										out.println("<td>" + rs.getString(2) + "</td>");
										out.println("<td>" + rs.getString(3) + "</td>");
										out.println("<td>" + rs.getString(4) + "</td>");
									
										if(rs.getString(5).equals("Approved")){
											out.println("<td style= color:green;>" + rs.getString(5) + "</td>");
											//DbConnection.insertRemData(appPer, appDate,rs.getString(1));
										}else if(rs.getString(5).equals("Declined")){
											out.println("<td style= color:red;>" + rs.getString(5) + "</td>");
										}
										if(rs.getString(5).equals("Pending")){
											out.println("<td>" + rs.getString(5) + "</td>");
											out.println("<td>" + "<a class=approve href = ./approve.jsp?order_id=" + rs.getString(1)
											+ ">Approve</a><a class=decline href = ./decline.jsp?order_id="+rs.getString(1)+">Decline</a>" + "</td>");
								}
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