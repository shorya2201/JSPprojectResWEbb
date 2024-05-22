<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.connection.DbConnection"%>
	<jsp:include page="/include/navbar.jsp"></jsp:include>
<%
String id = request.getParameter("itemId");
String name = request.getParameter("itemName");
String price = request.getParameter("itemPrice");
String category = request.getParameter("itemCategory");
String qty = request.getParameter("itemQty");

try{
	Connection con = DbConnection.takeConnection();
	PreparedStatement ps = con.prepareStatement("insert into cart(item_name,rate,category,quantity) values(?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, price);
	ps.setString(3, category);
	ps.setString(4,qty);
	ps.execute();
	con.setAutoCommit(true);
}catch(Exception e){
	e.printStackTrace();
}
response.sendRedirect("showMenu.jsp?msg=addSuccess");
%>
