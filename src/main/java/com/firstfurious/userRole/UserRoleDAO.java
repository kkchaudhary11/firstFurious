package com.firstfurious.userRole;


import java.util.List;



public interface UserRoleDAO 
{
	public void insertUserRole(UserRole u);
	public void deleteUserRole(long u);
	public void updateUserRole(UserRole u);
	public UserRole getUserRole(int u);
	    public List<UserRole> getAllUsersRole();
	    public void generateUserRoles();
	    

}