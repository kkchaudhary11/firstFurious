package com.firstfurious.product;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.firstfurious.category.Category;
import com.firstfurious.product.Product;;

@Repository
@EnableTransactionManagement
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insert(Product p) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(p);
	}

	@Transactional
	public void update(Product p) {
		sessionFactory.getCurrentSession().update(p);
		
	}

	@Transactional
	public void delete(int pId) {
		sessionFactory.getCurrentSession().createQuery("delete from Product where pId = :pid")
		.setInteger("pid", pId).executeUpdate();	
	}
	
	@Transactional
	public Product getProduct(int pid) {
		List<Product> list = sessionFactory.getCurrentSession().createQuery("from Product where pId = :id")
				.setInteger("id", pid).list();
		
		return list.get(0);
	}
	
	@Transactional
	public List<Product> getProduct(){
		List<Product> list = this.getSessionFactory().getCurrentSession().createQuery("from Product").list();
		return list;
		
	}
	
	
	@Transactional
	public List<Product> getProductByName(String pCat){
		List<Product> list = this.getSessionFactory().getCurrentSession().createQuery("from Product where pCategory = :pcat").setString("pcat", pCat).list();
		return list;
		
	}
	
	
	@Transactional
	public Product getProductWithMaxId() 
	{
		List<Product> l = sessionFactory.getCurrentSession()
				.createQuery("from Product as p where p.pId = ( select max(a.pId) from Product as a )")
				.list();

		if (l.size() > 0) {
			return l.get(0);
		} else {
			return null;
		}
	}

}
