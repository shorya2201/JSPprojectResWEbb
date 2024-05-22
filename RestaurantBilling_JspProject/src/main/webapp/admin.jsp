<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/include/header.jsp"></jsp:include>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>
<style>
  body{
  
  margin:0;
  padding:0;  
  }
  .button-container {
  
   
  display: flex;
    flex-direction: column;
    align-items: center;
    padding-top: 180px; 
  }
  button {
    margin: 10px;
    padding: 10px 20px;
    cursor: pointer;
  }
</style>
</head>
<body>
<jsp:include page="/include/navbar.jsp"></jsp:include>
<div class="button-container">
  <button onclick="location.href='updateMenu.jsp'">Update Menu</button>
  <button onclick="location.href='manageOrder.jsp'">Manage Orders</button>

</div>
</body>
</html>
