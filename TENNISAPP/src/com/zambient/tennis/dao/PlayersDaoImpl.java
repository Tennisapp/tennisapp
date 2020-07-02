package com.zambient.tennis.dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

import org.apache.log4j.Logger;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.zambient.tennis.bean.CategoryBean;
import com.zambient.tennis.bean.CategoryModel;
import com.zambient.tennis.bean.LoginBean;
import com.zambient.tennis.bean.MatchModel;
import com.zambient.tennis.bean.PlayerSettings;
import com.zambient.tennis.bean.PlayerUserBO;
import com.zambient.tennis.bean.PlayersBean;
import com.zambient.tennis.bean.RankCategoryBean;
import com.zambient.tennis.bean.TournamentBean;
import com.zambient.tennis.bean.TournamentModel;
import com.zambient.tennis.bean.players;
import com.zambient.tennis.entity.PlayerTournment;

@PropertySource("classpath:/com/zambient/tennis/resources/tennisapp.properties")
@Repository("playersDao")
public class PlayersDaoImpl implements PlayersDao{
	final static Logger log = Logger.getLogger(PlayersDaoImpl.class);
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	/*@Autowired
	private SessionFactory sessionFactory;*/

	/**
	 * This method is used to register player 
	 * */
	@Override
	public String addPlayer(PlayersBean playersBean) {
		log.info("PlayersDaoImpl :: addPlayer method");
		log.info("playersBean ::"+playersBean);
		String QUERY="INSERT INTO `players` (player_name,player_add,player_add2,player_lavel,"
				+ "player_phone,player_email,player_itaid,player_itarank,player_pwd,player_repwd,gender,player_dob) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		
		String QUERY2 = "INSERT INTO `playerranks` (player_id,player_points,player_ranks) VALUES(LAST_INSERT_ID(),?,?)";
		String result=null;
		try{
			int size = jdbcTemplate.queryForObject("SELECT COUNT(player_phone) FROM players WHERE `player_phone`='"+playersBean.getPhone()+"'",Integer.class);
    		if(size <= 0){
			int val = jdbcTemplate.update(QUERY, new Object[]{playersBean.getName(),playersBean.getAddress(),playersBean.getAddressLine2(),playersBean.getLavel()
    				,playersBean.getPhone(),playersBean.getEmail(),playersBean.getItaId(),playersBean.getItaRank(),playersBean.getPwd(),playersBean.getRepwd(),playersBean.getGender(),
    				playersBean.getDateOfBirth()});
			jdbcTemplate.update(QUERY2, new Object[]{playersBean.getPoints(),playersBean.getRank()});
    		if(val >0)
    			result = "Success";
    		else
    			result = "fail";
    		}else{
    			result = "Player Already Registered";
    		}
    			
    	}catch(Exception e){
    		result="All Fields Are Mandatory";
    		e.printStackTrace();
    		log.error("Exception In PlayersDaoImpl addPlayer() :: "+e);
    	}
		return result;
	}

