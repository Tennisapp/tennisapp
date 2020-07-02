<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>TennAPP</title>
  <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="resources/player-home/img/favicon.png" rel="icon">
  <link href="resources/player-home/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
   <spring:url value="resources/player-home/lib/bootstrap/css/bootstrap.min.css" var="bootstrapmincss"/>
  <link rel="stylesheet" href="${bootstrapmincss}"> 
 
  <!-- Libraries CSS Files -->
  <link href="resources/player-home/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/animate/animate.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
   <link href="resources/player-home/css/tab.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="resources/player-home/css/style.css" rel="stylesheet">
  <link href="resources/player-home/css/slider.css" rel="stylesheet">
   

  <style>
  html,body,main,.section-bg{
   min-height: 100vh;
  
  } 
.organiser{
  width : 100%;
  
  background-color: #fff;
  box-shadow: 5px 10px 18px #888888;
  margin-top: 50px;
  padding: 8px;
}
.categorychooser{
  box-shadow: 5px 10px 18px #888888;
  width: 100%;
  
  margin-top: 50px;
  background-color: #fff;
  padding: 30px;
  color: #000;
}
.playerheader{
  margin: 24px 0px;

}
th{
    border-top: 0px;
    font-size: 14px;
    color: #928c8c;

}
.playerheader img{
  float: right;
}
.playerheader select{
  width:auto;
  display: inline-block;
}
select{
  border-radius: 0px !important;
    font-size: 14px !important;
    font-weight: bold !important;
    color: #000 !important;
    width: auto;
}

label{
  font-size: 14px;
  letter-spacing: 0.5px;
}
.playercard{
  padding: 5px 0px;
    background: #fff;
    margin-top: 10px;
    box-shadow: 1px 1px 3px #888888;
    color: #000;
    font-size: 14px;
}
.tab-pane b{
  font-size: 14px;
    color: #928c8c;
}

.form-control:focus {
    color: #495057;
    background-color: #fff;
    border-color: #18d26e;
    outline: 0;
    box-shadow: 0 0 0 0.2rem rgba(24,210,110,.25);
    }
    
  
.dropdown-toggle {
	padding: 20px 20px 25px 20px;
}
.dropdown {
	position: relative;
	display: inline-block;
	color: #fff;
}
.dropdown-profile {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	font-size: 12px;
}
.dropdown-profile a {
	color: black !important;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}
.dropdown-profile a:hover {
	/* background-color: #ff3547 !important;
	color: #fff !important; */
	color: #18d26e !important;
}
.dropdown:hover .dropdown-profile {
	display: block;
}
body{
font-family: 'Montserrat', sans-serif;
}

.playerslist tr {
    display: block;
    
    
    background-color: transparentize( white, 0.15 );
    box-shadow: 0 0 1rem transparentize( black, 0.9 );
}
.playerslist td {
    display: inline-block;
    margin: 0px;
    padding: 0.5rem;
    text-align: left;
    background-color: white;
    border-top: 0px solid !important;
}
</style>
</head>

<body ng-app="myApp" ng-controller="myCtrl">
<input type="hidden" id="tournamentid" value="${sessionScope['scopedTarget.tournamentSession'].tournamentid}"/>
 <header id="header" style ="background: rgba(0, 0, 0, 0.9);">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="#intro" class="scrollto">TennAPP</a></h1>
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <!-- <li class="menu-active"><a href="playerhome">Home</a></li> -->
          
		  <c:if test="${sessionScope['scopedTarget.userSession'].loginType == 1}">
		    <li ng-click="openNav()"><a href=""><i class="ion-ios-person" style="font-size: 18px;padding: 3px;"></i>${sessionScope['scopedTarget.userSession'].name}</a></li>
		 </c:if>
        </ul>
      </nav>
      
      
      
    </div>
    
     <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" ng-click="closeNav()">&times;</a>
        <div class="icon">
          <i class="ion-ios-person" style="font-size: 21px;margin: 12px;"></i>
          <b>${sessionScope['scopedTarget.userSession'].name}</b>
          <p style="color:#b2b3b2;font-size: 12px;margin-left: 43px;">ORGANISER</p>
        </div>
        <hr>
        <a href="orgProfile">PROFILE</a>
        <a href="orgSetting">SETTINGS</a>
        <a href="changeOrgPassword">CHANGE PASSWORD</a>
        <a href="./logout">LOGOUT</a>
      </div>
      
  </header><!-- #header -->

  <%-- <header id="header">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="tournamentList" class="scrollto">TennAPP</a></h1>
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class=""><a href="tournamentList">Home</a></li>
          <li class="menu-active"><a href="tournamentList">My Tournaments</a></li>
          <c:if test="${sessionScope['scopedTarget.userSession'].loginType == 1}">
           <li class="menu-active">
          <div class="dropdown" style="font-size: 13px;font-weight: 600;">
		    <span class="white-text pb-2 pt-1 dropbtn" style="text-transform: uppercase;"><i class="fas fa-user-circle" style="font-size: 15px;padding: 3px;"></i>${sessionScope['scopedTarget.userSession'].name}</span>
			<span class="caret"></span>
			<div class="dropdown-profile">
			<a data-toggle="modal" data-target="#modelplayerProfile">PROFILE</a>
			<a data-toggle="modal" data-target="#modelChangePassword">CHANGE PASSWORD</a>
			<a href="./logout">LOGOUT</a>
		  </div>
	    </div>
	   </li>
	</c:if>
        </ul>
      </nav>
    </div>
  </header> --%>
  
