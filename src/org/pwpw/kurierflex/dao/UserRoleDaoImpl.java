package org.pwpw.kurierflex.dao;


import org.hibernate.SessionFactory;
import org.pwpw.kurierflex.domain.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userRoleDao")
public class UserRoleDaoImpl implements UserRoleDao {
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public UserRole getUserRoleById(Integer id) {
		UserRole userRole = (UserRole) sessionFactory.getCurrentSession().load(UserRole.class, new Integer(id));
		return userRole;
	}

	@Override
	public int create(UserRole userRole) {
		return (Integer) sessionFactory.getCurrentSession().save(userRole);
	}

	@Override
	public void update(UserRole userRole) {
		sessionFactory.getCurrentSession().merge(userRole);
	}

	@Override
	public void delete(Integer id) {
		UserRole userRole = getUserRoleById(id);  
		  sessionFactory.getCurrentSession().delete(userRole); 
	}
	
}