	/**
	 * This method is used to get player list for a particular 
	 * */
	@Override
	public List<players> getPlayerList(int categoryId, int tournamentId) {
		List<players> playerList = new ArrayList<players>();
        String QUERY = "SELECT p.player_id,p.player_name,p.player_add,TIMESTAMPDIFF(YEAR,p.player_dob, NOW()) AS player_age,"
        		+ "p.player_lavel,p.player_phone,p.player_email,p.player_itarank,IF(p.gender = 1,'FEMALE','MALE') AS gender,"
        		+ "TIMESTAMPDIFF(YEAR,p.player_dob, NOW()) AS age,r.`player_points`,"
        		+ "r.`player_ranks` FROM players p INNER JOIN `playerranks` r ON p.`player_id` = r.`player_id` WHERE NOT EXISTS(SELECT 1 FROM `player_tournament` t "
        		+ "WHERE (t.player_id1 = p.`player_id` OR t.player_id2 = p.`player_id`) AND t.`tournament_id`="+tournamentId+" AND t.`category_id`="+categoryId+")"
        				+ " AND p.`gender` = (SELECT c.category_gender FROM category_master c WHERE c.category_id = "+categoryId+")";
        System.out.println(QUERY);
        try{
        	int catAge = jdbcTemplate.queryForObject("SELECT c.category_age FROM category_master c WHERE c.category_id = "+categoryId+"", Integer.class);
        	
        	List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
        	if(rows != null && rows.size()>0) {
				for (Map row : rows) {
					players bean = new players();
					if((row.get("player_age")!=null?Integer.parseInt(row.get("player_age").toString()):-1) <=  catAge){
					bean.setPlayer_id(row.get("player_id")!=null?Integer.parseInt(row.get("player_id").toString()):-1);
					bean.setPlayer_name(row.get("player_name")!=null?row.get("player_name").toString():"");
					bean.setPlayer_add(row.get("player_add")!=null?row.get("player_add").toString():"");
					bean.setPlayer_age(row.get("player_age")!=null?Integer.parseInt(row.get("player_age").toString()):-1);
					bean.setPlayer_lavel(row.get("player_lavel")!=null?row.get("player_lavel").toString():"");
					bean.setPlayer_phone(row.get("player_phone")!=null?row.get("player_phone").toString():"");
					bean.setPlayer_email(row.get("player_email")!=null?row.get("player_email").toString():"");
					bean.setPlayer_itarank(row.get("player_itarank")!=null?Integer.parseInt(row.get("player_itarank").toString()):-1);
					bean.setGender(row.get("gender")!=null?row.get("gender").toString():"");
					bean.setPlayer_points(row.get("player_points")!=null?Integer.parseInt(row.get("player_points").toString()):-1);
					bean.setPlayer_ranks(row.get("player_ranks")!=null?Integer.parseInt(row.get("player_ranks").toString()):-1);
					playerList.add(bean);
				}else if(catAge >= 17){
					bean.setPlayer_id(row.get("player_id")!=null?Integer.parseInt(row.get("player_id").toString()):-1);
					bean.setPlayer_name(row.get("player_name")!=null?row.get("player_name").toString():"");
					bean.setPlayer_add(row.get("player_add")!=null?row.get("player_add").toString():"");
					bean.setPlayer_age(row.get("player_age")!=null?Integer.parseInt(row.get("player_age").toString()):-1);
					bean.setPlayer_lavel(row.get("player_lavel")!=null?row.get("player_lavel").toString():"");
					bean.setPlayer_phone(row.get("player_phone")!=null?row.get("player_phone").toString():"");
					bean.setPlayer_email(row.get("player_email")!=null?row.get("player_email").toString():"");
					bean.setPlayer_itarank(row.get("player_itarank")!=null?Integer.parseInt(row.get("player_itarank").toString()):-1);
					bean.setGender(row.get("gender")!=null?row.get("gender").toString():"");
					bean.setPlayer_points(row.get("player_points")!=null?Integer.parseInt(row.get("player_points").toString()):-1);
					bean.setPlayer_ranks(row.get("player_ranks")!=null?Integer.parseInt(row.get("player_ranks").toString()):-1);
					playerList.add(bean);
				}else{}
					
				}
			}
        }catch(Exception e){
        	e.printStackTrace();
        	return playerList;
        }
		
		return playerList;
	}
	/**
	 * This method is used to player login
	 * */
	@Override
	public PlayerUserBO playerLogin(LoginBean loginBean) {
		PlayerUserBO player = null;
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT `player_id`,`player_name`,`player_phone`,TIMESTAMPDIFF(YEAR,player_dob, NOW()) AS player_age,`player_pwd`,gender FROM `players` WHERE player_phone=? AND player_pwd=?", new Object[]{loginBean.getUserId(),loginBean.getPassword()});
			if(rows != null && rows.size()>0) {
				for (Map row : rows) {
					player = new PlayerUserBO();
					player.setPlayerId(row.get("player_id")!=null?Integer.parseInt(row.get("player_id").toString()):-1);
					player.setName(row.get("player_name")!=null?row.get("player_name").toString():"");
					player.setPhone(row.get("player_phone")!=null?row.get("player_phone").toString():"");
					player.setAge(row.get("player_age")!=null?Integer.parseInt(row.get("player_age").toString()):-1);
					player.setPassword(row.get("player_pwd")!=null?row.get("player_pwd").toString():"");
					player.setGender(row.get("gender")!=null?Integer.parseInt(row.get("gender").toString()):-1);
					return player;
				}
			}else return null;
    	}catch(Exception e){
    		e.printStackTrace();
    		return null;
    	}finally{
    		//session.close();
    	}
		return player;
	}

	/**
	 * This method is used to get Player or Organiser profile
	 * */
	@Override
	public players getProfile(int id,int loginType) {
		players player = new players();
	String QUERY = "SELECT `player_id`,`player_name`,`player_phone`,player_email,player_add,player_add2,TIMESTAMPDIFF(YEAR,player_dob, NOW()) AS player_age,`player_pwd`,`player_itarank`,IF(gender = 1,'Female','Male') AS gender FROM `players` WHERE `player_id`="+id+"";
	try{
		if(loginType == 0){
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
		if(rows != null && rows.size()>0) {
			for (Map row : rows) {
				player.setPlayer_name(row.get("player_name")!=null?row.get("player_name").toString():"");
				player.setGender(row.get("gender")!=null?row.get("gender").toString():"");
				player.setPlayer_phone(row.get("player_phone")!=null?row.get("player_phone").toString():"");
				player.setPlayer_email(row.get("player_email")!=null?row.get("player_email").toString():"");
				player.setPlayer_add(row.get("player_add")!=null?row.get("player_add").toString():"");
				player.setPlayer_add2(row.get("player_add2")!=null?row.get("player_add2").toString():"");
				player.setPlayer_age(row.get("player_age")!=null?Integer.parseInt(row.get("player_age").toString()):0);
				player.setPlayer_itarank(row.get("player_itarank")!=null?Integer.parseInt(row.get("player_itarank").toString()):-1);
				return player;
			}
		}
		}else{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT org_name,org_phone,org_mailid,org_add,org_add2 FROM `organizer` WHERE org_id = "+id+"");
			if(rows != null && rows.size()>0) {
				for (Map row : rows) {
					player.setPlayer_name(row.get("org_name")!=null?row.get("org_name").toString():"");
					player.setPlayer_phone(row.get("org_phone")!=null?row.get("org_phone").toString():"");
					player.setPlayer_email(row.get("org_mailid")!=null?row.get("org_mailid").toString():"");
					player.setPlayer_add(row.get("org_add")!=null?row.get("org_add").toString():"");
					player.setPlayer_add2(row.get("org_add2")!=null?row.get("org_add2").toString():"");
					return player;
				}
			}
		}
	}catch(Exception e){
		e.printStackTrace();
		return player;
	}
	return player;
	}
	/**
	 * This method is used to reset player password
	 * */
	@Override
	public String changePlayerPassword(int id, String pwd) {
		String result = null;
		 try{
	    		int row = jdbcTemplate.update("UPDATE players SET player_pwd = ?,player_repwd = ? WHERE player_id = ?", new Object[]{pwd, pwd, id});
	    		if(row >0) {
	    			result = "Password updated successfully";
	    		}
	    	}catch(Exception e){
	    		result = "Something went wrong";
	    	}finally{
	    		//session.close();
	    	}
		 return result;
	}
	/**
	 * This method is used to upload (.xlsx or .csv) player list data at app level
	 * */
	@Override
	public String uploadBulkData(List<PlayersBean> playerList) {
		String result1="File uploaded successfully!";
		String result2="";
		String QUERY="INSERT INTO `players` (player_name,player_add,player_lavel,"
				+ "player_phone,player_email,player_itaid,player_itarank,player_pwd,player_repwd,gender,player_dob) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		
		String QUERY2 = "INSERT INTO `playerranks` (player_id,player_points,player_ranks) VALUES(LAST_INSERT_ID(),?,?)";
		
      for(PlayersBean playersBean: playerList){
    	  try{
  			int size = jdbcTemplate.queryForObject("SELECT COUNT(player_phone) FROM players WHERE `player_phone`='"+playersBean.getPhone()+"'",Integer.class);
      		if(size <= 0){
  			int val = jdbcTemplate.update(QUERY, new Object[]{playersBean.getName(),playersBean.getAddress(),playersBean.getLavel()
      				,playersBean.getPhone(),playersBean.getEmail(),playersBean.getItaId(),playersBean.getItaRank(),"tennis","tennis",playersBean.getGender(),playersBean.getDateOfBirth()});
  			jdbcTemplate.update(QUERY2, new Object[]{playersBean.getPoints(),playersBean.getRank()});
      		/*if(val >0)
      			result = "Player Registered Successfully";
      		else
      			result = "fail";*/
      		}else{
      			result2 += playersBean.getPhone()+", ";
      		}
      			
      	}catch(Exception e){
      		e.printStackTrace();
      		log.error("Exception In PlayersDaoImpl addPlayer() :: "+e);
      		return "Something went wrong!";
      	}
    	  
      }
      if(result2 != "")
    	  return "These mob. numbers ("+result2+") Already exist.";
      else
    	  return result1;
	}
   /**
    * This method is used to check player mobile is exist or not.
    * */
	@Override
	public boolean isMobileExist(String mobile) {
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT `player_phone` FROM `players` WHERE player_phone=?", new Object[]{mobile});
    	    if(rows !=null && rows.size()>0)
		     return true;
    	    else 
    	    	return false;
		}catch(Exception e){
    		e.printStackTrace();
    		return false;
    	}
	}

	/**
	 * This method is used to download all player list data from players db table
	 * */
	@Override
	public Map<String, Object[]> downloadPlayersListWithDetails() {
	log.info("PlayersDaoImpl :: downloadPlayersListWithDetails()");
	String QUERY = "SELECT p.`player_name`,p.`player_add`,p.`player_phone`,p.`player_email`, IF(p.`gender` = 0, 'MALE', 'FEMALE') AS gender,DATE_FORMAT(p.player_dob, '%d-%b-%Y') AS player_dob FROM players p";
	Map<String, Object[]> playerinfo = new TreeMap < String, Object[] >();
	int index = 1;
	playerinfo.put(String.valueOf(index), new Object[] {"PLAYER NAME", "PLAYER GENDER", "PLAYER DOB", "PLAYER EMAIL", "PLAYER PHONE", "PLAYER ADD"});
	try{
		List<Map<String,Object>> rows = jdbcTemplate.queryForList(QUERY);
			if (rows != null && rows.size() > 0) {
				for (Map row : rows) {
					index++;
					playerinfo.put(String.valueOf(index), new Object[] {
					row.get("player_name")!=null?row.get("player_name").toString():"",
					row.get("gender")!=null?row.get("gender").toString():"",
					row.get("player_dob")!=null?row.get("player_dob").toString():"",				
					row.get("player_email")!=null?row.get("player_email").toString():"",
					row.get("player_phone")!=null?row.get("player_phone").toString():"",		
					row.get("player_add")!=null?row.get("player_add").toString():""		
					});
				}
			}
		
	}catch(Exception e){
		log.error("PlayersDaoImpl :: downloadPlayersListWithDetails() "+e);
		return playerinfo;
	}
		return playerinfo;
	}
