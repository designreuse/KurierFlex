package org.pwpw.kurierflex.dao;

import org.pwpw.kurierflex.domain.Users;

public interface UserDao {
	public Users getUserByUserName(String username);
	public Users getUserById(Integer id);
	
	int create(Users user);  
	void update(Users user);  
	void delete(Integer id);  
}