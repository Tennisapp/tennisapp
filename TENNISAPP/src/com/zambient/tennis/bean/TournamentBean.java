package com.zambient.tennis.bean;

import java.io.Serializable;
import java.util.List;

public class TournamentBean implements Serializable{
	
	private Long tournament_id;
	private String tournament_name;
	private List<CategoryBean> CategoryBean;
	private String tournament_startDate;
	public Long getTournament_id() {
		return tournament_id;
	}
	public void setTournament_id(Long tournament_id) {
		this.tournament_id = tournament_id;
	}
	public String getTournament_name() {
		return tournament_name;
	}
	public void setTournament_name(String tournament_name) {
		this.tournament_name = tournament_name;
	}
	public List<CategoryBean> getCategoryBean() {
		return CategoryBean;
	}
	public void setCategoryBean(List<CategoryBean> categoryBean) {
		CategoryBean = categoryBean;
	}
	public String getTournament_startDate() {
		return tournament_startDate;
	}
	public void setTournament_startDate(String tournament_startDate) {
		this.tournament_startDate = tournament_startDate;
	}
	
	

}