/**
 * This method is used to get All ranking categories
 * */
	@Override
	public List<RankCategoryBean> getAllRankCategories() {
		log.info("PlayersDaoImpl ::: getAllRankCategories()");
		String QUERY = "SELECT rank_id,rank_name FROM rank_category ORDER BY rank_id ASC";
		List<RankCategoryBean> rankList = new ArrayList<RankCategoryBean>();
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows !=null && rows.size() > 0){
				for(Map row : rows){
					RankCategoryBean bean = new RankCategoryBean();
					bean.setRankId(row.get("rank_id")!=null?Long.parseLong(row.get("rank_id").toString()):0);
					bean.setRankName(row.get("rank_name")!=null?row.get("rank_name").toString():"");
					rankList.add(bean);
				}
			}
		}catch(Exception e){
			log.error("Error in PlayersDaoImpl ::: getAllRankCategories() "+e);
			return rankList;
		}
		return rankList;
	}

@Override
public int addSecondPlayer(PlayersBean playersBean) {
	log.info("PlayersDaoImpl :: addPlayer method");
	log.info("playersBean ::"+playersBean);
	String QUERY="INSERT INTO `players` (player_name,player_add,player_lavel,"
			+ "player_phone,player_email,player_itaid,player_itarank,player_pwd,player_repwd,gender,player_dob,player_add2) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
	
	String QUERY2 = "INSERT INTO `playerranks` (player_id,player_points,player_ranks) VALUES(LAST_INSERT_ID(),?,?)";
	int result=0;
	try{
		int size = jdbcTemplate.queryForObject("SELECT COUNT(player_phone) FROM players WHERE `player_phone`='"+playersBean.getPhone()+"'",Integer.class);
		if(size <= 0){
		int val = jdbcTemplate.update(QUERY, new Object[]{playersBean.getName(),playersBean.getAddress(),playersBean.getLavel()
				,playersBean.getPhone(),playersBean.getEmail(),playersBean.getItaId(),playersBean.getItaRank(),"tennis","tennis",playersBean.getGender(),
				playersBean.getDateOfBirth(),playersBean.getAddressLine2()});
		jdbcTemplate.update(QUERY2, new Object[]{playersBean.getPoints(),playersBean.getRank()});
		if(val >0)
			result=jdbcTemplate.queryForObject("SELECT player_id FROM players WHERE player_phone ="+playersBean.getPhone(), Integer.class);
		else
			result = 0;
		}else{
			result = -1;
		}
			
	}catch(Exception e){
		result = 0;
		e.printStackTrace();
		log.error("Exception In PlayersDaoImpl addPlayer() :: "+e);
	}
	return result;
}

