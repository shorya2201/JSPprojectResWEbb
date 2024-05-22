package com.connection;

import java.sql.*;

public class DbConnection {
	
	public static Connection takeConnection()
	{
		Connection con = null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","shorya2201");
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
	
	public static boolean checkLogin(String user, String pass)
	{
		boolean st = false;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root" , "shorya2201");
			String query = "select * from loginInfo where user= ? and pass= ?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,user);
			ps.setString(2,pass);
			
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				st = true;
				break;
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return st;
	}
	

}
