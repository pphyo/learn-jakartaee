package com.jdc.app.shopping.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.jdc.app.shopping.model.entity.Product;
import com.jdc.app.shopping.model.service.CategoryService;
import com.jdc.app.shopping.model.service.ProductService;

@WebServlet(urlPatterns = {"/products", "/products/edit", "/products/upload"})
@MultipartConfig
public class ProductController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private CategoryService catService;
	private ProductService proService;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
		proService = new ProductService(emf.createEntityManager());
		catService = new CategoryService(emf.createEntityManager());
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String page = null;
		
		if("/products".equals(req.getServletPath())) {
			String catId = req.getParameter("category");
			String name = req.getParameter("name");
			
			List<Product> products = proService.search(catId, name);
			
			req.setAttribute("list", products);
			
			req.setAttribute("menuActive", "products");
			
			page = "/views/products/list.jsp";
			
		} else {
			
			String pId = req.getParameter("id");
			
			if(null != pId) {
				// edit product
				Product product = proService.findById(Integer.parseInt(pId));
				req.setAttribute("product", product);
				req.setAttribute("title", "Edit Product");
			} else {
				// add new product
				
				req.setAttribute("title", "Add New Product");
			}
			
			req.setAttribute("menuActive", "product-edit");
			page = "/views/products/edit.jsp";
		}
		
		getServletContext().getRequestDispatcher(page).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getServletPath().equals("/products")) {
			// save product
			String id = req.getParameter("id");
			String catId = req.getParameter("category");
			String name = req.getParameter("name");
			String price = req.getParameter("price");
			
			Product p = (null == id || id.isEmpty()) ? new Product() : proService.findById(Integer.parseInt(id));
			p.setCategory(catService.findById(Integer.parseInt(catId)));
			p.setName(name);
			p.setPrice(Integer.parseInt(price));
			proService.save(p);
			
		} else {
			// upload file
			Part file = req.getPart("file");
			
			try(BufferedReader br = new BufferedReader(new InputStreamReader(file.getInputStream()))) {
				List<String> list = new ArrayList<>();
				String line = null;
				while(null != (line = br.readLine()))
					list.add(line);
				
				proService.saveAll(list);
			}
			
		}
		
		resp.sendRedirect(req.getContextPath().concat("/products"));
		
	}

}
