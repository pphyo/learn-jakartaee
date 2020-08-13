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

import com.jdc.stu.model.entity.Course;
import com.jdc.stu.model.services.CourseService;

@WebServlet(urlPatterns = "/courses", loadOnStartup = 1)
public class CoursesController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private CourseService service;
	
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
		
		service = new CourseService(emf.createEntityManager());
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("list", service.getAll());
		getServletContext().getRequestDispatcher("/courses.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//get request params
		Course c = (Course) req.getAttribute("course");
		
		//create course
		service.create(c);
		
		//redirect to course list
		resp.sendRedirect("courses");
	}
	
	@Override
	public void destroy() {
		EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
		if(null != emf && emf.isOpen()) {
			emf.close();
		}
		super.destroy();
	}

}
