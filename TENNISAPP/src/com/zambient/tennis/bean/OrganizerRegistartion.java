package com.zambient.tennis.bean;

import java.io.Serializable;

public class OrganizerRegistartion implements Serializable{
	
	private String name;
	private String address;
	private String address2;
	private String phone;
	private String mailId;
	private String password;
	private String repassword;
	private int orgId;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMailId() {
		return mailId;
	}
	public void setMailId(String mailId) {
		this.mailId = mailId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRepassword() {
		return repassword;
	}
	@Override
	public String toString() {
		return "OrganizerRegistartion [name=" + name + ", address=" + address + ", address2=" + address2 + ", phone="
				+ phone + ", mailId=" + mailId + ", password=" + password + ", repassword=" + repassword + ", orgId="
				+ orgId + "]";
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	public int getOrgId() {
		return orgId;
	}
	public void setOrgId(int orgId) {
		this.orgId = orgId;
	}
	
	
}
