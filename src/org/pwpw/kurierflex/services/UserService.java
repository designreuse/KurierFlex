package org.pwpw.kurierflex.services;


import org.pwpw.kurierflex.domain.Users;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {
	
	public int createNewUserAccount(Users user, String role);
	public void updateUserAccount(Users user);
	public void deleteUserAccount(Integer id);
	public Users getUserByUsername(String username);
}
