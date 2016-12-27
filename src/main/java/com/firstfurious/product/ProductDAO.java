package com.firstfurious.product;

import java.util.List;

public interface ProductDAO {
	
	public void insert(Product p);
	public void update(Product p);
	public void delete(int pId);

	public Product getProduct(int pId);
	public List<Product> getProduct();
	
	public List<Product> getBrand();
	public List<Product> getProductByCategoryName(String pCat);
	public List<Product> getProductByBrandName(String pBrand);
	public Product getProductWithMaxId();
	
}
