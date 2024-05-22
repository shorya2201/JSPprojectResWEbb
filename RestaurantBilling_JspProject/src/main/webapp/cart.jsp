
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*"%>
<%@page import="com.connection.DbConnection"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">


table,td,th,tr{
border:1px black solid;
}
td,th{
text-align:center;
font-size:large;
}
.below{
margin:20px 45% 0 40%;
 background-color: #f0f0f0; /* Light grey background */
    border: 2px solid #333333; /* Dark grey border */
    border-radius: 10px; /* Rounded corners */
    padding: 20px; /* Space inside the div */
    text-align:center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
}
.redirect{
 background-color: #e0e0e0; /* Light grey background */
    border: 2px solid #333333; /* Dark grey border */
    border-radius: 10px; /* Rounded corners */
    padding: 20px; /* Space inside the div */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */

    margin-left:43%;
}
</style>
<meta charset="ISO-8859-1">
<title>Legal DashBoard</title>

</head>
<body>

<jsp:include page="/include/navbar.jsp"></jsp:include>
<div class="row">
		<div class="col=md-1"></div>
		<div class="col=md-10">
			<table class="table table-hover">
				<tr>
					<th>Item-id</th>
					<th>Item-Name</th>
					<th>Item-Price</th>
					<th>Item-Category</th>
					<th>Item-Quantity</th>
					<th>Update-Quantity</th>
					<th>Confirm</th>
				

				</tr>
				
				<%
					int total =0;
				try {
					Connection con = DbConnection.takeConnection();
					String q = "select * from cart";
					PreparedStatement ps = con.prepareStatement(q);
					ResultSet rs = ps.executeQuery();
					while (rs.next()) {
						out.println("<tr>");
						out.println("<td>" + rs.getString(1) + "</td>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getString(3) + "</td>");
						out.println("<td>" + rs.getString(4) + "</td>");
						out.println("<td>" + rs.getString(5) + "</td>");
						out.println("<td>"+"<form style='width:50px;' action=updateQuantity.jsp?id="+rs.getString(1)+" method=post><input type=number name=quant value=1>"+ "</td>");
						out.println("<td>"+"<button type=submit>Update Quantity</button></form>"+"</td>");
						
						
	 
	
	int intertotal = rs.getInt(3)*rs.getInt(5);
	total+=intertotal;
	
					

						// Java code to construct the URL for the anchor tag
					

						/*out.println("<td> <img src =image.jsp?id=" + id + "width=50 height=50></td>");
								
						String addItemUrl = "deleteCart.jsp?action=add&itemId=" + rs.getString(1) + "&itemName=" + rs.getString(2) + "&itemPrice="
			                    + rs.getString(3) + "&itemCategory=" + rs.getString(4) + "&itemQty=" + rs.getString(5);
			out.println("<td>" + "<a class='add' href ='"+addItemUrl+"'>Remove</a>" + "</td>");
						out.println("</tr>");*/

					}
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				session.setAttribute("total",total);
				
				%>
			</table>
		</div>
	</div>

	<div class="below">
	Total Amount:<%=session.getAttribute("total") %>
	</div>
	<br>
	<div>
	<a class="redirect" href="checkout.jsp">CHECKOUT!</a>
	</div>
	
	</body>
</html>