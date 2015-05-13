package org.pwpw.kurierflex.services;

import java.util.Collection;

import org.pwpw.kurierflex.dao.ParcelDao;
import org.pwpw.kurierflex.dao.UserDao;
import org.pwpw.kurierflex.domain.Parcel;
import org.pwpw.kurierflex.domain.ParcelHistory;
import org.pwpw.kurierflex.domain.Users;
import org.pwpw.kurierflex.domain.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service(value="ParcelService")
public class ParcelServiceImpl implements ParcelService {

	@Autowired
	ParcelDao parcelDao;
	
	@Autowired 
	UserDao userDao;

	@Override
	public int createNewParcel(Parcel parcel) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); //get logged in username
		
		Users sender = userDao.getUserByUserName(name);
		
		parcel.setStatus("6");
		parcel.setSender(sender);
		parcel.setCourier(null);
		
		Integer parcel_result = parcelDao.create(parcel);
		return parcel_result;
	}

	@Override
	public Collection<ParcelHistory> getParcelHistory(Parcel parcel) {
		return parcel.getParcelHistory();
	}

	@Override
	public Collection<Parcel> getUserParcels(Users user) {
		
		for (UserRole userRole : user.getUserRole()) {
			if (userRole.getRole().equals("ROLE_ADMIN")) {
				return user.getServedParcels();
			}
			else if (userRole.getRole().equals("ROLE_USER")) {
				return user.getSentParcels();
			}
		}
		return null;
	}

	@Override
	public void updateParcel(Parcel parcel) {
		parcelDao.update(parcel);
	}

	@Override
	public Collection<Parcel> getParcelsExcludeStatus(String status) {
		return parcelDao.getParcelsExceptStatus(status);
	}

	@Override
	public Parcel getParcelById(Integer id) {
		return parcelDao.getParcelById(id);
	}

}
