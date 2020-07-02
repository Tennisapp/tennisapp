package com.zambient.tennis.wrapper;

import org.springframework.stereotype.Component;

@Component
public class MatchesWrapper {
	
	private int matchId;
	private int tournamentId;
	private int categoryId;
	private String matchType;
	private int matchRound;
	private String matchStatus;
	private int matchPlayer1;
	private int matchPlayer2;
	private int matchPlayer3;
	private int matchPlayer4;
	private String matchWinner1;
	private int matchWinner2;
	private int matchLooser1;
	private int matchLooser2;
	private String startTime;
	private String endTime;
	private String team1;
	private String team2;
	private int referenceId;
	private String score;
	private String matchDate;
	private int courtId;
	public int getMatchId() {
		return matchId;
	}
	public void setMatchId(int matchId) {
		this.matchId = matchId;
	}
	public int getTournamentId() {
		return tournamentId;
	}
	public void setTournamentId(int tournamentId) {
		this.tournamentId = tournamentId;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
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
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
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
	public int getReferenceId() {
		return referenceId;
	}
	public void setReferenceId(int referenceId) {
		this.referenceId = referenceId;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getMatchDate() {
		return matchDate;
	}
	public void setMatchDate(String matchDate) {
		this.matchDate = matchDate;
	}
	public int getCourtId() {
		return courtId;
	}
	public void setCourtId(int courtId) {
		this.courtId = courtId;
	}
	
}
