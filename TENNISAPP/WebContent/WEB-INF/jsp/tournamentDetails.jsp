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
  <!--  <link href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/compiled-4.8.0.min.css?ver=4.8.0 "rel="stylesheet"> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <!-- Libraries CSS Files -->
  <link href="resources/player-home/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/animate/animate.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Main Stylesheet File -->
  <link href="resources/player-home/css/style.css" rel="stylesheet">
    <spring:url value="/resources/javascript/domtoimage.js" var="domtoimagejs"/>
  <script src="${domtoimagejs}"></script>
    <spring:url value="/resources/javascript/FileSaver.js" var="FileSaverjs"/>
  <script src="${FileSaverjs}"></script>
  
  <link href="resources/player-home/css/slider.css" rel="stylesheet">
  
  <link href="resources/player-home/css/tab.css" rel="stylesheet">
<style>
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
.playercard{
  padding: 5px 0px;
    background: #fff;
    margin-top: 10px;
    box-shadow: 1px 1px 3px #888888;
    color: #000;
    font-size: 14px;
}
.playercard th{
  display: inline-block;
  border-top: 0px solid !important;
}
.categorychooser select{
   border-radius: 0px;
   font-size: 14px;
   font-weight: 500;
   letter-spacing: 0.5px;
}

.categorychooser label{
  font-size: 15px;
  letter-spacing: 0.5px;
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
.playerslist th {
    
    border: 0px solid !important;
}

 .pac-container {
        position: absolute;
        z-index:10000 !important;
        padding-bottom: 12px;
        margin-right: 12px;
      }

</style>

</head>

<body ng-app="myApp" ng-controller="myCtrl" ng-init="init()" onload="initialize()">

  <!--==========================
    Header
  ============================-->
  <header id="header" style ="background: rgba(0, 0, 0, 0.9);">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="playerhome" class="scrollto">TennAPP</a></h1>
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a href="playerhome">Home</a></li>
          <li><a href="playerhome" ng-click="sessionstore()">Tournaments</a></li>
		  <c:if test="${sessionScope['scopedTarget.userSession'].loginType == 0}">
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
          <p style="color:#b2b3b2;font-size: 12px;margin-left: 43px;">PLAYER</p>
        </div>
        <hr>
        <a href="profile">PROFILE</a>
        <a href="settings">SETTINGS</a>
        <a href="changePassword">CHANGE PASSWORD</a>
        <a href="./playerlogout">LOGOUT</a>
      </div>
  </header><!-- #header -->

  
  <main id="main">
     <input type="hidden" id="tournamentid" value="${sessionScope['scopedTarget.tournamentSession'].tournamentid}"/>
     <input type="hidden" name="popupmsg" id="popupmsg" value="${sessionScope['scopedTarget.userSession'].playerId}" />
	<input type="hidden" name="message" id="message" value="${message}" />
    
    <section id="portfolio"  class="section-bg" >
      <div class="" style="margin-top: 60px;">
        <div class="row">
          <div class="col-lg-1"></div>
          <div class="col-lg-6">
        <h3 class="section-title" style="color: #000;margin-bottom: 3px;">{{tournamentCat.title}}</h3>
        <hr>
        <p style="letter-spacing: 0.5px;color: #18d26e;text-transform: uppercase;">{{tournamentCat.tournamentStartDate}} - {{tournamentCat.tournamentEndDate}}</p> 
        <img src="{{tournamentCat.bannerImage}}" style="width:100%; height:500px;">
      </div>
      <div class="col-lg-1"></div>
      <div class="col-lg-3"> 
          <div class="organiser">
            <div class="icon">
              <i class="ion-ios-person" style="font-size: 21px;margin: 12px;"></i>
              <b>{{tournamentCat.organizerName}}</b>
              <span>(Organizer)</span>
            </div>
            <hr>
            <div style="padding-left: 30px;font-size: 14px;">
              
              <i class="fa fa-phone" aria-hidden="true" style="margin: 0px 12px;"></i>
               <span>{{tournamentCat.phone}} </span><br>
               <i class="fa  fa-envelope" aria-hidden="true" style="margin:  12px;"></i>
               <span>{{tournamentCat.email}}</span>
            
            </div>
            <div>


            </div>

          </div>
          <div class="organiser">
            <div class="icon">
              <i class="fa fa-map-marker" style="font-size: 21px;margin: 12px;"></i>
              
              <b>LOCATION</b>
              <div style="font-size: 14px;padding-left: 42px;letter-spacing: 0.3px;">
              <span>{{tournamentCat.venueName}}</span>
            
              <p style="margin-bottom: 10px;">{{tournamentCat.location}}</p>
            </div>
            </div>
            
<!--              <img src="img/map.jpg" style="width: 100%;height: 250px;">
 -->             <div id="dvMap" style="width:100%; height: 250px">
            <div>


            </div>

          </div>
      </div>
      <div class="col-lg-1"></div>
      </div>
     </div>
      <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-10">
          <div class="categorychooser">
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
            </div>
            <span style="color: red;font-size: 13px;">{{CatNotExist}}</span>
            <div id="hideThis" style="display: none;">
            <div class="categoryTitle" style="margin-top: 50px;">
              <div>
            <h5 class="section-title" style="color: #000;display: inline;">{{singleCategory.categoryName}}</h5>
            <button ng-if="singleCategory.playerId < 0 && !singleCategory.isDrawsActive && !enableButton.matchStarted && singleCategory.catAge && singleCategory.categoryGender" class="btn btn-info" style="background: #18d26e;border-radius:0px;border:0px;float: right;" ng-click="registerPlayerForTournament(singleCategory.tournamentFee,singleCategory.matchType,singleCategory.playerId,singleCategory.categoryGender,singleCategory.catAge)"> REGISTER  </button>
            <span ng-if="singleCategory.playerId >= 0" style="color: #18d26e;border-radius: 0px;border: 0px;float: right;">Registered</span>
            <span ng-if="singleCategory.playerId < 0 && singleCategory.isDrawsActive && singleCategory.catAge && singleCategory.categoryGender" style="color: #18d26e;border-radius: 0px;border: 0px;float: right;">Draws published</span>
            <span ng-if="singleCategory.playerId < 0 && !singleCategory.isDrawsActive && enableButton.matchStarted && singleCategory.catAge && singleCategory.categoryGender" style="color: #18d26e;border-radius: 0px;border: 0px;float: right;">Registration closed</span>
            <span ng-if="singleCategory.playerId < 0 && !singleCategory.isDrawsActive && !enableButton.matchStarted && singleCategory.catAge && !singleCategory.categoryGender" style="color: #18d26e;border-radius: 0px;border: 0px;float: right;">Gender Not eligible</span>
            <span ng-if="singleCategory.playerId < 0 && !enableButton.matchStarted && !singleCategory.catAge && singleCategory.categoryGender" style="color: #18d26e;border-radius: 0px;border: 0px;float: right;">Age Not eligible</span>
          </div>
          <span style="color: #a6a3a3;font-size: 13px;">ENTRY {{singleCategory.tournamentFee}}, PRIZE {{singleCategory.prizeMoney}}</span>
          </div>
            <div class="tabsView">
              <nav>
                <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">PLAYERS</a>
                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false" ng-click="getDraws()">DRAWS</a>
                    
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                <div ng-if="!playersPublish" style="text-align: center; width: 100%;color: #fd0707;margin-top: 5px;"><h6>Players not yet published!</h6></div>
                <div ng-if="playerListForAcategory.length <= 0" style="text-align: center; width: 100%;color: #fd0707;margin-top: 5px;"><h6>Players not registered yet!</h6></div>
                 <table class="table playerslist" ng-if="playersPublish">
						  <thead>
						    <tr>
						      <th scope="col" style="font-size: 0.8rem;padding-top: 1.1rem;padding-top: 8px;padding-bottom: 8px;width:5%; display: inline-block;">#</th>
						      <th scope="col" style="font-size: 0.8rem;padding-top: 1.1rem;padding-top: 8px;padding-bottom: 8px;width:22%;display: inline-block;">Name</th>
						      <th scope="col" style="font-size: 0.8rem;padding-top: 1.1rem;padding-top: 8px;padding-bottom: 8px;width:10%;display: inline-block;">Age</th>
						      <th scope="col" style="font-size: 0.8rem;padding-top: 1.1rem;padding-top: 8px;padding-bottom: 8px;width:20%;display: inline-block;">Mob.</th>
						      <th scope="col" style="font-size: 0.8rem;padding-top: 1.1rem;padding-top: 8px;padding-bottom: 8px;width:20%;display: inline-block;">Email</th>
						      <th scope="col" style="font-size: 0.8rem;padding-top: 1.1rem;padding-top: 8px;padding-bottom: 8px;width:10%;display: inline-block;">AITA Id</th>
						      <th scope="col" style="font-size: 0.8rem;padding-top: 1.1rem;padding-top: 8px;padding-bottom: 8px;width:10%;display: inline-block;">AITA Rank</th>
						    </tr>
						  </thead>
						  <tbody>
						  <tr ng-repeat="players in playerListForAcategory" class="playercard">
						      <th ng-if="playerListForAcategory.length <=8" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:5%;" ng-class="{'visibleHidden': $index > 1}">{{$index+1}}</th>
						      <th ng-if="playerListForAcategory.length >8 && playerListForAcategory.length <=16" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:5%;" ng-class="{'visibleHidden': $index > 3}">{{$index+1}}</th>
						      <th ng-if="playerListForAcategory.length >16 && playerListForAcategory.length <=32" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:5%;" ng-class="{'visibleHidden': $index > 7}">{{$index+1}}</th>
						      <th ng-if="playerListForAcategory.length >32 && playerListForAcategory.length <=64" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:5%;" ng-class="{'visibleHidden': $index > 15}">{{$index+1}}</th>
						      <td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:22%;">{{players.name}}</td>
						      <td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:10%;">{{players.playerAge}}</td>
						      <td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:20%;">{{players.phone}}</td>
						      <td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:20%;">{{players.email}}</td>
						      <td ng-if="players.points == 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:10%;">-</td>
						      <td ng-if="players.points != 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:10%;">{{players.itaId}}</td>
						      <td ng-if="players.points == 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:10%;">-</td>
						      <td ng-if="players.points != 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;width:10%;">{{players.points}}</td>
						    </tr>
						  </tbody>
						</table>
                </div>
                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                <img ng-if="rounds.length > 0" src="resources/images/ic_import.png"  title="export draw"  ng-click="download()" style="float:right;">
                <div style="width: 100%;overflow: auto;">
                <!-- <i class="ion-ios-download" style="font-size: 25px;color: #18d26e;width: 100%;float: left;cursor: pointer;" title="Download Draw" ng-click="download()"></i> -->
                  <div ng-if="rounds.length <= 0" style="text-align: center; width: 100%;color: #fd0707;margin-top: 5px;"><h6>Draw not created yet!</h6></div>
                  <div ng-if="rounds.length > 0 && !drawPublish" style="text-align: center; width: 100%;color: #fd0707;margin-top: 5px;"><h6>Draw not yet published!</h6></div>
                  
                  <div ng-if="rounds.length == 3 && drawPublish" id="downloaddraw3">
                  <h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 5px;">{{tournamentCat.title}} ({{catTtle}})</h6>
				     <jsp:include page="/WEB-INF/jsp/svgSingle3.jsp"/>
				  </div>
				  <div ng-if="rounds.length == 4 && drawPublish" id="downloaddraw4">
				  <h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 5px;">{{tournamentCat.title}} ({{catTtle}})</h6>
				  <jsp:include page="/WEB-INF/jsp/svgSingle4.jsp" /> 
				  </div>
				  <div ng-if="rounds.length == 5 && drawPublish" id="downloaddraw5">
				  <h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 5px;">{{tournamentCat.title}} ({{catTtle}})</h6>
				  <jsp:include page="/WEB-INF/jsp/svgSingle5.jsp" /> 
				  </div>
				  <div ng-if="rounds.length == 6 && drawPublish" id="downloaddraw6">
				  <h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 5px;">{{tournamentCat.title}} ({{catTtle}})</h6>
				  <jsp:include page="/WEB-INF/jsp/svgSingle6.jsp" /> 
				  </div>
				  </div>
                </div>
            </div>
            </div>
          </div>
          </div>
        </div>
        <div class="col-lg-1"></div>
      </div>
      </div>
    </section><!-- #portfolio -->

  </main>
<!--  View Schedule Close -->	
<div class="modal fade" id="modalContactForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background: #00c851!important;color: #fff;">
        <h6 class="modal-title w-100 font-weight-bold">Payment</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body mx-3">
      <form ng-submit="registerPlayerForTournamentCategory()" method="post" name="registerPlayerTournament" ngNativeValidate>
        <div class="centredisplay">
        <label >Card Holder Name*</label>
          <input type="text" id="cardHolderName" ng-model="cardHolderName" name="cardHolderName" class="form-control validate" required="required">
       </div>
      
        <div class="centredisplay">
        <label >Card Number*</label>
          <input type="text" id="cardNumber" ng-model="cardNumber" name="cardNumber" class="form-control validate" required="required">
       </div>
      
        <div class="centredisplay">
        <label></label>
	         <select id="cardType" ng-model="cardType" name="cardType" class="form-control" required="required">
			  <option value="">Select Card Type*</option>
			  <option value="Visa">Visa</option>
			  <option value="MasterCard">MasterCard</option>
			  <option value="Contactless">Contactless</option>
			  <option value="RuPay">RuPay</option>
			  <option value="Maestro">Maestro</option>
			</select>
        </div>

        <div class="centredisplay">
        <label></label>
          <input type="number" id="amount" name="amount" ng-value="tournamentFeeForReg" class="form-control validate" readonly="readonly">
        </div>
         <input type="hidden" id="playerIdForReg" name="playerIdForReg" value="${sessionScope['scopedTarget.userSession'].playerId}"  required="required">
         
         <input type="hidden" id="tournamentIdForReg" name="tournamentIdForReg" ng-value="tournamentID" required="required">
         
         <input type="hidden" id="categoryIdForReg" name="categoryIdForReg" ng-value="categoryID" required="required">
         <input type="hidden" id="matchTypeReg" name="matchTypeReg" ng-value="matchTypeReg" required="required">
         
      <div class="modal-footer d-flex justify-content-center">
        <button type="submit" class="btn btn-unique" style="background: #00c851!important;color: #fff;">Submit</button>
      </div>
      </form>
    </div>
  </div>
</div>
</div>

<!--  View Schedule Close -->	
<div class="modal fade" id="modalDoublesRegForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background: #00c851!important;color: #fff;">
        <h6 class="modal-title w-100 font-weight-bold">Second Player</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body mx-3" style="font-size: 12px;">
      <div class="col-sm-12" style="text-align: center;margin-bottom: 20px;">
		      <div class="custom-control custom-radio custom-control-inline">
			  <input type="radio" class="custom-control-input" value="existingCourt" ng-model="place" name="place" id="defaultInline1">
			  <label class="custom-control-label" for="defaultInline1">Existing Player</label>
			 </div>
			 <div class="custom-control custom-radio custom-control-inline">
			  <input type="radio" class="custom-control-input" value="newCourt" ng-model="place" name="place" id="defaultInline2" checked>
			  <label class="custom-control-label" for="defaultInline2">New Player</label>
			</div>
	    </div>
	    <div ng-show="place === 'existingCourt'" style="text-align: center;width: 100%;">
	       <form ng-submit="selectSecondPlayer()" method="post" name="registerPlayerTournament" ngNativeValidate>
	         <div class="md-form mb-5">
		         <select id="secondPlayer" name="secondPlayer" ng-model="secondPlayer" class="form-control" required="required">
				  <option value="">Select Other Player*</option>
				  <option ng-repeat="x in otherPlayers | filter:{ player_id: '!${sessionScope['scopedTarget.userSession'].playerId}'}" value="{{x.player_id}}">{{x.player_name}}</option>
				</select>
				<span style="color:Red;font-size: .8em;" ng-show="registerPlayerTournament.secondPlayer.$error.required">Other player is required!</span>
	        </div>
	        <button type="submit" class="btn btn-unique" style="background: #00c851!important;color: #fff;">Next</button>
	        </form>
	    </div>
	     <div ng-show="place === 'newCourt'">
	     <form ng-submit="validatePlayerRegistration()" method="post" name="registerPlayerTournament" ngNativeValidate>
	       <div class="row">
	         <div class="col-sm-12"> 
	        <label for="name">Name*</label>
			<input type="text" id="name" class="form-control" ng-model="name" name="name" maxlength="20" required="required" autocomplete="off" ng-click="registerPlyrValidate = null">
	       </div>
	     </div>
	        <div class="row">
			    <div class="col-sm-6"> 
			        <label for="phone">Phone*</label>
			        <input type="text" id="phone" ng-model="phone" name="phone" class="form-control" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required" ng-click="registerPlyrValidate = null" autocomplete="off">
				    <span style="color:Red;font-size: 1em;" ng-show="registerByPlayer.phone.$error.number">Not valid number!</span>
				    <span style="color:Red;font-size: 1em;" ng-show="registerByPlayer.phone.$dirty&&registerByPlayer.phone.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
			    </div>
			    <div class="col-sm-6"> 
			    <label for="email">Email*</label>
			    <input type="email" id="email" ng-model="email" name="email" class="form-control" maxlength="45" required="required" ng-click="registerPlyrValidate = null" autocomplete="off">
	            <span style="color:Red;font-size: 1em;" ng-show="registerByPlayer.email.$dirty&&registerByPlayer.email.$error.email">Not valid email!</span>
			    </div>
			</div>
				<div class="row">
				    <div class="col-sm-6"> 
				    <label for="address">Address Line1</label>
					<textarea type="text" id="address" ng-model="address" name="address" class="md-textarea form-control" rows="1" maxlength="150" required="required" ng-click="registerPlyrValidate = null" autocomplete="off"></textarea>
					</div>
					<div class="col-sm-6"> 
				    <label for="address">Address Line2</label>
					<textarea type="text" id="autocomplete" placeholder="Enter your address" onFocus="geolocate()"  ng-model="addressLine2" name="addressLine2" class="md-textarea form-control" rows="2" ng-maxlength="210" required="required" autocomplete="off"></textarea>
					</div>
			   </div>
			   <div class="row">
			   <div class="col-sm-6"> 
					<label for="dateOfBirth">Date of Birth*</label>
					<input type="text" id="dateOfBirth" ng-model="dateOfBirth" class="form-control" required="required" ng-click="registerPlyrValidate = null" autocomplete="off">
					</div>
				    <div class="col-sm-6"> 
				    <label for="address">Select Ranking*</label>
				    <select ng-model="rankItem" ng-options="rankdata.rankName for rankdata in rankList" class="form-control" name="rankItem" id="rankid" style="border-radius: 0px;background: transparent;border: 1px solid #ccc;" autocomplete="off">
		            </select>
					</div>
			   </div>
			    <div class="" ng-if="rankItem.rankId != 1">
			      <div class="row">
					  <div class="col-sm-6"> 
					      <label for="itaId">Id</label>
					      <input type="text" id="itaId" ng-model="itaId" class="form-control" pattern="\d*" maxlength="10" autocomplete="off">
					  </div>
				      <div class="col-sm-6"> 
				          <label for="itaRank">Rank</label>
					      <input type="text" id="itaRank" ng-model="itaRank" class="form-control" pattern="\d*" maxlength="10" autocomplete="off">
					  </div>
			       </div>
			     </div><br>
					   <p style="margin: 0px;color: red;font-size: 12px;">{{registerPlyrValidate}}</p>
			         <div class="row"> 
			     </div>
			     <div class="modal-footer d-flex justify-content-center">
			        <button type="submit" class="btn btn-unique" style="background: #00c851!important;color: #fff;">Next</button>
			      </div>
			     </form>
		     <br>
	     </div>
      </form>
    </div>
  </div>
</div>
</div>

<!--  View Schedule Close -->	
<div class="modal fade" id="modalSecondPayment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background: #00c851!important;color: #fff;">
        <h6 class="modal-title w-100 font-weight-bold">Payment</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body mx-3">
      <form ng-submit="registerDoublesPlayerForTournamentCategory()" method="post" name="registerDoublesPlayerTournament" ngNativeValidate>
        <div class="centredisplay">
        <label >Card Holder Name*</label>
          <input type="text" id="cardSecondHolderName" ng-model="cardSecondHolderName" name="cardSecondHolderName" class="form-control validate" required="required">
       </div>
      
        <div class="centredisplay">
        <label >Card Number*</label>
          <input type="text" id="cardSecondNumber" ng-model="cardSecondNumber" name="cardSecondNumber" class="form-control validate" required="required">
       </div>
      
        <div class="centredisplay">
        <label></label>
	         <select id="cardSecondType" ng-model="cardSecondType" name="cardSecondType" class="form-control" required="required">
			  <option value="">Select Card Type*</option>
			  <option value="Visa">Visa</option>
			  <option value="MasterCard">MasterCard</option>
			  <option value="Contactless">Contactless</option>
			  <option value="RuPay">RuPay</option>
			  <option value="Maestro">Maestro</option>
			</select>
        </div>

        <div class="centredisplay">
        <label></label>
          <input type="number" id="Secondamount" name="Secondamount" ng-value="tournamentFeeForReg" class="form-control validate" readonly="readonly">
        </div>
         <input type="hidden" id="SecondplayerIdForReg" name="SecondplayerIdForReg" value="${sessionScope['scopedTarget.userSession'].playerId}"  required="required">
         
         <input type="hidden" id="SecondtournamentIdForReg" name="SecondtournamentIdForReg" ng-value="tournamentID" required="required">
         
         <input type="hidden" id="SecondcategoryIdForReg" name="SecondcategoryIdForReg" ng-value="categoryID" required="required">
         <input type="hidden" id="SecondmatchTypeReg" name="SecondmatchTypeReg" ng-value="matchTypeReg" required="required">
         
      <div class="modal-footer d-flex justify-content-center">
        <button type="submit" class="btn btn-unique" style="background: #00c851!important;color: #fff;">Submit</button>
      </div>
      </form>
    </div>
  </div>
</div>
</div>	

<!-- Profile  -->
<div class="modal fade" id="modelplayerProfile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background: #18d26e!important;color: #fff;">
      <h6 class="modal-title w-100 font-weight-bold">Profile</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3" style="font-family: 'Montserrat', sans-serif;font-size: 13px;">
      <p style="margin-bottom: 0.5rem;">
     <strong><b>Name : </b></strong>
     <strong>{{profileData.player_name}}</strong>
     </p>
     <p style="margin-bottom: 0.5rem;">
     <strong><b>Age  : </b></strong>
     <strong>{{profileData.player_age}}</strong>
     </p>
     <p style="margin-bottom: 0.5rem;">
     <strong><b>Gender : </b></strong>
     <strong>{{profileData.gender}}</strong>
     </p>
     <p style="margin-bottom: 0.5rem;">
     <strong><b>Phone : </b></strong>
     <strong>{{profileData.player_phone}}</strong>
     </p>
     <p style="margin-bottom: 0.5rem;">
     <strong><b>Email : </b></strong>
     <strong>{{profileData.player_email}}</strong>
     </p>
     <!-- <p style="margin-bottom: 0.5rem;">
     <strong><b>AITA : </b></strong>
     <strong>{{profileData.player_itarank}}</strong>
     </p> -->
     <p style="margin-bottom: 0.5rem;">
     <strong><b>Address : </b></strong>
     <strong>{{profileData.player_add}}</strong>
     </p> 
    </div>
  </div>
</div>
</div>
<!-- Profile -->
<!-- changePwd -->
<div class="modal fade right" id="modelChangePassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background: #18d26e!important;color: #fff;">
      <h6 class="modal-title w-100 font-weight-bold">Change Password</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body centredisplay">
     <form ng-submit="validateChangePassword();" method="post" name="changePassword" ngNativeValidate>
     <p style="margin: 0px;color: red;font-size: 14px;">{{changePwdValidate}}</p>
        <div class="">
          <label>Current Password*</label>
          <input type="text" id="oldPassword" ng-model="oldPassword" name="oldPassword" class="form-control" required="required" ng-click="changePwdValidate = null">
          <span style="color:Red;font-size: .8em;" ng-show="changePassword.oldPassword.$error.required">Old password is required!</span>
       </div>
      
        <div class="">
        <label>New Password*</label>
          <input type="password" id="newPassword" ng-model="newPassword" name="newPassword" class="form-control" required="required" ng-click="changePwdValidate = null">
          <span style="color:Red;font-size: .8em;" ng-show="changePassword.newPassword.$error.required">New password is required!</span>
       </div> 
       <div class="">
        <label>Repeat Password*</label>
          <input type="password" id="repeatPassword" ng-model="repeatPassword" name="repeatPassword" class="form-control" required="required" ng-click="changePwdValidate = null">
          <span style="color:Red;font-size: .8em;" ng-show="changePassword.repeatPassword.$error.required">Repeat password is required!</span>
       </div>  
       <input type="hidden" id="existPassword" name="existPassword" value="${sessionScope['scopedTarget.userSession'].password}" class="form-control" required="required">
       <input type="hidden" id="changedPlayerId" name="changedPlayerId" value="${sessionScope['scopedTarget.userSession'].playerId}" class="form-control" required="required">           
      <div class="modal-footer d-flex justify-content-center">
        <button type="submit" class="btn btn-success" style="color: #fff;">Submit</button>
      </div>
      </form>
    </div>
  </div>
</div>
</div>
<!-- changepwd -->
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

   <!-- The Modal -->
   <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h5 class="modal-title">Kids Tennis Camp</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" style ="padding: 0px;">
           
          <img src="img/portfolio/app1.jpg" class="img-fluid" alt="">
          
          <div class="row" style="padding: 10px;">
          <div class="col-lg-6">
            <b > 29-12-2019</b>
            <address> Gachbowli, Hyderabad</address>
          </div>
          <div class="col-lg-6"><button class="btn btn-info" style="background: #18d26e;float:right;"> Register</button></div>
        </div>
        </div>
        
       
        
      </div>
    </div>
  </div>

<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

  <!-- JavaScript Libraries -->
  
  <script src="resources/player-home/lib/jquery/jquery.min.js"></script>
   
  <script src="resources/player-home/lib/jquery/jquery-migrate.min.js"></script>
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
  
  <spring:url value="/resources/javascript/custom/tournamentDetails.js" var="tournamentDetailsjs"/>
  <script src="${tournamentDetailsjs}"></script>
  
  <!-- Google Map code -->
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.9/angular.min.js"></script>
  <!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBIUFg_ijkWXhohL0syRf71sRssLya5W6s"></script> -->
  
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBIUFg_ijkWXhohL0syRf71sRssLya5W6s&libraries=places&callback=initMap" async defer></script>
        <script>
            var autocomplete;
            function initialize() {
            	
              autocomplete = new google.maps.places.Autocomplete(
                  /** @type {HTMLInputElement} */
                  (document.getElementById('autocomplete')),
                  { types: ['geocode'] });
              google.maps.event.addListener(autocomplete, 'place_changed', function() {
            	  var place = autocomplete.getPlace();
            	  var coordinate=place.geometry.location.lat()+","+place.geometry.location.lng();
            	  $("#coordinate").val(coordinate);
            	  console.log("textarea.id"+ $("#autocomplete").val());
            	  //setvalues();
            	  console.log("****************lati :"+place.geometry.location.lat() +"  logi : "+place.geometry.location.lng());
                
              });
			  
            }
        </script>
 

</body>
</html>
