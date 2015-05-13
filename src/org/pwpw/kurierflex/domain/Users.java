package org.pwpw.kurierflex.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;


@Entity
@Table(name = "uzytkownicy")
public class Users implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6492784293903501402L;
	@Id
	@GeneratedValue
	@Column(name = "idUzytkownik")
	private Integer userId;
	@Column(name = "login")
	private String username;
	@Column(name = "haslo")
	private String password;
	@Transient
	public String repeatedPassword;
	@Column(name = "imie")
	private String imie;
	@Column(name = "nazwisko")
	private String nazwisko;
	@Column(name = "adres")
	private String adres;
	@Column(name = "miasto")
	private String miasto;
	@Column(name = "kodPocztowy")
	private String kodPocztowy;
	@Column(name = "nrTelefonu")
	private String nrTelefonu;
	@Column(name = "dataZalozenia")
	@Temporal(TemporalType.DATE)
	private Date dataZalozenia = new Date();
	@Column(name = "aktywnosc")
	private Boolean enabled = false;
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "user")
	private Set<UserRole> userRole = new HashSet<UserRole>(0);
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "sender")
	private Set<Parcel> sentParcels = new HashSet<Parcel>(0);
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "courier")
	private Set<Parcel> servedParcels = new HashSet<Parcel>(0);
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRepeatedPassword() {
		return repeatedPassword;
	}
	public void setRepeatedPassword(String repeatedPassword) {
		this.repeatedPassword = repeatedPassword;
	}
	public String getImie() {
		return imie;
	}
	public void setImie(String imie) {
		this.imie = imie;
	}
	public String getNazwisko() {
		return nazwisko;
	}
	public void setNazwisko(String nazwisko) {
		this.nazwisko = nazwisko;
	}
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public String getMiasto() {
		return miasto;
	}
	public void setMiasto(String miasto) {
		this.miasto = miasto;
	}
	public String getKodPocztowy() {
		return kodPocztowy;
	}
	public void setKodPocztowy(String kodPocztowy) {
		this.kodPocztowy = kodPocztowy;
	}
	public String getNrTelefonu() {
		return nrTelefonu;
	}
	public void setNrTelefonu(String nrTelefonu) {
		this.nrTelefonu = nrTelefonu;
	}
	public Date getDataZalozenia() {
		return dataZalozenia;
	}
	public void setDataZalozenia(Date dataZalozenia) {
		this.dataZalozenia = dataZalozenia;
	}
	public Boolean getEnabled() {
		return enabled;
	}
	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	public Set<UserRole> getUserRole() {
		return userRole;
	}
	public void setUserRole(Set<UserRole> userRole) {
		this.userRole = userRole;
	}
	public Set<Parcel> getSentParcels() {
		return sentParcels;
	}
	public void setSentParcels(Set<Parcel> sentParcels) {
		this.sentParcels = sentParcels;
	}
	public Set<Parcel> getServedParcels() {
		return servedParcels;
	}
	public void setServedParcels(Set<Parcel> servedParcels) {
		this.servedParcels = servedParcels;
	}
}

