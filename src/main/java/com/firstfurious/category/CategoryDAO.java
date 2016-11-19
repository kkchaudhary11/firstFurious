package com.firstfurious.category;

import java.util.List;

public interface CategoryDAO {
	
	public void insert(Category c);
	public void update(Category c);
	public void delete(int cId);
	
	public Category getCategory(int cId);
	public List<Category> getCategory();
	

}
