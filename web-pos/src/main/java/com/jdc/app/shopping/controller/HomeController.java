package com.jdc.app.shopping.controller;

import java.io.IOException;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdc.app.shopping.model.entity.Product;
import com.jdc.app.shopping.model.entity.Sale;
import com.jdc.app.shopping.model.entity.SaleDetail;
import com.jdc.app.shopping.model.service.CategoryService;
import com.jdc.app.shopping.model.service.ProductService;
import com.jdc.app.shopping.model.service.SaleService;

@WebServlet(urlPatterns = {"/home", "/pos-search", "/add-to-cart", "/clear-detail-item", "/cart-action"})
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService proService;
	private SaleService saleService;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
		if(null == emf) {
			emf = Persistence.createEntityManagerFactory("web-pos");
			getServletContext().setAttribute("emf", emf);
		}
		CategoryService catService = new CategoryService(emf.createEntityManager());
		proService = new ProductService(emf.createEntityManager());
		saleService = new SaleService(emf.createEntityManager());
		
		getServletContext().setAttribute("categories", catService.getAll());
	}
	
	@Override
	public void destroy() {
		EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
		if(null != emf && emf.isOpen())
			emf.close();
		super.destroy();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		
		if("/pos-search".equals(path)) {
			searchProduct(req);
		} else if("/add-to-cart".equals(path)) {
			addToCart(req);
		}
		
		searchProduct(req);
		getServletContext().getRequestDispatcher("/views/home.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		HttpSession session = req.getSession(true);
		
		if("Clear".equals(action)) {
			session.setAttribute("cart", new Sale());
		} else if("Paid".equals(action)) {
			Sale s = (Sale) session.getAttribute("cart");
			if(null != s && s.getTotal() > 0) {
				saleService.save(s);
				session.setAttribute("cart", new Sale());
			}
		}
		
		resp.sendRedirect(req.getContextPath().concat("/home"));
	}

	private void addToCart(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		Sale sale = (Sale) session.getAttribute("cart");
		
		if(null == sale) {
			sale = new Sale();
			session.setAttribute("cart", sale);
		}

		int id = Integer.parseInt(req.getParameter("id"));
		
		for(SaleDetail sd : sale.getDetails()) {
			if(sd.getProduct().getId() == id) {
				sd.setQuantity(sd.getQuantity() + 1);
				return;
			}
		}
		
		Product p = proService.findById(id);
		SaleDetail details = new SaleDetail();
		details.setProduct(p);
		details.setQuantity(1);
		sale.addDetail(details);
		
	}

	private void searchProduct(HttpServletRequest req) {
		String category = req.getParameter("category");
		String name = req.getParameter("name");
		req.setAttribute("products", proService.search(category, name));
	}
	
}