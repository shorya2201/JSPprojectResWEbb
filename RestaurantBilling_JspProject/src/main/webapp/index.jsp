<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSP Project-2</title>
<style>
/* Gradient background for body and container */


.bgimage {
  background-image: url('https://images.unsplash.com/photo-1481833761820-0509d3217039?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Y2FmZXxlbnwwfHwwfHx8MA%3D%3D');
  background-size: cover;
  
  /* Do not repeat the image */
  background-repeat: no-repeat;
  
  /* Position the image properly */
  background-position: center;
    image-rendering: -webkit-optimize-contrast; /* Webkit browsers */
  image-rendering: crisp-edges; /* Other browsers */
  }
  
  
body, html {


  height: 100%;
  margin: 0;
  font-family: 'Helvetica Neue', sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
}


.container {
  text-align: center;
  padding: 20px;
  border-radius: 20px;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  background: rgba(255, 255, 255, 0.8);
}

.bubble {
  width: 40px;
  height: 40px;
  background-color: rgba(255, 255, 255, 0.7);
  border-radius: 50%;
  position: absolute;
  top: 90%;
  animation: floatUp 5s ease-in infinite;
}

/* Rest of the CSS remains unchanged */


.bubble {
  width: 40px;
  height: 40px;
  background-color: rgba(255, 255, 255, 0.7);
  border-radius: 50%;
  position: absolute;
  top: 90%;
  animation: floatUp 5s ease-in infinite;
}

/* Generate multiple bubbles */
@keyframes floatUp {
  0% {
    transform: translateY(0);
    opacity: 1;
  }
  100% {
    transform: translateY(-1000px);
    opacity: 0;
  }
}
 

/* Style for anchor tags to look like buttons */
a {
  padding: 15px 30px;
  margin: 20px;
  font-size: 18px;
  cursor: pointer;
  outline: none;
  color: #fff;
  text-decoration: none; /* Remove underline from links */
  background-color: #007bff;
  border: none;
  border-radius: 50px;
  box-shadow: 0 4px #999;
  transition: all 0.3s ease;

}



a.button-style:hover {
  background-color: #0056b3;
  transform: scale(1.05);
}

a.button-style:active {
  background-color: #004085;
  box-shadow: 0 2px #666;
  transform: translateY(4px);
}
input[type="text"],
input[type="password"],
select {
    width: 100%;
    padding: 12px; /* Increased padding for better visual */
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 16px; /* Increased font size for better readability */
}

select {
    appearance: none; /* Remove default select arrow */
}

input[type="submit"],a {
    width: 100%;
    background-color: #4caf50;
    color: #fff;
    padding: 12px; /* Increased padding for better visual */
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px; /* Increased font size for better readability */
}

input[type="submit"]:hover,a {
    background-color: #45a049;
}

.login-container {
    background-color: #154360;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    width: 300px;
}
</style>
</head>
<body class="bgimage">
<div class="bubble" style="left: 10%;"></div>
<div class="bubble" style="left: 20%; animation-duration: 4s;"></div>
<div class="bubble" style="left: 35%; animation-duration: 6s;"></div>
<div class="bubble" style="left: 50%; animation-duration: 3s;"></div>
<div class="bubble" style="left: 65%; animation-duration: 7s;"></div>
<div class="bubble" style="left: 80%; animation-duration: 5s;"></div>
<div class="container">
<div class="login-container">
<form action="verifyLogin.jsp" method="post">
            <input type="text" name="user" placeholder="Username">
            <input type="password" name="pass" placeholder="Password">
            <select name="role">
                <option value="user">User</option>
                <option value="admin">Admin</option>
      
            </select>
            <input type="submit" value="Login">
           
        </form>
        </div>
 <a href="guest.jsp">Guest Login</a>
</div>
</body>
</html>
   