package org.pwpw.kurierflex.dao;

import org.pwpw.kurierflex.domain.UserRole;

public interface UserRoleDao {
	public UserRole getUserRoleById(Integer id);
	int create(UserRole userRole);  
	void update(UserRole userRole);  
	void delete(Integer id);  
}