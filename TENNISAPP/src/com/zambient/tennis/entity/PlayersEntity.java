package com.zambient.tennis.entity;

import java.io.Serializable;
import java.util.Calendar;
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
@Table(name="players")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 

public class PlayersEntity  implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="player_id")
	private long playerId;
	
	@Column(name="player_name")
	private String playerName;
	
	@Column(name="player_add")
	private String playerAdd;
	
	@Column(name="player_add2")
	private String playerAdd2;
	
	public String getPlayerAdd2() {
		return playerAdd2;
	}

	public void setPlayerAdd2(String playerAdd2) {
		this.playerAdd2 = playerAdd2;
	}

	@Column(name="player_age")
	private int playerAge;
	
	@Column(name="player_lavel")
	private String playerLevel;
	
	@Column(name="player_phone")
	private String playerPhone;
	
	@Column(name="player_email")
	private String playerEmail;
	
	@Column(name="player_itaid")
	private int playerItaId;
	
	@Column(name="player_itarank")
	private int playerItaRank;
	
	@Column(name="player_pwd")
	private String playerPwd;
	
	@Column(name="player_repwd")
	private String playerRePwd;
	
	@Column(name="gender")
	private int gender;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="timestamp")
	private Date timestamp;
	
	@Temporal(TemporalType.DATE)
	@Column(name="player_dob")
	private Calendar playerDob;

	public long getPlayerId() {
		return playerId;
	}

	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}

	public String getPlayerName() {
		return playerName;
	}

	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}

	public String getPlayerAdd() {
		return playerAdd;
	}

	public void setPlayerAdd(String playerAdd) {
		this.playerAdd = playerAdd;
	}

	public int getPlayerAge() {
		return playerAge;
	}

	public void setPlayerAge(int playerAge) {
		this.playerAge = playerAge;
	}

	public String getPlayerLevel() {
		return playerLevel;
	}

	public void setPlayerLevel(String playerLevel) {
		this.playerLevel = playerLevel;
	}

	public String getPlayerPhone() {
		return playerPhone;
	}

	public void setPlayerPhone(String playerPhone) {
		this.playerPhone = playerPhone;
	}

	public String getPlayerEmail() {
		return playerEmail;
	}

	public void setPlayerEmail(String playerEmail) {
		this.playerEmail = playerEmail;
	}

	public int getPlayerItaId() {
		return playerItaId;
	}

	public void setPlayerItaId(int playerItaId) {
		this.playerItaId = playerItaId;
	}

	public int getPlayerItaRank() {
		return playerItaRank;
	}

	public void setPlayerItaRank(int playerItaRank) {
		this.playerItaRank = playerItaRank;
	}

	public String getPlayerPwd() {
		return playerPwd;
	}

	public void setPlayerPwd(String playerPwd) {
		this.playerPwd = playerPwd;
	}

	public String getPlayerRePwd() {
		return playerRePwd;
	}

	public void setPlayerRePwd(String playerRePwd) {
		this.playerRePwd = playerRePwd;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public Date getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}

	public Calendar getPlayerDob() {
		return playerDob;
	}

	public void setPlayerDob(Calendar playerDob) {
		this.playerDob = playerDob;
	}
	
}