<div id="wait" style="display:none;z-index: 1;position:absolute;top:50%;left:50%;padding:2px;"><img src='resources/images/preloader.gif' width="64" height="64" /><br>Please Wait..</div>
<input type="hidden" name="popupmsg" id="popupmsg" value="${message}" />

<main id="main">

    
	<!--==========================
      Portfolio Section
    ============================-->
    <section id="portfolio"  class="section-bg" >
      
      <div class="" style="padding-top: 30px;">
        <div class="row" style="background: #fff;padding-top: 50px;    padding-bottom: 40px;">
          <div class="col-lg-1"></div>
          <div class="col-lg-10">
            <div>
        <h3 class="section-title" style="color: #000;margin-bottom: 3px;display: inline;">{{tournamentCat.title}}</h3>
        <img ng-if="tournamentPublish == false" style="float: right;" src="resources/images/ic_publish.png"  id="publishimg"    title="publish tournament" ng-click="activeOrInActiveTournamentPublish(tournamentPublish)">
                    <img ng-if="tournamentPublish == true" style="float: right;" src="resources/images/ic_publishtrue.png"  id="unpublishimg"  title="unpublish tournament" ng-click="activeOrInActiveTournamentPublish(tournamentPublish)">
        <a href="editTournament"><img src="resources/images/ic_edit.png"   title="edit tournament" style="float: right;"></a>
      </div>
        <hr>
        <p style="letter-spacing: 0.5px;color: #18d26e;">{{tournamentCat.tournamentStartDate}} - {{tournamentCat.tournamentEndDate}}</p> 
         
       
       
      </div>
      <div class="col-lg-1"></div>
        </div>
      
      </div>

      <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-10">
          <div class="" style="margin-top: 20px;">
            <div class="form-group row">
              <div class="col-lg-3">
              <label for="mainCat">CATEGORY:</label>
              <select class="form-control" id="mainCat">
                <option ng-repeat="list in allCategories | unique:'mainCat'" value="{{list.mainCat}}">{{list.mainCat}}</option>
              </select>
            </div>
            <div class="col-lg-3">
              <label for="subCat">SUBCATEGORY:</label>
              <select class="form-control" id="subCat">
                <option ng-repeat="list in allSubCategories | unique:'subCat'" value="{{list.subCat}}">{{list.subCat}}</option>
              </select>
            </div>
            <div class="col-lg-3">
              <label for="genCat">GENDER</label>
              <select class="form-control" id="genCat">
                <option ng-repeat="list in allGenderList | unique:'genCat'" value="{{list.genCat}}">{{list.genCat}}</option>
              </select>
            </div>
            <div class="col-lg-3">
              <button class="btn btn-info" style="background: #18d26e;border-radius:0px;border:0px;width: 100%;margin-top: 32px;" ng-click="expandeDiv()"> SUBMIT</button>
            </div>
            <h6 style="color:red;padding: 20px;">{{CatNotExist}}</h6>
            </div>
            <div id="hideThis" style="display: none;">
            <div class="categoryTitle" style="margin-top: 50px;">
              <div>
            <h5 class="section-title" style="color: #000;display: inline;">{{singleCategory.categoryName}}</h5>
            
          </div>
          <span style="color: #a6a3a3;font-size: 13px;">ENTRY {{singleCategory.tournamentFee}}, PRIZE {{singleCategory.prizeMoney}}</span>
          </div>
            <div class="tabsView">
              <nav>
                <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">PLAYERS</a>
                    <a class="nav-item nav-link" ng-click="getDraws()" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">DRAWS</a>
                    
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                  <!-- <input type="checkbox" ng-model="playerPublish" style="position: inherit;" ng-click="activeOrInActivePlayersPublish(playerPublish)"> Publish Players
   <div style="width: 100%;display: inline-block;">
   
    <select ng-model="registeredByFilter" class="form-control" style="width: 20%;float: left;display: inline;margin-top: 10px;">
		  <option value>ALL PLAYERS</option>
		  <option ng-repeat="list in playerListForAcategory | unique:'playerRegBy'" value="{{list.playerRegBy}}">{{list.playerRegBy}}</option>
	   </select>
      <a class="btn btn-primary btn-success" style="float: left;" ng-click="deleteMultiplePlayer()">Delete</a>
   
	<a ng-if="compaireDate == false" href="" class="btn btn-primary btn-success" style="float: right;" ng-click="addExistingPlayer()">+ADD PLAYER</a>
	<a ng-if="compaireDate == false  && matchTypeReg == 1" href="" class="btn btn-primary btn-success" style="float: right;" data-toggle="modal" data-target="#bulkUploadPopupForSingle">BULK UPLOAD</a>
	<a ng-if="compaireDate == false  && matchTypeReg == 2" href="" class="btn btn-primary btn-success" style="float: right;" data-toggle="modal" data-target="#bulkUploadPopupForDouble">BULK UPLOAD</a>
	<h6 ng-if="compaireDate == true" style="color: red;text-align: right;font-size: 13px;">Tournament started, No players can be registered!</h6>
	</div> -->
	<div class="playerheader" >
                    <select ng-model="registeredByFilter" class="form-control" style="display: inline;">
		  <option value>ALL</option>
		  <option ng-repeat="list in playerListForAcategory | unique:'playerRegBy'" value="{{list.playerRegBy}}">{{list.playerRegBy}}</option>
	   </select>
                    <img ng-if="playerPublish == false" src="resources/images/ic_publish.png"  id="publishimg"    title="publish players" ng-click="activeOrInActivePlayersPublish(playerPublish)">
                    <img ng-if="playerPublish == true" src="resources/images/ic_publishtrue.png"  id="unpublishimg"  title="unpublish players" ng-click="activeOrInActivePlayersPublish(playerPublish)">
                    <img ng-if="compaireDate == false" src="resources/images/ic_import.png" style="border: 1px #fff" title="import players" data-toggle="modal" data-target="#importplayer" ng-click="addExistingPlayer();">
                    <img ng-if="compaireDate == false" src="resources/images/ic_delete.png" style="border: 1px #fff"  title="delete selected players" ng-click="deleteMultiplePlayer()">
                  </div>
	
     <table class="table glyphicon-hover playerslist" id="adjRankTab">
		<thead>
		  <tr>
		    <th style="width:5%"><input  type="checkbox" ng-model="IsAllChecked" ng-change="CheckUncheckAll()" /></th>
			<th scope="col" style="width:5%">Seeding</th>
			<th scope="col"style="width:22%">Name</th>
			<th scope="col"style="width:5%">Age</th>
			<th scope="col" style="width:20%">Mob.</th>
			<th scope="col" style="width:20%">Email</th>
			<th scope="col" style="width:10%">AITA Id</th>
			<th scope="col" style="width:10%">AITA Rank</th>
			<th scope="col"></th>
		  </tr>
		</thead>
		<tbody ui-sortable ng-model="playerListForAcategory">
		  <tr ng-repeat="players in playerListForAcategory | filter:{playerRegBy:registeredByFilter,playerRegBy:registeredByFilter||undefined}:true" class="playercard">
		    <td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:5%;">
		    <input ng-if="players.registeredBy != 0  && compaireDate == false" id="chkCustomer_{{players.playerId}}" type="checkbox" ng-model="players.selected" ng-change="CheckUncheckHeader()" /></td>
			<td style="display: none;">{{players.playerId}}</td>
			<td ng-if="playerListForAcategory.length <=8" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:5%;" ng-class="{'visibleHidden': $index > 1}">{{$index+1}}</td>
			<td ng-if="playerListForAcategory.length >8 && playerListForAcategory.length <=16" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:5%;" ng-class="{'visibleHidden': $index > 3}">{{$index+1}}</td>
			<td ng-if="playerListForAcategory.length >16 && playerListForAcategory.length <=32" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:5%;" ng-class="{'visibleHidden': $index > 7}">{{$index+1}}</td>
			<td ng-if="playerListForAcategory.length >32 && playerListForAcategory.length <=64" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:5%;" ng-class="{'visibleHidden': $index >15}">{{$index+1}}</td>
			<td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:22%;" >{{players.name}}</td>
			<td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:5%;">{{players.playerAge}}</td>
			<td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:20%;">{{players.phone}}</td>
			<td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:20%;">{{players.email}}</td>
			<td ng-if="players.points == 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:10%">-</td>
			<td ng-if="players.points != 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:10%">{{players.itaId}}</td>
			<td ng-if="players.points == 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:10%">-</td>
			<td ng-if="players.points != 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:10%">{{players.points}}</td>
			<td ng-if="players.registeredBy != 0  && compaireDate == false" style="padding: 0px;">
			<i class="fas fa-trash-alt" style="font-size: 11px;color: #fff; padding: 2px;" ng-click="deleteFromTournament(players.playerId,players.paymentId,players.name)"></i>
			</td>
			<td ng-if="players.registeredBy == 0" style="padding: 0px;"></td>
			<td style="display: none;">{{players.paymentId}}</td>
		 </tr>
	   </tbody>
	</table>
	<div ng-if="playerListForAcategory.length <= 0" style="text-align: center; width: 100%;color: #fd0707;"><h6>Players not registered yet!</h6></div>
            </div>
                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                 <%--  <div style="width: 100%;display: inline-block;">
	<i class="fas fa-download" style="font-size: 20px;color: #18d26e;float: left;cursor: pointer;" title="Download Draw" ng-click="download()"></i>&nbsp;&nbsp;&nbsp;
	<input type="checkbox" ng-model="drawPublish" style="position: inherit;" ng-click="activeOrInActiveDrawPublish(drawPublish)"> Publish Draw
	<div ng-if="compaireDate == false" style=" float: right;">
	<div ng-if="rounds.length <= 0 && playerListForAcategory.length > 0" class="text-right"> <a href="" class="btn btn-success" ng-click="adjustmentRakByOrg()">Create</a></div>
	<div ng-if="rounds.length > 0" class="text-right"><a href="" class="btn btn-success" ng-click="adjustmentRakByOrg()">Update</a></div>
   </div>
 </div> --%>
 <div class="playerheader" >
 					<button ng-if="rounds.length <= 0 && playerListForAcategory.length > 0" class="btn btn-info" style="background: #18d26e;border-radius:0px;border:0px;width: 100%;" ng-click="adjustmentRakByOrg()">CREATE DRAW</button>
                    <img ng-if="rounds.length > 0" src="resources/images/ic_update.png"   title="update draw" ng-click="adjustmentRakByOrg()">
                    <img ng-if="drawPublish == false && rounds.length > 0" src="resources/images/ic_publish.png"  id="publishimg"    title="publish draw" ng-click="activeOrInActiveDrawPublish(drawPublish)">
                    <img ng-if="drawPublish == true && rounds.length > 0" src="resources/images/ic_publishtrue.png"  id="unpublishimg"  title="unpublish draw" ng-click="activeOrInActiveDrawPublish(drawPublish)">
                    <img ng-if="rounds.length > 0" src="resources/images/ic_import.png"  title="export draws"  ng-click="download()">
                    
                  </div>
                  <div style="width: 100%;overflow: auto;">