@Override
public PlayerSettings getPlayerSettings(int playerId) {
	String QUERY = "SELECT p.`player_id`,p.`player_name`,p.`player_add`,p.`player_add2`,p.`player_age`,p.`player_lavel`,p.`player_phone`,p.`player_email`,p.`player_itaid`,IF(p.gender = 1,'FEMALE','MALE') AS gender,p.`player_dob`,`player_itarank` FROM players p WHERE	p.`player_id`=?";
	String QUERY2 = "SELECT r.player_ranks FROM playerranks r WHERE	r.`player_id`=?";
	
	PlayerSettings playerData = new PlayerSettings();
	try{
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY, new Object[]{playerId});
		if(rows !=null && rows.size() > 0){
			for(Map row : rows){
				playerData.setPlayer_id(Integer.parseInt(row.get("player_id").toString()));
				playerData.setPlayer_name(row.get("player_name").toString());
				playerData.setPlayer_add(row.get("player_add").toString());
				playerData.setPlayer_add2(row.get("player_add2").toString());
				////playerData.setPlayer_age(row.get("player_age").toString());
				playerData.setPlayer_phone(row.get("player_phone").toString());
				playerData.setPlayer_email(row.get("player_email").toString());
				playerData.setPlayer_itaid(Integer.parseInt(row.get("player_itaid").toString()));
				playerData.setPlayer_dob(row.get("player_dob").toString());
				playerData.setPlayer_itarank(Integer.parseInt(row.get("player_itarank").toString()));
				playerData.setGender(row.get("gender").toString());
				
			}
		}
		List<Map<String, Object>> mrows = jdbcTemplate.queryForList(QUERY2, new Object[]{playerId});
		if(mrows !=null && mrows.size() > 0){
			for(Map row : mrows){
				playerData.setRank(Integer.parseInt(row.get("player_ranks").toString()));
				
				
			}
		}
	}catch(Exception e){
		log.error("Error in PlayersDaoImpl ::: getAllRankCategories() "+e);
		return playerData;
	}
	
	
	
	return playerData;
}

