package com.firstfurious.product;

import java.util.List;

public interface ProductDAO {
	
	public void insert(Product p);
	public void update(Product p);
	public void delete(int pId);

	public Product getProduct(int pId);
	public List<Product> getProduct();
	public Product getProductWithMaxId();
	
}
