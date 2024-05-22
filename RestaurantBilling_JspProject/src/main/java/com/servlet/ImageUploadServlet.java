package com.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.connection.DbConnection;

/**
 * Servlet implementation class ImageUploadServlet
 */
@MultipartConfig(maxFileSize=16*1024*1024)
@WebServlet("/ImageUploadServlet")
public class ImageUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String category = (String)request.getParameter("category");
		String name = (String)request.getParameter("itm_name");
		String price = (String)request.getParameter("itm_price");
		try {
			Part p =request.getPart("image");
			InputStream in = p.getInputStream();
			Connection con = DbConnection.takeConnection();
			PreparedStatement ps = con.prepareStatement("insert into items (item_name,item_price,item_category,item_quantity,item_image) values(?,?,?,1,?)");
			ps.setString(1, name);
			ps.setString(2, price);
			ps.setString(3,category);
			
			ps.setBlob(4, in);
			int i = ps.executeUpdate();
			response.sendRedirect("updateMenu.jsp?msg=success");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
