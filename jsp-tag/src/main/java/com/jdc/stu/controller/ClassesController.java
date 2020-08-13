package com.jdc.stu.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdc.stu.model.entity.Classes;
import com.jdc.stu.model.entity.Course;
import com.jdc.stu.model.services.ClassesService;
import com.jdc.stu.model.services.CourseService;

@WebServlet(urlPatterns = {"/classes", "/classes-edit"}, loadOnStartup = 1)
public class ClassesController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private CourseService courseService;
	private ClassesService classesService;

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
		
		courseService = new CourseService(emf.createEntityManager());
		classesService = new ClassesService(emf.createEntityManager());
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
		if("/classes-edit".equals(req.getServletPath())) {
			
			String str = req.getParameter("course");
			Course course = courseService.findById(Integer.parseInt(str));
			req.setAttribute("course", course);
			
			getServletContext().getRequestDispatcher("/classes-edit.jsp").forward(req, resp);			
		} else {
			req.setAttribute("list", classesService.getAll());
			getServletContext().getRequestDispatcher("/classes.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String courseId = req.getParameter("courseId");
		String startDate = req.getParameter("startDate");
		Course course = courseService.findById(Integer.parseInt(courseId));
		Classes cls = new Classes();
		cls.setCourse(course);
		cls.setStartDate(LocalDate.parse(startDate, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		classesService.create(cls);
		resp.sendRedirect("classes");
	}
	
}
