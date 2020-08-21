package com.jdc.app.shopping.listener;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.jdc.app.shopping.model.entity.Sale;

@WebListener
public class SaleListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		System.out.println("Session Listener created! " + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm a")));
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		Sale sale = (Sale) session.getAttribute("cart");
		if(null != sale) {
			System.out.println("Total: " + sale.getTotal());
		}
		System.out.println("Session Listener destroyed! " + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm a")));
	}
	
}
