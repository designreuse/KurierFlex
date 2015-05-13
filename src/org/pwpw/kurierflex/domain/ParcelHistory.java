package org.pwpw.kurierflex.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "historiapaczki")
public class ParcelHistory implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 325425657338632049L;

	@Id
	@GeneratedValue
	@Column(name = "idHistoria")
	private Integer historyId;
	@Column(name = "status")
	private String status;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "czasZmiany")
	private Date updateTime;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name= "idPaczka", referencedColumnName = "idPaczka")
	private Parcel parcel;

	public Integer getHistoryId() {
		return historyId;
	}

	public void setHistoryId(Integer historyId) {
		this.historyId = historyId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Parcel getParcel() {
		return parcel;
	}

	public void setParcel(Parcel parcel) {
		this.parcel = parcel;
	}
}

