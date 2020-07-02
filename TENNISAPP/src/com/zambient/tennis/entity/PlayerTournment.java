package com.zambient.tennis.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.zambient.tennis.entity.CategoryMasterEntity;

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
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * @Author : Durga Rao Maruboina
 * @since : 07-05-2020
 * @version 1
 * 
 * */

@Entity
@Table(name="player_tournament")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 

public class PlayerTournment implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@ManyToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	 @JoinColumn(name="player_id1")
	private PlayersEntity players;
	
	@Column(name="player_id2")
	private long playerId2;
	
	@ManyToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="tournament_id")
	private TournamentEntity tournment;
	
	@OneToOne
	@JoinColumn(name="category_id")
	private CategoryMasterEntity categoryMaster;
	
	@Column(name="custom_aita")
	private long customAita;
	
	@OneToOne
	@JoinColumn(name="payment_id")
	private PaymentEntity payment;
	
	@Column(name="registered_by")
	private long registeredBy;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public PlayersEntity getPlayers() {
		return players;
	}

	public void setPlayers(PlayersEntity players) {
		this.players = players;
	}

	public long getPlayerId2() {
		return playerId2;
	}

	public void setPlayerId2(long playerId2) {
		this.playerId2 = playerId2;
	}

	public TournamentEntity getTournment() {
		return tournment;
	}

	public void setTournment(TournamentEntity tournment) {
		this.tournment = tournment;
	}

	public CategoryMasterEntity getCategoryMaster() {
		return categoryMaster;
	}

	public void setCategoryMaster(CategoryMasterEntity categoryMaster) {
		this.categoryMaster = categoryMaster;
	}

	public long getCustomAita() {
		return customAita;
	}

	public void setCustomAita(long customAita) {
		this.customAita = customAita;
	}

	public PaymentEntity getPayment() {
		return payment;
	}

	public void setPayment(PaymentEntity payment) {
		this.payment = payment;
	}

	public long getRegisteredBy() {
		return registeredBy;
	}

	public void setRegisteredBy(long registeredBy) {
		this.registeredBy = registeredBy;
	}


	

}
