package com.jdc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet(urlPatterns = "/categories")
public class CategoryController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/DtSrc")
	private DataSource ds;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Category> list = new ArrayList<>();
		
		try(Connection conn = ds.getConnection();
				Statement stmt = conn.createStatement()) {
			
			ResultSet rs = stmt.executeQuery("select * from Category");
			while(rs.next()) {
				Category c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				list.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		req.setAttribute("list", list);
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
}
