package com.jdc.serv;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/for-http", loadOnStartup = 1)
public class ServletForHttp extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		resp.getWriter()
			.append("<html><body>")
			.append("<h1>")
			.append("Name is ").append(name)
			.append("</h1>")
			.append("</body></html>")
			.flush();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String name = req.getParameter("name");
		String subject = req.getParameter("subject");
		String gender = req.getParameter("gender");
		String[] interests = req.getParameterValues("interest");
		
		StringBuilder sb = new StringBuilder();
		for(int i = 0; i < interests.length; i++) {
			if(i > 0) {
				sb.append(", ");
			}
			sb.append(interests[i]);
		}
		
		resp.getWriter().append("<html>")
						.append("<head><title>")
						.append("Post Information Send")
						.append("</title></head>")
						.append("<body>")
						.append("<table>")
						.append("<tr><td>").append("Name is").append("</td>").append("<td>").append(name).append("</td></tr>")
						.append("<tr><td>").append("Subject is").append("</td>").append("<td>").append(subject).append("</td></tr>")
						.append("<tr><td>").append("Gender is").append("</td>").append("<td>").append(gender).append("</td></tr>")
						.append("<tr><td>").append("Interests are").append("</td>").append("<td>").append(sb.toString()).append("</td></tr>")
						.append("</table")
						.append("</body></html>");
		
	}

}
