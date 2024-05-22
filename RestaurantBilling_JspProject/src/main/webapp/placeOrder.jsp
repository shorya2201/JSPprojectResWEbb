<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@page import="com.connection.DbConnection"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Congratulation!</title>
<style>
    body {
        background-color: #f5f5dc; /* Cream color background */
        margin: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        font-family: Arial, sans-serif;
    }
    h1 {
        color: #333;
        margin: 0;
    }
   
    .button-link {
        display: inline-block;
        padding: 10px 20px;
        background-color: #007bff; /* Button color */
        color: #fff; /* Text color */
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }
    .button-link:hover {
        background-color: #0056b3; /* Darker color on hover */
    }
</style>
</head>
<body>
<% 
String name = (String)session.getAttribute("user");
Date d = new Date();
String date = d.toString();
int amount = (Integer)session.getAttribute("total");
String sts = "Pending";


try {
	Connection con = DbConnection.takeConnection();
	
	PreparedStatement ps = con.prepareStatement("insert into orders(username,order_date,order_amount,status) values(?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,date);
	ps.setInt(3,amount);
	ps.setString(4,sts);
ps.execute();
	
	con.close();
} catch (Exception e) {
	e.printStackTrace();
}
%>


  <h1>Order is Placed Successfully!!!!Yayyy!!!!</h1>
    <a href="user.jsp"  class="button-link">Go to HomePage</a>

</body>
</html>