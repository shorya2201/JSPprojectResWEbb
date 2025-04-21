<%@page import="java.awt.font.ImageGraphicAttribute"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="com.connection.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ResWebbb Menu</title>
<style type="text/css">
.menuItem {
	width: 150px;
}

td {
	text-align: center;
	font-size: large;
}

body {
	text-align: center;
}

h2 {
	text-decoration: underline;
}

a.add {
	display: inline-block;
	padding: 10px 20px;
	background-color: green;
	color: white;
	text-decoration: none;
	border-radius: 5px;
}

table, td, th {
	border: 1px black solid;
}

td, tr, th {
	text-align: center;
	font-size: large;
}

h2 {
	text-align: center;
	font-size: large;
}
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp"></jsp:include>


	<h1
		style="border: 4px #a881af solid; background-color: #a881af; border-radius: 10px; color: black; text-align: center; max-width: fit-content; margin-left: auto; margin-right: auto;">ResWebb
		Menu</h1>
	<div class="row">
		<h2>Beverages</h2>
		<div class="col=md-1"></div>
		<div class="col=md-10">
			<table class="table table-hover">
				<tr>
					<th>Item-id</th>
					<th>Item-Name</th>
					<th>Item-Price</th>
					<th>Item-Category</th>
					<th>Item-Quantity</th>
					<th>Item-Image</th>

				</tr>
				<%
				try {
					Connection con = DbConnection.takeConnection();
					String q = "select * from items where item_category='beverages'";
					PreparedStatement ps = con.prepareStatement(q);
					ResultSet rs = ps.executeQuery();
					while (rs.next()) {
						out.println("<tr>");
						out.println("<td>" + rs.getString(1) + "</td>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getString(3) + "</td>");
						out.println("<td>" + rs.getString(4) + "</td>");
						out.println("<td>" + rs.getString(5) + "</td>");
						String id = rs.getString(1);
						session.setAttribute("itm_id", id);

						// Java code to construct the URL for the anchor tag
					

						out.println("<td> <img src =image.jsp?id=" + id + "width=50 height=50></td>");
								
						String addItemUrl = "addToCart.jsp?action=add&itemId=" + rs.getString(1) + "&itemName=" + rs.getString(2) + "&itemPrice="
			                    + rs.getString(3) + "&itemCategory=" + rs.getString(4) + "&itemQty=" + rs.getString(5);
			out.println("<td>" + "<a class='add' href ='"+addItemUrl+"'>Add</a>" + "</td>");
						out.println("</tr>");

					}
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
			</table>
		</div>
	</div>
	<br>
	<h2>Appetizers</h2>
	<div class="col=md-1"></div>
	<div class="col=md-10">
		<table class="table table-hover">
			<tr>
				<th>Item-id</th>
				<th>Item-Name</th>
				<th>Item-Price</th>
				<th>Item-Category</th>
				<th>Item-Quantity</th>
				<th>Item-Image</th>

			</tr>
			<%
			try {
				Connection con = DbConnection.takeConnection();
				String q = "select * from items where item_category='appetizers'";
				PreparedStatement ps = con.prepareStatement(q);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getString(1) + "</td>");
					out.println("<td>" + rs.getString(2) + "</td>");
					out.println("<td>" + rs.getString(3) + "</td>");
					out.println("<td>" + rs.getString(4) + "</td>");
					out.println("<td>" + rs.getString(5) + "</td>");
					String id = rs.getString(1);
					session.setAttribute("itm_id", id);
					out.println("<td> <img src =image.jsp?id=" + id + "width=50 height=50></td>");
					String addItemUrl = "addToCart.jsp?action=add&itemId=" + rs.getString(1) + "&itemName=" + rs.getString(2) + "&itemPrice="
		                    + rs.getString(3) + "&itemCategory=" + rs.getString(4) + "&itemQty=" + rs.getString(5);
		out.println("<td>" + "<a class='add' href ='"+addItemUrl+"'>Add</a>" + "</td>");
					out.println("</tr>");


				}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
		</table>
	</div>

	<br>
	<h2>Main Course</h2>
	<div class="col=md-1"></div>
	<div class="col=md-10">
		<table class="table table-hover">
			<tr>
				<th>Item-id</th>
				<th>Item-Name</th>
				<th>Item-Price</th>
				<th>Item-Category</th>
				<th>Item-Quantity</th>
				<th>Item-Image</th>

			</tr>
			<%
			try {
				Connection con = DbConnection.takeConnection();
				String q = "select * from items where item_category='main_course'";
				PreparedStatement ps = con.prepareStatement(q);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getString(1) + "</td>");
					out.println("<td>" + rs.getString(2) + "</td>");
					out.println("<td>" + rs.getString(3) + "</td>");
					out.println("<td>" + rs.getString(4) + "</td>");
					out.println("<td>" + rs.getString(5) + "</td>");
					String id = rs.getString(1);
					session.setAttribute("itm_id", id);
					out.println("<td> <img src =image.jsp?id=" + id + "width=50 height=50></td>");
					String addItemUrl = "addToCart.jsp?action=add&itemId=" + rs.getString(1) + "&itemName=" + rs.getString(2) + "&itemPrice="
		                    + rs.getString(3) + "&itemCategory=" + rs.getString(4) + "&itemQty=" + rs.getString(5);
		out.println("<td>" + "<a class='add' href ='"+addItemUrl+"'>Add</a>" + "</td>");
					out.println("</tr>");


				}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
		</table>
	</div>

	<br>
	<h2>Desserts</h2>
	<div class="col=md-1"></div>
	<div class="col=md-10">
		<table class="table table-hover">
			<tr>
				<th>Item-id</th>
				<th>Item-Name</th>
				<th>Item-Price</th>
				<th>Item-Category</th>
				<th>Item-Quantity</th>
				<th>Item-Image</th>

			</tr>
			<%
			try {
				Connection con = DbConnection.takeConnection();
				String q = "select * from items where item_category='desserts'";
				PreparedStatement ps = con.prepareStatement(q);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getString(1) + "</td>");
					out.println("<td>" + rs.getString(2) + "</td>");
					out.println("<td>" + rs.getString(3) + "</td>");
					out.println("<td>" + rs.getString(4) + "</td>");
					out.println("<td>" + rs.getString(5) + "</td>");
					String id = rs.getString(1);
					session.setAttribute("itm_id", id);
					out.println("<td> <img src =image.jsp?id=" + id + "width=50 height=50></td>");
					String addItemUrl = "addToCart.jsp?action=add&itemId=" + rs.getString(1) + "&itemName=" + rs.getString(2) + "&itemPrice="
		                    + rs.getString(3) + "&itemCategory=" + rs.getString(4) + "&itemQty=" + rs.getString(5);
		out.println("<td>" + "<a class='add' href ='"+addItemUrl+"'>Add</a>" + "</td>");
					out.println("</tr>");


				}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
		</table>
	</div>

	<br>
</body>
</html>