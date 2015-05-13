package org.pwpw.kurierflex.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "uzytkownik_uprawnienia")
public class UserRole implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3479426499365530747L;
	@Id
	@GeneratedValue
	@Column(name = "idUzytkownikUprawnienia")
	private Integer userRoleId;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name= "login", referencedColumnName = "login")
	private Users user;
	@Column(name = "uprawnienie")
	private String role;
	
	public Integer getUserRoleId() {
		return userRoleId;
	}
	
	public void setUserRoleId(Integer userRoleId) {
		this.userRoleId = userRoleId;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
