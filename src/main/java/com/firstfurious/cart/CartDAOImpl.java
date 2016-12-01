package com.firstfurious.cart;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO{
	
	
	@Autowired
	private SessionFactory sessionFactory;
 
	public SessionFactory getSessionFactory() 
	{
		return sessionFactory.getCurrentSession().getSessionFactory();
	}

	public void setSessionFactory(SessionFactory sessionFactory) 
	{
		this.sessionFactory = sessionFactory;
	}
	
	
	public Cart getCartById(int cartId) {
		List l = sessionFactory.getCurrentSession().createQuery("from Cart where ID = :id").setInteger("id", cartId).list();
		
		if( l.size() > 0 )
			return (Cart)l.get(0);
		else
			return null;
	}

	public Cart getCartByUsername(String Username) {
		List l = sessionFactory.getCurrentSession().createQuery("from Cart where Username = :Username").setString("Username", Username).list();
		
		if( l.size() > 0 )
			return (Cart)l.get(0);
		else
			return null;
	}

	public String checkUsername(String Username) {
		List l = sessionFactory.getCurrentSession().createQuery("from Cart where Username = :Username").setString("Username", Username).list();
		
		if( l.size() == 0 )
			return "success";
		else
			return "failure";
		
	}

	public void update(Cart cart) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(cart);
		
	}

	public void add(Cart cart) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(cart);
		
	}

	public void delete(int i) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().createQuery("delete from Cart as i where i.ID = :id").setInteger("id", i).executeUpdate();

		
	}

	public void deleteByProductId(int pid) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().createQuery("delete from Cart as i where i.ProductId = :id").setInteger("id", pid).executeUpdate();

		
	}

	
	public List<Cart> getAllProduct() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Cart").list();
	}

}
