package org.pwpw.kurierflex.dao;

import java.util.Collection;

import org.pwpw.kurierflex.domain.Parcel;

public interface ParcelDao {
	public Parcel getParcelById(Integer id);
	public Collection <Parcel> getParcelsExceptStatus(String status);
	int create(Parcel parcel);  
	void update(Parcel parcel);  
	void delete(Integer id);  
}
