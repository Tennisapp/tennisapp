package com.zambient.tennis.bean;

import java.io.Serializable;
import java.util.List;

public class VenueAndCourtBean implements Serializable{
	
	private int venueId;
	private String venueName;
	private String venueLocation;
	private String venueAddress2;
	private String coordinates;
	
	private int noOfCourts;
	private List<CourtBean> courts;
	private String mobile;
	private int light;
	private String email;
	public String getVenueAddress2() {
		return venueAddress2;
	}
	public void setVenueAddress2(String venueAddress2) {
		this.venueAddress2 = venueAddress2;
	}
	public String getCoordinates() {
		return coordinates;
	}
	public void setCoordinates(String coordinates) {
		this.coordinates = coordinates;
	}
	
	
	public int getVenueId() {
		return venueId;
	}
	public void setVenueId(int venueId) {
		this.venueId = venueId;
	}
	public String getVenueName() {
		return venueName;
	}
	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}
	public String getVenueLocation() {
		return venueLocation;
	}
	public void setVenueLocation(String venueLocation) {
		this.venueLocation = venueLocation;
	}
	public int getNoOfCourts() {
		return noOfCourts;
	}
	public void setNoOfCourts(int noOfCourts) {
		this.noOfCourts = noOfCourts;
	}
	public List<CourtBean> getCourts() {
		return courts;
	}
	public void setCourts(List<CourtBean> courts) {
		this.courts = courts;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getLight() {
		return light;
	}
	public void setLight(int light) {
		this.light = light;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	} 
	

}
