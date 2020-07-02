package com.zambient.tennis.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="courts")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 
public class Courts implements Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="court_id")
	private long courtId;
	

	@ManyToOne(fetch = FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinColumn(name="venue_id")
	private VenuesEntity venue;
	
	@Column(name="court_name")
	private String courtName;

	public long getCourtId() {
		return courtId;
	}

	public void setCourtId(long courtId) {
		this.courtId = courtId;
	}

	public VenuesEntity getVenue() {
		return venue;
	}

	public void setVenue(VenuesEntity venue) {
		this.venue = venue;
	}

	public String getCourtName() {
		return courtName;
	}

	public void setCourtName(String courtName) {
		this.courtName = courtName;
	}

}
