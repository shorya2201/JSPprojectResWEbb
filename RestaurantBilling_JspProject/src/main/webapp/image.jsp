<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="com.connection.DbConnection"%>
    
   <%
   
   Blob image = null;
   byte[] imgData = null;
   ResultSet rs = null;
   Statement s=null;
   String id = request.getParameter("id");
   
   try{
	   
	   Connection con = DbConnection.takeConnection();
	   s=con.createStatement();
	   rs= s.executeQuery("select item_image from items where item_id= '"+id+"' ");
	   if(rs.next()){
		   image = rs.getBlob(1);
		   imgData = image.getBytes(1,(int)image.length());
	   }else{
		   out.println("Display Blob example image not found for image");
				   return;
	   }
	   
	   response.setContentType("image/gif");
	   OutputStream o = response.getOutputStream();
	   o.write(imgData);
	   o.flush();
	   o.close();
	   
   }catch(Exception e){
	   e.printStackTrace();
   }finally{
	   try{
	   rs.close();
	   s.close();
	   }catch(Exception e){
		   e.printStackTrace();
	   }
   }
   
   %>