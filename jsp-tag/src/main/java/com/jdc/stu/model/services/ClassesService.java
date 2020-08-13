package com.jdc.stu.model.services;

import java.util.List;

import javax.persistence.EntityManager;

import com.jdc.stu.model.entity.Classes;

public class ClassesService {
	
	private EntityManager em;

	public ClassesService(EntityManager em) {
		super();
		this.em = em;
	}
	
	public void create(Classes cls) {
		em.getTransaction().begin();
		em.persist(cls);
		em.getTransaction().commit();
	}
	
	public List<Classes> getAll() {
		return em.createNamedQuery("Classes.getAll", Classes.class).getResultList();
	}

	public Classes findById(int id) {
		return em.find(Classes.class, id);
	}

}
