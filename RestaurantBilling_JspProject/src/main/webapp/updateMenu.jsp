<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.connection.DbConnection"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/include/header.jsp"></jsp:include>
<meta charset="ISO-8859-1">
<title>Update Menu</title>
<style type="text/css">
.addItem {
	margin: auto;
	margin-top: 20px;
	margin-left: 35%;
}

table, td, th {
	border: 1px black solid;
}

td, th, tr {
	text-align: center;
	font-size: medium;
}
.delete {
	color: red;
	border: 2px black solid;
	margin-left: 1px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="index.jsp"> <img
			src="https://cdn-icons-png.flaticon.com/128/878/878052.png"
			width="30" height="30" class="d-inline-block align-top" alt="">
			ResWebbb
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item active"><a class="nav-link"
					href="admin.jsp">Home </a></li>
				<li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a>
				</li>
			</ul>

		</div>
	</nav>

	<h1
		style="border: 4px #a881af solid; margin-top: 50px; background-color: #a881af; border-radius: 10px; color: black; text-align: center; max-width: fit-content; margin-left: auto; margin-right: auto;">Update
		Menu</h1>


	<form action="ImageUploadServlet" method="post"
		enctype="multipart/form-data">
		<table class="addItem">
			<tr>
				<th>Choose Category:</th>
				<td><select name="category"><option>beverages</option>
						<option>appetizers</option>
						<option>main_course</option>
						<option>desserts</option></select></td>
			</tr>
			<tr>
				<th>Item Name:</th>
				<td><input type="text" name="itm_name"
					placeholder="Enter the Item Name" /></td>
			</tr>
			<tr>
				<th>Item Price:</th>
				<td><input type="text" name="itm_price"
					placeholder="Enter the Item Price" /></td>
			</tr>
			
			<tr>
				<th>Upload Item Image</th>
				<td><input type="file" name="image" /></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="submit" value="Update Menu" /></td>
			</tr>
		</table>
	</form>
	<br>
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
					<th>Item-Image</th>

				</tr>
				<%
								try {
									Connection con = DbConnection.takeConnection();
									String q = "select * from items";
									PreparedStatement ps = con.prepareStatement(q);
									ResultSet rs = ps.executeQuery();
									int i=0;
									String ind="0";
									while (rs.next()) {
										while(i<1){
										 ind = rs.getString(1);
										session.setAttribute("itm_id", ind);
										i++;
										}
										String id = rs.getString(1);
										out.println("<tr>");
										out.println("<td>" + rs.getString(1) + "</td>");
										out.println("<td>" + rs.getString(2) + "</td>");
										out.println("<td>" + rs.getString(3) + "</td>");
										out.println("<td>" + rs.getString(4) + "</td>");
										out.println("<td>" + rs.getString(5) + "</td>");
										out.println("<td> <img src =image.jsp?id=" +id+ "width=50 height=50></td>");
										out.println("<td>" + "<a class=delete href = ./deleteItem.jsp?item_id=" + rs.getString(1)
										+ ">Delete Item</a>" + "</td>");
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
</body>
</html>