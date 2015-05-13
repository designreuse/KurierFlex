package org.pwpw.kurierflex.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.pwpw.kurierflex.domain.Parcel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("parcelDao")
public class ParcelDaoImpl implements ParcelDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public Parcel getParcelById(Integer id) {
		Parcel parcel = (Parcel) sessionFactory.getCurrentSession().load(Parcel.class, new Integer(id));
		return parcel;
	}

	@Override
	public int create(Parcel parcel) {
		return (Integer) sessionFactory.getCurrentSession().save(parcel);
	}

	@Override
	public void update(Parcel parcel) {
		sessionFactory.getCurrentSession().merge(parcel);  
		
	}

	@Override
	public void delete(Integer id) {
		Parcel parcel = getParcelById(id);  
		  sessionFactory.getCurrentSession().delete(parcel);  
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Parcel> getParcelsExceptStatus(String status) {
		Query queryResult;
		queryResult = sessionFactory.getCurrentSession().createQuery("from Parcel where status <> :estatus AND courier = NULL")
														.setParameter("estatus", status);
		return (List<Parcel>) queryResult.list();
	}

}

//TODO: nie dziala odfiltrowywanie przesyłek dostarczonych... 
//TODO: trzeba odswiezac po kilka razy
//TODO: nie ma zmieniania statusu od strony kuriera
//TODO: nie ma historii zmian od strony klienta
//TODO: uzupelnianie daty dostarczenia (trigger)
