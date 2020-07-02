package com.zambient.tennis.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Table(name="venues")
@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 

public class VenuesEntity  implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="venue_id")
	private long venueId;
	
	@Column(name="venue_name")
	private String venueName;
	
	@Column(name="venue_location")
	private String venueAddressLine1;
	
	@Column(name="venue_address")
	private String venueAddressLine2;
	
	@Column(name="venue_loc_coordinate")
	private String logitudeLatitude;
	
	@Column(name="no_of_courts")
	private int noOfCourts;
	
	@Column(name="contact_mob")
	private String contactMob;
	
	@Column(name="contact_email")
	private String contactEmail;
	
	@Column(name="sport_type")
	private String sportType;
	
	@Column(name="venue_light")
	private int venueLight;

	public long getVenueId() {
		return venueId;
	}

	public void setVenueId(long venueId) {
		this.venueId = venueId;
	}

	public String getVenueName() {
		return venueName;
	}

	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}

	public String getVenueAddressLine1() {
		return venueAddressLine1;
	}

	public void setVenueAddressLine1(String venueAddressLine1) {
		this.venueAddressLine1 = venueAddressLine1;
	}

	public String getVenueAddressLine2() {
		return venueAddressLine2;
	}

	public void setVenueAddressLine2(String venueAddressLine2) {
		this.venueAddressLine2 = venueAddressLine2;
	}

	public String getLogitudeLatitude() {
		return logitudeLatitude;
	}

	public void setLogitudeLatitude(String logitudeLatitude) {
		this.logitudeLatitude = logitudeLatitude;
	}

	public int getNoOfCourts() {
		return noOfCourts;
	}

	public void setNoOfCourts(int noOfCourts) {
		this.noOfCourts = noOfCourts;
	}

	public String getContactMob() {
		return contactMob;
	}

	public void setContactMob(String contactMob) {
		this.contactMob = contactMob;
	}

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public String getSportType() {
		return sportType;
	}

	public void setSportType(String sportType) {
		this.sportType = sportType;
	}

	public int getVenueLight() {
		return venueLight;
	}

	public void setVenueLight(int venueLight) {
		this.venueLight = venueLight;
	}
	
	
}
