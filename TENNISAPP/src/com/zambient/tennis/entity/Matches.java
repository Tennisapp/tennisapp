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
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@NamedQuery(  name = "findMatchesFromPlayerId", query = "FROM Matches matches WHERE matches.matchStatus=:matchStatus AND matches.matchPlayer1 = :player1 OR matches.matchPlayer2=:player2 OR matches.matchPlayer3 =:player3 OR matches.matchPlayer4=:player4")  

@Entity
@Table(name="matchs")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 
public class Matches implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="match_id")
	private int matchId;
	
	@ManyToOne(fetch = FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinColumn(name="tournament_id")
	private TournamentEntity tournment;
	
	@ManyToOne(fetch = FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinColumn(name="category_id")
	private CategoryMasterEntity categoryMaster;
	
	@Column(name="match_type")
	private String matchType;
	
	@Column(name="match_round")
	private int matchRound;
	
	@Column(name="match_status")
	private String matchStatus;
	
	@Column(name="match_player1")
	private int matchPlayer1;
	
	@Column(name="match_player2")
	private int matchPlayer2;
	
	@Column(name="match_player3")
	private int matchPlayer3;
	
	@Column(name="match_player4")
	private int matchPlayer4;
	
	@Column(name="match_winner1")
	private String matchWinner1;
	
	@Column(name="match_winner2")
	private int matchWinner2;
	
	@Column(name="match_looser1",columnDefinition = "integer default 0")
	private int matchLooser1;
	
	@Column(name="match_looser2",columnDefinition = "integer default 0")
	private int matchLooser2;
	
	@Temporal(TemporalType.TIME)
	@Column(name="start_time")
	private Date startTime;
	
	@Temporal(TemporalType.TIME)
	@Column(name="end_time")
	private Date endTime;
	
	@Column(name="team1")
	private String team1;
	
	@Column(name="team2")
	private String team2;
	
	private int refereeid;
	
	private String score;
	
	@Temporal(TemporalType.DATE)
	@Column(name="match_date")
	private Date matchDate;
	
	@ManyToOne(fetch = FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinColumn(name="courtId")
	private Courts courts;

	public long getMatchId() {
		return matchId;
	}

	public void setMatchId(int matchId) {
		this.matchId = matchId;
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

	public String getMatchType() {
		return matchType;
	}

	public void setMatchType(String matchType) {
		this.matchType = matchType;
	}

	public int getMatchRound() {
		return matchRound;
	}

	public void setMatchRound(int matchRound) {
		this.matchRound = matchRound;
	}

	public String getMatchStatus() {
		return matchStatus;
	}

	public void setMatchStatus(String matchStatus) {
		this.matchStatus = matchStatus;
	}

	public int getMatchPlayer1() {
		return matchPlayer1;
	}

	public void setMatchPlayer1(int matchPlayer1) {
		this.matchPlayer1 = matchPlayer1;
	}

	public int getMatchPlayer2() {
		return matchPlayer2;
	}

	public void setMatchPlayer2(int matchPlayer2) {
		this.matchPlayer2 = matchPlayer2;
	}

	public int getMatchPlayer3() {
		return matchPlayer3;
	}

	public void setMatchPlayer3(int matchPlayer3) {
		this.matchPlayer3 = matchPlayer3;
	}

	public int getMatchPlayer4() {
		return matchPlayer4;
	}

	public void setMatchPlayer4(int matchPlayer4) {
		this.matchPlayer4 = matchPlayer4;
	}

	public String getMatchWinner1() {
		return matchWinner1;
	}

	public void setMatchWinner1(String matchWinner1) {
		this.matchWinner1 = matchWinner1;
	}

	public int getMatchWinner2() {
		return matchWinner2;
	}

	public void setMatchWinner2(int matchWinner2) {
		this.matchWinner2 = matchWinner2;
	}

	public int getMatchLooser1() {
		return matchLooser1;
	}

	public void setMatchLooser1(int matchLooser1) {
		this.matchLooser1 = matchLooser1;
	}

	public int getMatchLooser2() {
		return matchLooser2;
	}

	public void setMatchLooser2(int matchLooser2) {
		this.matchLooser2 = matchLooser2;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getTeam1() {
		return team1;
	}

	public void setTeam1(String team1) {
		this.team1 = team1;
	}

	public String getTeam2() {
		return team2;
	}

	public void setTeam2(String team2) {
		this.team2 = team2;
	}

	public int getRefereeid() {
		return refereeid;
	}

	public void setRefereeid(int refereeid) {
		this.refereeid = refereeid;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public Date getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}

	public Courts getCourts() {
		return courts;
	}

	public void setCourts(Courts courts) {
		this.courts = courts;
	}
	
}
