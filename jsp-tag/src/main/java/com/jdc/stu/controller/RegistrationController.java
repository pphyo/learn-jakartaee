package com.jdc.stu.controller;

import java.io.IOException;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdc.stu.model.entity.Classes;
import com.jdc.stu.model.entity.Registration;
import com.jdc.stu.model.services.ClassesService;
import com.jdc.stu.model.services.RegistrationService;

@WebServlet(urlPatterns = {"/registration", "/registration-edit"}, loadOnStartup = 1)
public class RegistrationController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ClassesService classesService;
	private RegistrationService regService;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		
		Object obj = getServletContext().getAttribute("emf");
		
		EntityManagerFactory emf = null;
		
		if(null == obj) {
			emf = Persistence.createEntityManagerFactory("jsp-tag");
			getServletContext().setAttribute("emf", emf);
		} else {
			emf = (EntityManagerFactory) obj;
		}
		
		classesService = new ClassesService(emf.createEntityManager());
		regService = new RegistrationService(emf.createEntityManager());
	}

	@Override
	public void destroy() {
		EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
		if(null != emf && emf.isOpen()) {
			emf.close();
		}
		super.destroy();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if("/registration-edit".equals(req.getServletPath())) {
			
			String str = req.getParameter("classes");
			Classes cls = classesService.findById(Integer.parseInt(str));
			req.setAttribute("classes", cls);
			
			getServletContext().getRequestDispatcher("/registration-edit.jsp").forward(req, resp);
		} else {
			req.setAttribute("list", regService.getAll());
			getServletContext().getRequestDispatcher("/registration.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String classId = req.getParameter("classID");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		Classes cls = classesService.findById(Integer.parseInt(classId));
		Registration reg = new Registration();
		reg.setClasses(cls);
		reg.setName(name);
		reg.setPhone(phone);
		reg.setEmail(email);
		regService.create(reg);
		
		resp.sendRedirect("registration");
	}

}