@Override
public String updatePlayersSettings(JSONObject payload) {
	String result = null;
	int row=0,mrow=0;
	 try{
   		 row = jdbcTemplate.update("UPDATE players SET player_name = ?,player_add = ?,player_add2 = ? ,player_email =?,player_itaid=?, player_itarank=? WHERE player_id = ? AND player_phone=? ", new Object[]{payload.get("player_name"), payload.get("player_add"),payload.get("player_add2"), payload.get("player_email"), payload.get("player_itaid"), payload.get("player_itarank"),payload.get("player_id"),payload.get("player_phone")});
   		if(row >0)
   		 mrow = jdbcTemplate.update("UPDATE playerranks SET player_points = ?,player_ranks = ? WHERE player_id = ? ", new Object[]{5, payload.get("rank"), payload.get("player_id")});
   		if(row >0 && mrow>0) {
   			result = "Player updated successfully";
   		}
   	}catch(Exception e){
   		e.printStackTrace();
   		result = "Something went wrong";
   	}
	 return result;
}

@Override
public List<PlayerTournment> getRegisteredEventsByPlayerId(long id) {

	
	/*Session session=sessionFactory.openSession(); 
	String sql = "SELECT * FROM matchs where match_status="+"'YET-TO-PLAY'"+" and match_player1="+id+" or match_player2="+id+" or match_player3="+id+" or match_player4="+id;
	SQLQuery query = session.createSQLQuery(sql);
	query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
	List results = query.list();
	session.close();
	  List result=(List<PlayerTournment>) results.stream().map(matchs->{
		 Map row = (Map)matchs;
		
		long tournamentId = ((Number) row.get("tournament_id")).longValue();
		long categoryId = ((Number) row.get("category_id")).longValue();
		
		long playerId=id;
		
		Session sessionLocal=sessionFactory.openSession(); Criteria
		  criteria=sessionLocal.createCriteria(PlayerTournment.class);
		  criteria.add(Restrictions.eq("players.playerId", playerId));
		  criteria.add(Restrictions.eq("tournment.tournmentId", tournamentId));
		  criteria.add(Restrictions.eq("categoryMaster.categoryId", categoryId));
		  
		  List<PlayerTournment> finalResult=criteria.list();
		  sessionLocal.close();
		
		return finalResult;
	}).collect(Collectors.toList());

	return result;*/
	return null;
}

