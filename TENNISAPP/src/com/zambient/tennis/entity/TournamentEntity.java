package com.zambient.tennis.entity;

import java.io.Serializable;
import java.util.Date;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="tournament")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 

public class TournamentEntity  implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="tournament_id")
	private long tournmentId;
	
	@ManyToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="orgaizer_id")
	private OrganizerEntity organizer;
	
	@Column(name="tournament_title")
	private String tournamentTitle;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tournament_date")
	private Date tournamentDate;
	
	
	@ManyToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="tournament_venue_id")
	private VenuesEntity venue;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tournament_statrdate")
	private Date tournamentStartDate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tournament_enddate")
	private Date tournamentEndDate;
	
	@Column(name="organizer_name")
	private String organizerName;
	
	@Column(name="organizer_phone")
	private String organizerPhone;
	
	@Column(name="organizer_altphone")
	private String organizerAltPhone;
	
	@Column(name="organizer_mailId")
	private String organizerMailId;
	
	@Column(name="banner_image")
	private String bannerImage;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="reg_start_date")
	private Date regStartDate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="reg_end_date")
	private Date regEndDate;
	
	@Column(name="active")
	private int active;

	public long getTournmentId() {
		return tournmentId;
	}

	public void setTournmentId(long tournmentId) {
		this.tournmentId = tournmentId;
	}

	public OrganizerEntity getOrganizerIdEntity() {
		return organizer;
	}

	public void setOrganizerIdEntity(OrganizerEntity organizerIdEntity) {
		this.organizer = organizerIdEntity;
	}

	public String getTournamentTitle() {
		return tournamentTitle;
	}

	public void setTournamentTitle(String tournamentTitle) {
		this.tournamentTitle = tournamentTitle;
	}

	public Date getTournamentDate() {
		return tournamentDate;
	}

	public void setTournamentDate(Date tournamentDate) {
		this.tournamentDate = tournamentDate;
	}

	public VenuesEntity getVenueIdEntity() {
		return venue;
	}

	public void setVenueIdEntity(VenuesEntity venueIdEntity) {
		this.venue = venueIdEntity;
	}

	public Date getTournamentStartDate() {
		return tournamentStartDate;
	}

	public void setTournamentStartDate(Date tournamentStartDate) {
		this.tournamentStartDate = tournamentStartDate;
	}

	public Date getTournamentEndDate() {
		return tournamentEndDate;
	}

	public void setTournamentEndDate(Date tournamentEndDate) {
		this.tournamentEndDate = tournamentEndDate;
	}

	public String getOrganizerName() {
		return organizerName;
	}

	public void setOrganizerName(String organizerName) {
		this.organizerName = organizerName;
	}

	public String getOrganizerPhone() {
		return organizerPhone;
	}

	public void setOrganizerPhone(String organizerPhone) {
		this.organizerPhone = organizerPhone;
	}

	public String getOrganizerAltPhone() {
		return organizerAltPhone;
	}

	public void setOrganizerAltPhone(String organizerAltPhone) {
		this.organizerAltPhone = organizerAltPhone;
	}

	public String getOrganizerMailId() {
		return organizerMailId;
	}

	public void setOrganizerMailId(String organizerMailId) {
		this.organizerMailId = organizerMailId;
	}

	public String getBannerImage() {
		return bannerImage;
	}

	public void setBannerImage(String bannerImage) {
		this.bannerImage = bannerImage;
	}

	public Date getRegStartDate() {
		return regStartDate;
	}

	public void setRegStartDate(Date regStartDate) {
		this.regStartDate = regStartDate;
	}

	public Date getRegEndDate() {
		return regEndDate;
	}

	public void setRegEndDate(Date regEndDate) {
		this.regEndDate = regEndDate;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

}
