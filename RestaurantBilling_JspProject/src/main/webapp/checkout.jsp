<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.connection.DbConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CheckOut Window</title>
<style type="text/css">
table, td, th, tr {
	border: 1px black solid;
	text-align: center;
	font-size: large;
}
.green-button {
  display: inline-block;
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  margin-left:45%;
  background-color: #4CAF50;
  border: none;
  border-radius: 5px;
  box-shadow: 0 9px #999;
}

/* Button hover effect */
.green-button:hover {background-color: #45a049}

/* Button active effect */
.green-button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>
</head>
<body>


	<jsp:include page="/include/navbar.jsp"></jsp:include>

	<h1
		style="border: 4px #a881af solid; background-color: #a881af; border-radius: 10px; color: black; text-align: center; max-width: fit-content; margin-left: auto; margin-right: auto;">Bill
		Generation Window</h1>
	<div class="row">
		<div class="col=md-1"></div>
		<div class="col=md-10">
			<table class="table table-hover">
				<tr>

					<th>Item-Name</th>
					<th>Item-Price</th>
					<th>Item-Quantity</th>
					<th>Calculation</th>
					<th>Amount</th>

				</tr>
				<%
				int amount = 0;
				try {
					Connection con = DbConnection.takeConnection();
					PreparedStatement ps = con.prepareStatement("select item_name,rate,quantity from cart ");
					ResultSet rs = ps.executeQuery();
					while (rs.next()) {
						out.println("<tr>");
						out.println("<td>" + rs.getString(1) + "</td>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getString(3) + "</td>");
						
				%>
				<%
				amount = rs.getInt(2) * rs.getInt(3);
				%>
				<%
				out.println("<td>" + rs.getInt(2) + " * " + rs.getInt(3) + "</td>");
				out.println("<td>" + amount + "</td>");

				}
				con.close();
				} catch (Exception e) {
				e.printStackTrace();
				}
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td>" + " " + "</td>");
				out.println("<td>" + " " + "</td>");
				out.println("<td>" + " " + "</td>");
				out.println("<td>" + "Sum Total" + "</td>");
				out.println("<td>" + session.getAttribute("total") + "</td>");
						request.setAttribute("amnt",session.getAttribute("total"));
				%>
				
			</table>
		</div>
	</div>
	
	<div>
	<a class="green-button" href="placeOrder.jsp">CHECKOUT!</a>
	</div>

</body>
</html>