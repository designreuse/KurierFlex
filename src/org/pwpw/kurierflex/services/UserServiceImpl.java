package org.pwpw.kurierflex.services;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.pwpw.kurierflex.dao.UserDao;
import org.pwpw.kurierflex.dao.UserRoleDao;
import org.pwpw.kurierflex.domain.UserRole;
import org.pwpw.kurierflex.domain.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service(value="UserService")
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	@Autowired
	UserRoleDao userRoleDao;
	
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		
		Users user = userDao.getUserByUserName(username);
		
		List<GrantedAuthority> authorities = buildUserAuthority(user.getUserRole());
		
		return buildUserForAuthentication(user, authorities);
	}
	
	private User buildUserForAuthentication(Users user, List<GrantedAuthority> authorities) {
		return new User(user.getUsername(),user.getPassword(),user.getEnabled(),true,true,true,authorities);
	}
	
	private List <GrantedAuthority> buildUserAuthority (Set <UserRole> userRoles) {
		Set <GrantedAuthority> setAuths = new HashSet <GrantedAuthority>();
		
		//Build user's authorities
		for (UserRole userRole : userRoles){
			setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
		}
		
		List <GrantedAuthority> Result = new ArrayList <GrantedAuthority>(setAuths);
		return Result;
	}
	@Override
	public int createNewUserAccount(Users user, String role) {
		user.setEnabled(true);
		int userc_result = userDao.create(user);
		
		UserRole userRole = new UserRole();
		userRole.setUser(user);
		userRole.setRole(role);
		int userRolec_result = userRoleDao.create(userRole);
		
		return userc_result & userRolec_result;
	}
	@Override
	public void updateUserAccount(Users user) {
		userDao.update(user);  
	}
	@Override
	public void deleteUserAccount(Integer id) {
		userDao.delete(id);  
	}

	@Override
	public Users getUserByUsername(String username) {
		return userDao.getUserByUserName(username);
	}
		
}
