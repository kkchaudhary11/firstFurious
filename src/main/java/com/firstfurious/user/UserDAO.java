package com.firstfurious.user;

import java.util.List;

public interface UserDAO {
	
	public void insertUser(User u);
	public void deleteUser(long u);
	public void updateUser(User u);
	public User getUser(String uid);
	
	public List<User> getAllUsers();

}
