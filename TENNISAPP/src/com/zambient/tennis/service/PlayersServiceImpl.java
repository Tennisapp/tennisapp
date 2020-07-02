package com.zambient.tennis.service;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zambient.tennis.bean.LoginBean;
import com.zambient.tennis.bean.PlayerSettings;
import com.zambient.tennis.bean.PlayerUserBO;
import com.zambient.tennis.bean.PlayersBean;
import com.zambient.tennis.bean.RankCategoryBean;
import com.zambient.tennis.bean.TournamentBean;
import com.zambient.tennis.bean.TournamentModel;
import com.zambient.tennis.bean.players;
import com.zambient.tennis.dao.PlayersDao;
import com.zambient.tennis.entity.PlayerTournment;

@Service ("playersService")
public class PlayersServiceImpl implements PlayersService{
     
	@Autowired
	PlayersDao playersDao;

	@Override
	public String addPlayer(PlayersBean playersBean) {
		return playersDao.addPlayer(playersBean);
	}

	@Override
	public PlayerUserBO playerLogin(LoginBean loginBean) {
		// TODO Auto-generated method stub
		return playersDao.playerLogin(loginBean);
	}

	@Override
	public players getProfile(int id,int loginType) {
		// TODO Auto-generated method stub
		return playersDao.getProfile(id,loginType);
	}

	@Override
	public String changePlayerPassword(int id, String pwd) {
		// TODO Auto-generated method stub
		return playersDao.changePlayerPassword(id, pwd);
	}

	@Override
	public List<players> getPlayerList(int categoryId, int tournamentId) {
		// TODO Auto-generated method stub
		return playersDao.getPlayerList(categoryId, tournamentId);
	}

	@Override
	public String uploadBulkData(List<PlayersBean> playerList) {
		// TODO Auto-generated method stub
		return playersDao.uploadBulkData(playerList);
	}

	@Override
	public boolean isMobileExist(String mobile) {
		// TODO Auto-generated method stub
		return playersDao.isMobileExist(mobile);
	}

	@Override
	public Map<String, Object[]> downloadPlayersListWithDetails() {
		// TODO Auto-generated method stub
		return playersDao.downloadPlayersListWithDetails();
	}

	@Override
	public List<RankCategoryBean> getAllRankCategories() {
		// TODO Auto-generated method stub
		return playersDao.getAllRankCategories();
	}

	@Override
	public int addSecondPlayer(PlayersBean playersBean) {
		// TODO Auto-generated method stub
		return playersDao.addSecondPlayer(playersBean);
	}
	
	@Override
	public PlayerSettings getPlayerSettings(int playerId) {
		// TODO Auto-generated method stub
		return playersDao.getPlayerSettings(playerId);
	}

	@Override
	public String updatePlayersSettings(JSONObject payload) {
		// TODO Auto-generated method stub
		return playersDao.updatePlayersSettings(payload);
	}

	@Override
	public List<PlayerTournment> getRegisteredEventsByPlayerId(long id) {
		// TODO Auto-generated method stub
		return playersDao.getRegisteredEventsByPlayerId(id);
	}

	@Override
	public List<PlayerTournment> getPlayerResult(long id) {
		// TODO Auto-generated method stub
		return playersDao.getPlayerResult(id);
	}

	@Override
	public List<TournamentBean> getTournamentListForAPlayer(int playerid) {
		// TODO Auto-generated method stub
		return playersDao.getTournamentListForAPlayer(playerid);
	}
	
	@Override
	public List<TournamentModel> getRegisteredTournsForAPlayer(int playerid) {
		// TODO Auto-generated method stub
		return playersDao.getRegisteredTournsForAPlayer(playerid);
	}
}
