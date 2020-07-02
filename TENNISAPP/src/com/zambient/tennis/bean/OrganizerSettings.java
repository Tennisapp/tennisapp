package com.zambient.tennis.bean;

import java.io.Serializable;

public class OrganizerSettings  implements Serializable{
	
	private int org_id;
	
	private String org_name;
	
	private String org_add;
	
	private String org_add2;
	
	private String org_phone;
	
	private String org_mailid;

	public int getOrg_id() {
		return org_id;
	}

	public void setOrg_id(int org_id) {
		this.org_id = org_id;
	}

	public String getOrg_name() {
		return org_name;
	}

	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}

	public String getOrg_add() {
		return org_add;
	}

	public void setOrg_add(String org_add) {
		this.org_add = org_add;
	}

	public String getOrg_add2() {
		return org_add2;
	}

	public void setOrg_add2(String org_add2) {
		this.org_add2 = org_add2;
	}

	public String getOrg_phone() {
		return org_phone;
	}

	public void setOrg_phone(String org_phone) {
		this.org_phone = org_phone;
	}

	public String getOrg_mailid() {
		return org_mailid;
	}

	public void setOrg_mailid(String org_mailid) {
		this.org_mailid = org_mailid;
	}

	@Override
	public String toString() {
		return "OrganizerSettings [org_id=" + org_id + ", org_name=" + org_name + ", org_add=" + org_add + ", org_add2="
				+ org_add2 + ", org_phone=" + org_phone + ", org_mailid=" + org_mailid + "]";
	}
	
		
	

}
