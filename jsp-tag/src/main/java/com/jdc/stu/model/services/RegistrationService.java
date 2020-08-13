package com.jdc.stu.model.services;

import java.util.List;

import javax.persistence.EntityManager;

import com.jdc.stu.model.entity.Registration;

public class RegistrationService {
	
	private EntityManager em;

	public RegistrationService(EntityManager em) {
		super();
		this.em = em;
	}
	
	public void create(Registration reg) {
		em.getTransaction().begin();
		em.persist(reg);
		em.getTransaction().commit();
	}
	
	public List<Registration> getAll() {
		return em.createNamedQuery("Registration.getAll", Registration.class).getResultList();
	}

}