<div ng-if="rounds.length <= 0" style="text-align: center; width: 100%;color: #fd0707;"><h6>Draw not created yet!</h6></div>
   <div ng-if="rounds.length == 3" id="downloaddraw3">
   <h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 5px;">{{mytournamentdetails.title}} ({{singleCategory.categoryName}})</h6>
		<jsp:include page="/WEB-INF/jsp/svgSingle3.jsp" />
  </div>
  <div ng-if="rounds.length == 4" id="downloaddraw4">
  <h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 5px;">{{mytournamentdetails.title}} ({{singleCategory.categoryName}})</h6>
		<jsp:include page="/WEB-INF/jsp/svgSingle4.jsp" /> 
  </div>
  <div ng-if="rounds.length == 5" id="downloaddraw5">
  <h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 5px;">{{mytournamentdetails.title}} ({{singleCategory.categoryName}})</h6>
		<jsp:include page="/WEB-INF/jsp/svgSingle5.jsp" /> 
  </div>
  <div ng-if="rounds.length == 6" id="downloaddraw6">
  <h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 5px;">{{mytournamentdetails.title}} ({{singleCategory.categoryName}})</h6>
		<jsp:include page="/WEB-INF/jsp/svgSingle6.jsp" /> 
  </div>
  </div>
                </div>
                
            
  
            </div>
          </div>
          </div>


          
        </div>
        <div class="col-lg-1"></div>


      </div>
      
    </section><!-- #portfolio -->

    
	 
    

  </main>
  
  <!-- Delete player confirm modal -->
