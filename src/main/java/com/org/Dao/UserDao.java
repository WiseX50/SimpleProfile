package com.org.Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.org.Entity.User;
import com.org.utilities.Helper;

public class UserDao {
	EntityManagerFactory emf = Helper.getEmf();

	public void saveAndUpdateUser(User u) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();

		et.begin();
		em.merge(u);
		et.commit();
	}

	public User loginUser(String email, String pwd) {
		EntityManager em = emf.createEntityManager();
		Query q = em.createQuery("select u from User u where u.email=?1 and u.password = ?2");
		q.setParameter(1, email);
		q.setParameter(2, pwd);
		List<User> resultList = q.getResultList();
		if(resultList.isEmpty())
			return null;
		return resultList.get(0);
	}
}