@Override
public List<PlayerTournment> getPlayerResult(long id) {
	/*Session session=sessionFactory.openSession(); 
	String sql = "SELECT * FROM matchs where match_status="+"'COMPLETED'"+" and match_player1="+id+" or match_player2="+id+" or match_player3="+id+" or match_player4="+id;
	SQLQuery query = session.createSQLQuery(sql);
	query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
	List results = query.list();
	session.close();
	  List result=(List<PlayerTournment>) results.stream().map(matchs->{
		 Map row = (Map)matchs;
		
		long tournamentId = ((Number) row.get("tournament_id")).longValue();
		long categoryId = ((Number) row.get("category_id")).longValue();
		
		long playerId=id;
		
		Session sessionLocal=sessionFactory.openSession(); Criteria
		  criteria=sessionLocal.createCriteria(PlayerTournment.class);
		  criteria.add(Restrictions.eq("players.playerId", playerId));
		  criteria.add(Restrictions.eq("tournment.tournmentId", tournamentId));
		  criteria.add(Restrictions.eq("categoryMaster.categoryId", categoryId));
		  
		  List<PlayerTournment> finalResult=criteria.list();
		  sessionLocal.close();
		
		return finalResult;
	}).collect(Collectors.toList());

	return result;*/
	return null;
}
@Override
public List<TournamentBean> getTournamentListForAPlayer(int playerid) {
	log.info("TournamentController.getTournamentListForAPlayer()");
	String QUERY = "SELECT DISTINCT tournament_id, "
			+ "(SELECT tournament_title FROM `tournament` WHERE player_tournament.`tournament_id` = tournament.`tournament_id` LIMIT 1) AS tournamentname,(SELECT DATE_FORMAT(tournament_statrdate,'%d-%b-%Y') FROM `tournament` "
			+ "WHERE player_tournament.`tournament_id` = tournament.`tournament_id` LIMIT 1) AS tournament_statrdate"
			+ " FROM player_tournament WHERE (`player_id1` = "+playerid+" OR player_id2 = "+playerid+")";
	//System.out.println(QUERY);
	List<TournamentBean> beanList = new ArrayList<TournamentBean>();
	try{
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
		if(rows != null && rows.size()>0) {
			for(Map row : rows){
				List<CategoryBean> clist = getEachCategoryOfATournament(row.get("tournament_id")!=null?Integer.parseInt(row.get("tournament_id").toString()):0,playerid);
				if(clist.size() > 0){
					TournamentBean bean = new TournamentBean();
					bean.setCategoryBean(clist);
					bean.setTournament_id(row.get("tournament_id")!=null?Long.parseLong(row.get("tournament_id").toString()):0);
					bean.setTournament_name(row.get("tournamentname")!=null?row.get("tournamentname").toString():"");
					bean.setTournament_startDate(row.get("tournament_statrdate").toString());
					beanList.add(bean);
				}
			}
		}
		
	}catch(Exception e){
		e.printStackTrace();
		return beanList;
	}
	return beanList;
}
private List<CategoryBean> getEachCategoryOfATournament(int tournID,int playerid) {
String QUERY = "SELECT DISTINCT `category_id`,(SELECT category_name FROM category_master WHERE category_master.`category_id` "
		+ "= player_tournament.`category_id`) AS cname FROM player_tournament WHERE `tournament_id` = "+tournID+" "
		+ "AND (`player_id1` = "+playerid+" OR player_id2 = "+playerid+")";
//System.out.println(QUERY);
List<CategoryBean> beanList = new ArrayList<CategoryBean>();
try{
	List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
	if(rows != null && rows.size()>0) {
		for(Map row : rows){
			int catId = row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):0;
			int count = jdbcTemplate.queryForObject("SELECT COUNT(*)  FROM matchs WHERE `tournament_id` = "+tournID+" AND  category_id = "+catId+" "
					+ " AND (match_player1 = "+playerid+" OR match_player2 = "+playerid+" OR match_player3 = "+playerid+" OR match_player4 = "+playerid+") AND score IS NOT NULL", Integer.class);
			if(count <=0){
				CategoryBean bean = new CategoryBean();
				bean.setCategory_id(catId);
				bean.setCategory_name(row.get("cname")!=null?row.get("cname").toString():"");
				beanList.add(bean);
			}
		}
	}
	
}catch(Exception e){
	e.printStackTrace();
	return beanList;
}
	return beanList;
	
}



