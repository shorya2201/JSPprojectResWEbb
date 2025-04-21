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
<div class="button-container">
  <button onclick="location.href='updateMenu.jsp'">Update Menu</button>
  <button onclick="location.href='manageOrder.jsp'">Manage Orders</button>

</div>
</body>
</html>
