package com.firstfurious.user;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.firstfurious.product.Product;



@Repository
@EnableTransactionManagement
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertUser(User u) {
		
		sessionFactory.getCurrentSession().save(u);
		
	}

	@Transactional
	public void deleteUser(long u) {
		
		
	}

	@Transactional
	public void updateUser(User u) {
		
		
	}

	@Transactional
	public User getUser(String uid) {
		
		List<User> list = sessionFactory.getCurrentSession().createQuery("from User where uName = :id")
				.setString("id", uid).list();
		
		return list.get(0);
		
		
	}

	@Transactional
	public List<User> getAllUsers() {
		List<User> list = (List<User>)sessionFactory.getCurrentSession().createQuery("from User as u").list();
		
		return list;
	}
	
	
	
	
	
	
	

}