@Override
public List<TournamentModel> getRegisteredTournsForAPlayer(int playerid) {
	log.info("TournamentController.getTournamentListForAPlayer()");
	String QUERY = "SELECT DISTINCT tournament_id, "
			+ "(SELECT tournament_title FROM `tournament` WHERE player_tournament.`tournament_id` = tournament.`tournament_id` LIMIT 1) AS tournamentname,(SELECT DATE_FORMAT(tournament_statrdate,'%d-%b-%Y') FROM `tournament` "
			+ "WHERE player_tournament.`tournament_id` = tournament.`tournament_id` LIMIT 1) AS tournament_statrdate"
			+ " FROM player_tournament WHERE (`player_id1` = "+playerid+" OR player_id2 = "+playerid+")";
	List<TournamentModel> beanList = new ArrayList<TournamentModel>();
	try{
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
		if(rows != null && rows.size()>0) {
			for(Map row : rows){
				List<CategoryModel> clist = getRegisteredTournsForAPlayerEachCat(row.get("tournament_id")!=null?Integer.parseInt(row.get("tournament_id").toString()):0,playerid);
				if(clist.size() > 0){
					TournamentModel bean = new TournamentModel();
					bean.setCategoryModel(clist);
					bean.setTournament_id(row.get("tournament_id")!=null?Long.parseLong(row.get("tournament_id").toString()):0);
					bean.setTournament_name(row.get("tournamentname")!=null?row.get("tournamentname").toString():"");
					bean.setTournament_startDate(row.get("tournament_statrdate").toString());
					beanList.add(bean);
				}
			}
		}
		
	}catch(Exception e){
		e.printStackTrace();
		return beanList;
	}
	return beanList;
}
private List<CategoryModel> getRegisteredTournsForAPlayerEachCat(int tournID,int playerid) {
String QUERY = "SELECT DISTINCT `category_id`,(SELECT category_name FROM category_master WHERE category_master.`category_id` "
		+ "= player_tournament.`category_id`) AS cname FROM player_tournament WHERE `tournament_id` = "+tournID+" "
		+ "AND (`player_id1` = "+playerid+" OR player_id2 = "+playerid+")";
List<CategoryModel> beanList = new ArrayList<CategoryModel>();
try{
	List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
	if(rows != null && rows.size()>0) {
			for(Map row : rows){
				CategoryModel model = new CategoryModel();
				int catId = row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):0;
				List<MatchModel> matchModel = getMatchListForAPlayerEachCat(tournID, playerid,catId);
				if(matchModel.size() > 0){
					model.setCategory_id(catId);
					model.setCategory_name(row.get("cname")!=null?row.get("cname").toString():"");
					model.setMatchModel(matchModel);
					beanList.add(model);
				}
			}
		}
}catch(Exception e){
	e.printStackTrace();
	return beanList;
}
	return beanList;
	
}

