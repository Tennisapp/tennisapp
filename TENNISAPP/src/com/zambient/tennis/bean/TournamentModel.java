package com.zambient.tennis.bean;

import java.io.Serializable;
import java.util.List;

public class TournamentModel implements Serializable{
	
	private final static long serialVersionUID = 1L;
	
	private Long tournament_id;
	private String tournament_name;
	private List<CategoryModel> categoryModel;
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
	public List<CategoryModel> getCategoryModel() {
		return categoryModel;
	}
	public void setCategoryModel(List<CategoryModel> categoryModel) {
		this.categoryModel = categoryModel;
	}
	public String getTournament_startDate() {
		return tournament_startDate;
	}
	public void setTournament_startDate(String tournament_startDate) {
		this.tournament_startDate = tournament_startDate;
	}
	@Override
	public String toString() {
		return "TournamentModel [tournament_id=" + tournament_id + ", tournament_name=" + tournament_name
				+ ", categoryModel=" + categoryModel + ", tournament_startDate=" + tournament_startDate + "]";
	}
	
	

}
