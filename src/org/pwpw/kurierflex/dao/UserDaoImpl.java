package org.pwpw.kurierflex.dao;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.pwpw.kurierflex.domain.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public Users getUserByUserName(String username) {
		Query queryResult;
		queryResult = sessionFactory.getCurrentSession().createQuery("from Users where username = :userName")
														.setParameter("userName", new String(username));
		return (Users) queryResult.list().get(0);
	}

	@Override
	public Users getUserById(Integer id) {
		
		Users user = (Users) sessionFactory.getCurrentSession().load(Users.class, new Integer(id));
		return user;
	}

	@Override
	public int create(Users user) {
		 return (Integer) sessionFactory.getCurrentSession().save(user);
	}

	@Override
	public void update(Users user) {
		 sessionFactory.getCurrentSession().merge(user);  
	}

	@Override
	public void delete(Integer id) {
		Users user = getUserById(id);  
		  sessionFactory.getCurrentSession().delete(user);  
	}
}
