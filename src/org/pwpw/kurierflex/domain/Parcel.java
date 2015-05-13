package org.pwpw.kurierflex.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name = "paczka")
public class Parcel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7545309307376564844L;

	@Id
	@GeneratedValue
	@Column(name = "idPaczka")
	private Integer parcelId;
	@Column(name = "statusZamowienia")
	private String status;
	@Column(name = "wartoscCalkowitaZl")
	private Float value;
	@Column(name = "gabaryt")
	private String dimension;
	@Column(name = "dataZlozeniaZam")
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private Date orderDate = new Date();
	@Column(name = "dataDostarczenia")
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private Date deliveryDate;
	@Column(name = "imieOdbiorcy")
	private String name;
	@Column(name = "nazwiskoOdbiorcy")
	private String surname;
	@Column(name = "adresOdbiorcy")
	private String address;
	@Column(name = "miastoOdbiorcy")
	private String city;
	@Column(name = "kodPocztowyOdbiorcy")
	private String postalCode;
	@Column(name = "nrTelefonuOdbiorcy")
	private String phone;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name= "idUzytkownik", referencedColumnName = "idUzytkownik")
	private Users sender;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name= "idKurier", referencedColumnName = "idUzytkownik")
	private Users courier;
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "parcel")
	private Set<ParcelHistory> parcelHistory = new HashSet<ParcelHistory>(0);
	
	public Integer getParcelId() {
		return parcelId;
	}
	public void setParcelId(Integer parcelId) {
		this.parcelId = parcelId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Float getValue() {
		return value;
	}
	public void setValue(Float value) {
		this.value = value;
	}
	public String getDimension() {
		return dimension;
	}
	public void setDimension(String dimension) {
		this.dimension = dimension;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Date getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Users getSender() {
		return sender;
	}
	public void setSender(Users sender) {
		this.sender = sender;
	}
	public Users getCourier() {
		return courier;
	}
	public void setCourier(Users courier) {
		this.courier = courier;
	}
	public Set<ParcelHistory> getParcelHistory() {
		return parcelHistory;
	}
	public void setParcelHistory(Set<ParcelHistory> parcelHistory) {
		this.parcelHistory = parcelHistory;
	}
}
