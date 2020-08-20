package com.jdc.app.shopping.model.service;

import java.util.List;

import javax.persistence.EntityManager;

import com.jdc.app.shopping.model.entity.Category;

public class CategoryService {
	
	private EntityManager em;

	public CategoryService(EntityManager em) {
		super();
		this.em = em;
	}
	
	public Category findById(int id) {
		return em.find(Category.class, id);
	}
	
	public List<Category> getAll() {
		return em.createNamedQuery("Category.getAll", Category.class).getResultList();
	}

}
