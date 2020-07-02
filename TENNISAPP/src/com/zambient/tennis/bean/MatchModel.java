package com.zambient.tennis.bean;

import java.io.Serializable;

public class MatchModel implements Serializable{
	
	private final static long serialVersionUID = 1L;
	
	private Long matchid;
	private String round;
	private String first_player;
	private String second_player;
	private String winner;
	private String score;
	public Long getMatchid() {
		return matchid;
	}
	public void setMatchid(Long matchid) {
		this.matchid = matchid;
	}
	public String getRound() {
		return round;
	}
	public void setRound(String round) {
		this.round = round;
	}
	public String getFirst_player() {
		return first_player;
	}
	public void setFirst_player(String first_player) {
		this.first_player = first_player;
	}
	public String getSecond_player() {
		return second_player;
	}
	public void setSecond_player(String second_player) {
		this.second_player = second_player;
	}
	public String getWinner() {
		return winner;
	}
	public void setWinner(String winner) {
		this.winner = winner;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "MatchModel [matchid=" + matchid + ", round=" + round + ", first_player=" + first_player
				+ ", second_player=" + second_player + ", winner=" + winner + ", score=" + score + "]";
	}
	
	
 
}
