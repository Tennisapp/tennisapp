package com.zambient.tennis.bean;

import java.io.Serializable;

public class PlayerSettings implements	Serializable{
	
	private int player_id;
	
	private String player_name;
	
	private String player_add;
	private String player_add2;
	
	public String getPlayer_add2() {
		return player_add2;
	}

	public void setPlayer_add2(String player_add2) {
		this.player_add2 = player_add2;
	}

	private int rank;
	
	private int player_age;
	
	private String player_lavel;
	
	private String player_phone;
	
	private String player_email;
	
	private int player_itaid;
	
	private int player_itarank;
	
	private String player_pwd;
	
	private String player_repwd;
	
	private String gender;
	
	private String player_dob;

	public int getPlayer_id() {
		return player_id;
	}

	public void setPlayer_id(int player_id) {
		this.player_id = player_id;
	}

	public String getPlayer_name() {
		return player_name;
	}

	public void setPlayer_name(String player_name) {
		this.player_name = player_name;
	}

	

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getPlayer_age() {
		return player_age;
	}

	public void setPlayer_age(int player_age) {
		this.player_age = player_age;
	}

	public String getPlayer_lavel() {
		return player_lavel;
	}

	public void setPlayer_lavel(String player_lavel) {
		this.player_lavel = player_lavel;
	}

	public String getPlayer_phone() {
		return player_phone;
	}

	public void setPlayer_phone(String player_phone) {
		this.player_phone = player_phone;
	}

	public String getPlayer_email() {
		return player_email;
	}

	public void setPlayer_email(String player_email) {
		this.player_email = player_email;
	}

	public int getPlayer_itaid() {
		return player_itaid;
	}

	public void setPlayer_itaid(int player_itaid) {
		this.player_itaid = player_itaid;
	}

	public int getPlayer_itarank() {
		return player_itarank;
	}

	public void setPlayer_itarank(int player_itarank) {
		this.player_itarank = player_itarank;
	}

	public String getPlayer_pwd() {
		return player_pwd;
	}

	public void setPlayer_pwd(String player_pwd) {
		this.player_pwd = player_pwd;
	}

	public String getPlayer_repwd() {
		return player_repwd;
	}

	public void setPlayer_repwd(String player_repwd) {
		this.player_repwd = player_repwd;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPlayer_dob() {
		return player_dob;
	}

	public void setPlayer_dob(String player_dob) {
		this.player_dob = player_dob;
	}

	public String getPlayer_add() {
		return player_add;
	}

	public void setPlayer_add(String player_add) {
		this.player_add = player_add;
	}

	@Override
	public String toString() {
		return "PlayerSettings [player_id=" + player_id + ", player_name=" + player_name + ", player_add=" + player_add
				+ ", rank=" + rank + ", player_age=" + player_age + ", player_lavel=" + player_lavel + ", player_phone="
				+ player_phone + ", player_email=" + player_email + ", player_itaid=" + player_itaid
				+ ", player_itarank=" + player_itarank + ", player_pwd=" + player_pwd + ", player_repwd=" + player_repwd
				+ ", gender=" + gender + ", player_dob=" + player_dob + "]";
	}

	
	
	
	
	
	

}
