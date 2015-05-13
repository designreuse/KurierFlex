package org.pwpw.kurierflex.services;


import java.util.Collection;

import org.pwpw.kurierflex.domain.Parcel;
import org.pwpw.kurierflex.domain.ParcelHistory;
import org.pwpw.kurierflex.domain.Users;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service(value="ParcelService")
public interface ParcelService {
	
	public int createNewParcel(Parcel parcel);
	public void updateParcel(Parcel parcel);
	public Parcel getParcelById(Integer id);
	public Collection<ParcelHistory> getParcelHistory(Parcel parcel);
	public Collection<Parcel> getUserParcels(Users user);
	public Collection<Parcel> getParcelsExcludeStatus(String status);
}
