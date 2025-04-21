<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*"%>
<%@page import="com.connection.DbConnection"%>
<%
try{
    String id = request.getParameter("itemId");
    Connection con = DbConnection.takeConnection();
    String q = "delete from cart where item_id='" + id+"' ";
    PreparedStatement ps = con.prepareStatement(q);
    ps.execute();
    con.setAutoCommit(true);
    con.close();
    }catch(Exception e){
    	e.printStackTrace();
    }
    response.sendRedirect("addToCart.jsp?msg=deleteSuccess");
    
%>