<div class="modal fade" id="confirmationMultiPlayerpopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirm</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body confirmMultiPlayermsg">
      </div>
      <div class="modal-footer" style="padding: 5px;">
        <button type="button" class="btn  btn-success" style="padding: 6px 12px 6px 12px;" ng-click="deleteMultiPlayer()">Yes</button>
        <button type="button" class="btn  btn-success" style="padding: 6px 12px 6px 12px;" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>

 <!-- Import players modal -->
   <div class="modal fade" id="importplayer" >
    <div class="modal-dialog modal-dialog-centered" style="max-width: 1100px;">
      <div class="modal-content" style="background: #f7f7f7; border-radius: 0px;" >
      
        <!-- Modal Header -->
        <div class="modal-header" style="border-bottom: 0px">
          <!-- <h5 class="modal-title">Kids Tennis Camp</h5> -->
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" style ="padding: 0px;">
          
           
          <div class="tabsView">
            <nav>
              <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                  <a class="nav-item nav-link active" id="nav-single-tab" data-toggle="tab" href="#nav-single" role="tab" aria-controls="nav-single" aria-selected="true">SINGLE</a>
                  <a class="nav-item nav-link" id="nav-bulk-tab" data-toggle="tab" href="#nav-bulk" role="tab" aria-controls="nav-bulk" aria-selected="false">BULK</a>
                  <a class="nav-item nav-link" id="nav-inventory-tab" data-toggle="tab" href="#nav-inventory" role="tab" aria-controls="nav-inventory" aria-selected="false" ng-click="addExistingPlayer()">INVENTORY</a>
                  
              </div>
          </nav>
          <div class="tab-content" id="nav-tabContent" style="height: 500px;">
              <div class="tab-pane fade show active" id="nav-single" role="tabpanel" aria-labelledby="nav-single-tab">
                <h3>Coming soon....</h3>
              </div>
              <div class="tab-pane fade" id="nav-bulk" role="tabpanel" aria-labelledby="nav-bulk-tab">
              <div class="row">
              	<div class="col-lg-3"></div>
              	<div class="col-lg-6" style="margin-top: 100px;">
              		<div class="single" ng-if="matchTypeReg == 1">
				        <div class="md-form" style="text-align: right;margin: 0px;">
							<a href="downloadExcelFormat" style="color: blue;">Download format</a>
						</div>
					<form ng-submit="bulkUploadAndRegisterForSingle()">
						<div class="md-form">
							<input type="file" id="bulkUploadFileForSingle" class="form-control"	name="bulkUploadFileForSingle" accept=".xls,.xlsx,.csv" required="required" placeholder="Select File">
						</div>
						<div style="text-align: center; width: 100%;">
						<p style="margin: 0px;color: red;font-size: 14px;">{{uploadSingleMatchPlayers}}</p>
						<br>
						<br>
							<button type="submit" class="btn btn-info" style="background: #18d26e;border-radius:0px;border:0px;width: 100%;">UPLOAD</button>
						</div>
					</form>
				</div>
				<div class="double container" ng-if="matchTypeReg == 2">
				        <div class="md-form" style="text-align: right;margin: 0px;">
							 <a href="downloadExcelFormatForDoubles" style="color: blue;">Download format</a>
						</div>
					<form ng-submit="bulkUploadAndRegisterForDouble()">
						<div class="md-form">
							<input type="file" id="bulkUploadFileForDouble" class="form-control" name="bulkUploadFileForDouble" accept=".xls,.xlsx,.csv" required="required" placeholder="Select File">
						</div>
						<div style="text-align: center; width: 100%;">
						<p style="margin: 0px;color: red;font-size: 14px;">{{uploadDoubleMatchPlayers}}</p>
						<br>
						<br>
							<button type="submit" class="btn btn-info" style="background: #18d26e;border-radius:0px;border:0px;width: 100%;">UPLOAD</button>
						</div>
					</form>
				</div>
              	</div>
              	<div class="col-lg-3"></div>
              </div>
                
              </div>
              <div class="tab-pane fade" id="nav-inventory" role="tabpanel" aria-labelledby="nav-inventory-tab">
                
                <div class="container">
      <p style="margin: 0px;color: red;font-size: 14px;">{{doublePlayersValidate}}</p>
      <input type="text" class="searchInput form-control" ng-model="searchtext" placeholder="Search Player" style="margin: 2%;width: 96%;">
      <a ng-if="matchTypeReg == 2" class="btn btn-info" style="background: #18d26e;border-radius:0px;border:0px;width: 100%;color:#fff" ng-click="addToTournamentDoubles()">+ADD</a>
      <div  style="height: 44vh;overflow: auto;">
       <table class="table custom-table" id="ItemsTable">
		  <thead>
			<tr>
			  <th scope="col" style="color: #9c9c9c;">#</th>
			  <th scope="col" style="color: #9c9c9c;">Name</th>
			  <th scope="col" style="color: #9c9c9c;">Age</th>
			  <th scope="col" style="color: #9c9c9c;">Mob.</th>
			  <th scope="col" style="color: #9c9c9c;">Email</th>
			  <th scope="col" style="color: #9c9c9c;">AITA Id</th>
			  <th scope="col">AITA Rank</th>
			  <th scope="col" ng-if="matchTypeReg == 1" style="color: #9c9c9c;">ADD</th>
		   </tr>
		 </thead>
		 <tbody ng-if="matchTypeReg == 1" style="">
		     <tr ng-repeat="existplayers in existingPlayers | filter:searchtext">
			  <th scope="row" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;color: #9c9c9c;">{{$index+1}}</th>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.name}}">{{existplayers.name}}</td>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.playerAge}}">{{existplayers.playerAge}}</td>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.phone}}"><p>{{existplayers.phone}}</td>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.email}}"><p>{{existplayers.email}}</p></td>
			  <td ng-if="existplayers.itaRank == 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">-</td>
			  <td ng-if="existplayers.itaRank != 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.itaId}}">{{existplayers.itaId}}</td>
			  <td ng-if="existplayers.itaRank == 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">-</td>
			  <td ng-if="existplayers.itaRank != 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.itaRank}}">{{existplayers.itaRank}}</td>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;"><button type="button" class="btn btn-info" style="background: #18d26e;border-radius:0px;border:0px;width: 100%;" ng-click="addToTournament(existplayers,$index)">+ADD</button></td>
			 </tr>
		</tbody>
		<tbody ng-if="matchTypeReg == 2">
		     <tr ng-repeat="existplayers in existingPlayers | filter:searchtext">
		      <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;"><input type="checkbox" name="record"></td>
		      <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{existplayers.name}}</td>
		      <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{existplayers.playerAge}}</td>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{existplayers.phone}}</td>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{existplayers.email}}</td>
			  <td ng-if="existplayers.itaRank == 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">-</td>
			  <td ng-if="existplayers.itaRank != 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{existplayers.itaId}}</td>
			  <td ng-if="existplayers.itaRank == 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">-</td>
			  <td ng-if="existplayers.itaRank != 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{existplayers.itaRank}}</td>
			  <td style="display: none;">{{existplayers.itaRank}}</td>
			  <td style="display: none;">{{existplayers.playerId}}</td>
			 </tr>
		</tbody>
	 </table>
	 </div>
      </div>
              </div>
              
          </div>

          </div>
        </div>
        
       
        
      </div>
    </div>
  </div>
  
  <!--  update score modal-->
  <div class="modal fade" id="modalUpdateScoreForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h6 class="modal-title w-100 font-weight-bold">Update Score</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
      <form class="text-center" style="color: #757575;" ng-submit="updatePlayerScores()">
      <p style="margin: 0px;color: red;font-size: 14px;">{{scoreValidate}}</p>
		<label></label>
		<table style="width:100%">
			<tr>
			  <th style="padding: 5px;color: #000;">{{updateScoreData.playerName1}} : </th>
			  <td style="padding: 5px;color: #000;">Set1 <input type="number" id = "playerfirst1" name="playerfirst1" ng-model="playerfirst1" class="form-control" value="0" required="required" ng-click="scoreValidate = null"></td>
			  <td style="padding: 5px;color: #000;">Set2 <input type="number" id = "playerSecond1" name="playerSecond1" ng-model="playerSecond1" class="form-control"  value="0" required="required" ng-click="scoreValidate = null"></td>
			  <td style="padding: 5px;color: #000;">Set3 <input type="number" id = "playerThird1" name="playerThird1" ng-model="playerThird1" class="form-control" value="0" required="required" ng-click="scoreValidate = null"></td>
			</tr>
			<tr>
			  <th style="padding: 5px;color: #000;">{{updateScoreData.playerName2}} : </th>
			  <td style="padding: 5px;color: #000;"> <input type="number" id="playerfirst2" name="playerfirst2" ng-model="playerfirst2" class="form-control" value="0" required="required" ng-click="scoreValidate = null"></td>
			  <td style="padding: 5px;color: #000;"> <input type="number" id="playerSecond2" name="playerSecond2" ng-model="playerSecond2" class="form-control" value="0" required="required" ng-click="scoreValidate = null"></td>
			  <td style="padding: 5px;color: #000;"> <input type="number" id="playerThird2" name="playerThird2" ng-model="playerThird2" class="form-control" value="0" required="required" ng-click="scoreValidate = null"></td>
			</tr>
		</table>
		<label></label>
        <input type="hidden" id="team1" name="team1" value="{{updateScoreData.team1}}">
		<input type="hidden" id="team2" name="team2" value="{{updateScoreData.team2}}">
		<button type="submit" class="btn btn-success">UPDATE</button>
		 <!-- <a class="btn btn-success" data-dismiss="modal">Close</a> -->
	</form>
    </div>
    <div class="modal-footer d-flex justify-content-center">
     </div>
    </div>
  </div>
