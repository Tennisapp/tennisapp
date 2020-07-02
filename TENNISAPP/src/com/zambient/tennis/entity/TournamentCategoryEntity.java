package com.zambient.tennis.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Table(name="tournament_category")
@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 

public class TournamentCategoryEntity  implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="tournament_id")
	private TournamentEntity tournamentIdEntity;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="category_id")
	private CategoryMasterEntity categoryIdEntity;
	
	@Column(name="prize_money")
	private int prizeMoney;
	
	@Column(name="tournament_fee")
	private int tournamentFee;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="start_date")
	private Date startDate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="end_date")
	private Date endDate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="reg_start_date")
	private Date regStartDate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="reg_end_date")
	private Date regEndDate;
	
	@Column(name="isDrawsActive")
	private int drawActive;
	
	@Column(name="isPlayerListActive")
	private long playerListActive;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public TournamentEntity getTournamentIdEntity() {
		return tournamentIdEntity;
	}

	public void setTournamentIdEntity(TournamentEntity tournamentIdEntity) {
		this.tournamentIdEntity = tournamentIdEntity;
	}

	public CategoryMasterEntity getCategoryIdEntity() {
		return categoryIdEntity;
	}

	public void setCategoryIdEntity(CategoryMasterEntity categoryIdEntity) {
		this.categoryIdEntity = categoryIdEntity;
	}

	public int getPrizeMoney() {
		return prizeMoney;
	}

	public void setPrizeMoney(int prizeMoney) {
		this.prizeMoney = prizeMoney;
	}

	public int getTournamentFee() {
		return tournamentFee;
	}

	public void setTournamentFee(int tournamentFee) {
		this.tournamentFee = tournamentFee;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
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

	public int getDrawActive() {
		return drawActive;
	}

	public void setDrawActive(int drawActive) {
		this.drawActive = drawActive;
	}

	public long getPlayerListActive() {
		return playerListActive;
	}

	public void setPlayerListActive(long playerListActive) {
		this.playerListActive = playerListActive;
	}
}
