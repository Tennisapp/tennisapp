package com.zambient.tennis.dao;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import com.zambient.tennis.bean.LoginBean;
import com.zambient.tennis.bean.PlayerSettings;
import com.zambient.tennis.bean.PlayerUserBO;
import com.zambient.tennis.bean.PlayersBean;
import com.zambient.tennis.bean.RankCategoryBean;
import com.zambient.tennis.bean.TournamentBean;
import com.zambient.tennis.bean.TournamentModel;
import com.zambient.tennis.bean.players;
import com.zambient.tennis.entity.PlayerTournment;

public interface PlayersDao {
	
	public String addPlayer(PlayersBean playersBean);
	public List<players> getPlayerList(int categoryId,int tournamentId);
    public PlayerUserBO playerLogin(LoginBean loginBean);
    public players getProfile(int id,int loginType);
    public String changePlayerPassword(int id, String pwd);
    public String uploadBulkData(List<PlayersBean> playerList);
    public boolean isMobileExist(String mobile);
    public Map<String, Object[]> downloadPlayersListWithDetails();
    public List<RankCategoryBean> getAllRankCategories();
    public int addSecondPlayer(PlayersBean playersBean);
    public PlayerSettings getPlayerSettings(int playerId);
    public String updatePlayersSettings(JSONObject payload);
    
    public List<PlayerTournment> getRegisteredEventsByPlayerId(long id); 
    public List<PlayerTournment> getPlayerResult(long id); 
    public List<TournamentBean> getTournamentListForAPlayer(int playerid);
    public List<TournamentModel> getRegisteredTournsForAPlayer(int playerid);
}
