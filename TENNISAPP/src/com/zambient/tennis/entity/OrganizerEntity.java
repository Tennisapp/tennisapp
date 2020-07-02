package com.zambient.tennis.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="organizer")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 

public class OrganizerEntity  implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="org_id")
	private long orgId;
	
	@Column(name="org_name")
	private String orgName;
	
	@Column(name="org_add")
	private String orgAdd;
	
	@Column(name="org_add2")
	private String orgAdd2;
	
	@Column(name="org_phone")
	private String orgPhone;
	
	@Column(name="org_mailid")
	private String orgMailId;
	
	@Column(name="org_password")
	private String orgPassword;
	
	@Column(name="org_repassword")
	private String orgRePassword;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="time_stamp")
	private Date createdTime;

	public long getOrgId() {
		return orgId;
	}

	public void setOrgId(long orgId) {
		this.orgId = orgId;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getOrgAdd() {
		return orgAdd;
	}

	public void setOrgAdd(String orgAdd) {
		this.orgAdd = orgAdd;
	}

	public String getOrgPhone() {
		return orgPhone;
	}

	public void setOrgPhone(String orgPhone) {
		this.orgPhone = orgPhone;
	}

	public String getOrgMailId() {
		return orgMailId;
	}

	public void setOrgMailId(String orgMailId) {
		this.orgMailId = orgMailId;
	}

	public String getOrgPassword() {
		return orgPassword;
	}

	public void setOrgPassword(String orgPassword) {
		this.orgPassword = orgPassword;
	}

	public String getOrgRePassword() {
		return orgRePassword;
	}

	public void setOrgRePassword(String orgRePassword) {
		this.orgRePassword = orgRePassword;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getOrgAdd2() {
		return orgAdd2;
	}

	public void setOrgAdd2(String orgAdd2) {
		this.orgAdd2 = orgAdd2;
	}
}