private List<MatchModel> getMatchListForAPlayerEachCat(int tournID, int playerid, int catId) {
String QUERY = "SELECT m.`match_id`,m.`match_type`,m.`match_round`,m.`match_status`,m.`score`,m.match_winner1,m.team1,m.team2,"
		+ "m.`match_date`,TIME_FORMAT(m.start_time, '%h:%i %p') AS starttime,"
		+ "TIME_FORMAT(m.end_time, '%h:%i %p') AS endtime,"
		+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player1`) AS player1,"
		+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player2`) AS player2,"
		+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player3`) AS player3,"
		+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player4`) AS player4,"
		+ "(SELECT p.player_id FROM players p WHERE p.player_id = m.`match_player1`) AS playerId1,"
		+ "(SELECT p.player_id FROM players p WHERE p.player_id = m.`match_player2`) AS playerId2,"
		+ "(SELECT p.player_id FROM players p WHERE p.player_id = m.`match_player3`) AS playerId3,"
		+ "(SELECT p.player_id FROM players p WHERE p.player_id = m.`match_player4`) AS playerId4 "
		+ "FROM matchs m WHERE `tournament_id`="+tournID+" AND `category_id`="+catId+"";
   List<MatchModel> listData = new ArrayList<MatchModel>();
   int index=0;
   try{
	   List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
		if (rows != null && rows.size() > 0) {
			for (Map row : rows) {
				MatchModel match = new MatchModel();
				match.setMatchid(row.get("match_id")!=null?Long.parseLong(row.get("match_id").toString()):0);
				if((row.get("match_type")!=null?row.get("match_type").toString():"").equals("SINGLE")){
					match.setFirst_player(row.get("player1")!=null?row.get("player1").toString():"");
					match.setSecond_player(row.get("player3")!=null?row.get("player3").toString():"");
					if((row.get("match_winner1")!=null?row.get("match_winner1").toString():"").equals(row.get("team1")!=null?row.get("team1").toString():""))
						 match.setWinner(row.get("player1")!=null?row.get("player1").toString():"");
					else if((row.get("match_winner1")!=null?row.get("match_winner1").toString():"").equals(row.get("team2")!=null?row.get("team2").toString():""))
						match.setWinner(row.get("player3")!=null?row.get("player3").toString():"");
					else
						match.setScore("");
				}else{
					match.setFirst_player((row.get("player1")!=null?row.get("player1").toString():"")+" & "+(row.get("player2")!=null?row.get("player2").toString():""));
					match.setSecond_player((row.get("player3")!=null?row.get("player3").toString():"")+" & "+(row.get("player4")!=null?row.get("player4").toString():""));
					if((row.get("match_winner1")!=null?row.get("match_winner1").toString():"").equals(row.get("team1")!=null?row.get("team1").toString():""))
						match.setWinner((row.get("player1")!=null?row.get("player1").toString():"")+" & "+(row.get("player2")!=null?row.get("player2").toString():""));
					else if((row.get("match_winner1")!=null?row.get("match_winner1").toString():"").equals(row.get("team2")!=null?row.get("team2").toString():""))
						match.setWinner((row.get("player3")!=null?row.get("player3").toString():"")+" & "+(row.get("player4")!=null?row.get("player4").toString():""));
					else
						match.setScore("");
				}
				if(index == rows.size() - 1)
					match.setRound("Final");
				else if((index == rows.size() - 2) || (index == rows.size() - 3))
					match.setRound("Semi");
				else
					match.setRound(String.valueOf(row.get("match_round")!=null?Integer.parseInt(row.get("match_round").toString()):0));
				
				match.setScore(row.get("score")!=null?row.get("score").toString():"");
				
				if(((row.get("playerId1")!=null?Integer.parseInt(row.get("playerId1").toString()):-1) == playerid) || 
						((row.get("playerId2")!=null?Integer.parseInt(row.get("playerId2").toString()):-1) == playerid) ||
						((row.get("playerId3")!=null?Integer.parseInt(row.get("playerId3").toString()):-1) == playerid) ||
						((row.get("playerId4")!=null?Integer.parseInt(row.get("playerId4").toString()):-1) == playerid)){
					listData.add(match);
				}
			}
		}
   }catch(Exception e){
		e.printStackTrace();
		return listData;
	}
	return listData;
}

}