</div>

  <!--==========================
    Footer
  ============================-->
  <footer id="footer">
   

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong>TennAPP</strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!--
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=BizPage
        -->
        Powered by <a href="http://zambientsystems.com/">Zambient Info Systems</a>
      </div>
    </div>
  </footer><!-- #footer -->
  <!-- JavaScript Libraries -->
  
  <script src="resources/player-home/lib/jquery/jquery.min.js"></script>
   
  <script src="resources/player-home/lib/jquery/jquery-migrate.min.js"></script>
  <spring:url value="/resources/javascript/modules/drag-drop.js" var="dragdropjs"/>
  <script src="${dragdropjs}"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script src="resources/player-home/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/player-home/lib/easing/easing.min.js"></script>
  <script src="resources/player-home/lib/superfish/hoverIntent.js"></script>
  <script src="resources/player-home/lib/superfish/superfish.min.js"></script>
  <script src="resources/player-home/lib/wow/wow.min.js"></script>
  <script src="resources/player-home/lib/waypoints/waypoints.min.js"></script>
  <script src="resources/player-home/lib/counterup/counterup.min.js"></script>
  <script src="resources/player-home/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="resources/player-home/lib/isotope/isotope.pkgd.min.js"></script>
  <script src="resources/player-home/lib/lightbox/js/lightbox.min.js"></script>
  <script src="resources/player-home/lib/touchSwipe/jquery.touchSwipe.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="resources/player-home/contactform/contactform.js"></script>
  
  
  <!-- Template Main Javascript File -->
  <script src="resources/player-home/js/main.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
  <spring:url value="/resources/javascript/custom/common.js" var="commonjs"/>
  <script src="${commonjs}"></script>
   <spring:url value="/resources/javascript/custom/orgTournamentView.js" var="mytournamentsjs"/>
  <script src="${mytournamentsjs}"></script>
  <spring:url value="/resources/javascript/domtoimage.js" var="domtoimagejs"/>
  <script src="${domtoimagejs}"></script>
  <spring:url value="/resources/javascript/FileSaver.js" var="FileSaverjs"/>
  <script src="${FileSaverjs}"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.js" type="text/javascript" ></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
</body>
</html>