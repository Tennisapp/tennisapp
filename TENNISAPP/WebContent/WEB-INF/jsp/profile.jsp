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
  
  <link href="https://fonts.googleapis.com/css2?family=Teko:wght@600&display=swap" rel="stylesheet">
  <link href="resources/player-home/css/slider.css" rel="stylesheet">
  <link href="resources/player-home/css/tab.css" rel="stylesheet">
<style>
body{
font-family: "Montserrat", sans-serif;
}
html,body,main,.section-bg{
   min-height: 100vh;
  
  } 

.categorychooser{
  
  width: 100%;
  
 
  background-color: #fff;
 
  color: #000;
}
.categorychooser select{
   border-radius: 0px;
   font-size: 14px;
   font-weight: bold !important;
  
   color: #000;
}


.tournamentcard{
  padding: 20px;
    
    box-shadow: 2px 2px 3px #888888;
    margin-top: 11px;
    background: #fff;
}

</style>


</head>

<body ng-app="myApp" ng-controller="myCtrl" ng-init="init()">

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

  
 <main id="main" style="background: #f7f7f7">

    
	<!--==========================
      Portfolio Section
    ============================-->
    <section id="portfolio"  class="" >
      
      <div class="" style="padding-top: 55px;background: #fff;">
        <div class="row">
          <div class="col-lg-1"></div>
          <div class="col-lg-10">
            <div style="padding: 10px;">
              <!-- <i class="ion-ios-person" style="font-size: 30px;margin: 12px;"></i> -->
        <h3 class="section-title" style="color: #000;display: inline;font-family: 'Teko', sans-serif;font-size: 45px;">{{playerName}}</h3>
        <span style="letter-spacing: 0.5px;color: #18d26e;float: right;font-size: 15px;">{{rankName}} - {{rank}}</span> <br>
        <span style="letter-spacing: 0.3px;color: #babdbb; font-size: 14px;">{{dob}}</span>
      </div>
       
         
       
        
      </div>
      
      
      <div class="col-lg-1"></div>
      </div>
      
      <div class="row">
        
        <div class="col-lg-12">
          <div class="categorychooser">
            
            <div >
           
            <div class="tabsView"     style="background: #fff;">
              <div class="row">
              <div class="col-lg-1"></div>
              <nav  class="col-lg-5"style="background: #fff;margin-top :40px;" >
                <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist" >
                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true" style="text-align: left;">REGISTERED</a>
                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false"  style="text-align: left;">RESULTS</a>
                    
                </div>
            </nav>
            <div class="col-lg-6"></div>
          </div>
            <div class="tab-content" id="nav-tabContent" style="background: #f7f7f7" >
              
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" >
                  <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10" >
                      <div style="padding-top: 30px;padding-bottom: 30px;">
                     
                        <select class="form-control" style="display: inline-block;width: auto;" ng-model="shiva" ng-options="list.category for list in myRegList | unique:'category'">
                        </select>
                        <select class="form-control"  style="display: inline-block;width: auto;" ng-model="selectedsubcat" ng-options="list.subcategory for list in myRegList | unique:'subcategory'">
                        </select>
                      </div>
                        <div class="tournamentcard col-lg-7" ng-repeat="list in myRegList | filter : filterCate">
                          <div>
                            <b>{{list.tournament_name}}</b>
                            <span style="float: right;font-size: 15px;color: #18d26e;">{{list.tournament_startDate}}</span>
                          </div>
                           <span style="font-size: 13px;color: #9c9b9b;">{{list.category}} {{list.gender}} {{list.subcategory}} </span>
                        </div>
                        
                    </div>
                    <div class="col-lg-7" ng-if="myRegList.length <=0" style="padding: 100px;"><h6>No Tournaments Registered yet!!!</h6></div>
                    <div class="col-lg-1"></div>
                  </div>
                  

                </div>
                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                   <div class="row">
                     <div class="col-lg-1"></div>
                     <div class="col-lg-10">
                      <div style="padding-top: 30px;padding-bottom: 30px;">
                      
                        <select class="form-control" style="display: inline-block;width: auto;" ng-model="selectedRescat" ng-options="list.category for list in myResList | unique:'category'">
                        </select>
                        <select class="form-control"  style="display: inline-block;width: auto;" ng-model="selectedRessubcat" ng-options="list.subcategory for list in myResList | unique:'subcategory'">
                        </select>
                      </div>
    
                      <!--Tournament 1-->
                      
                      <div ng-repeat="list in myResList | filter : filterResCate">
                      <hr>
                        <div style="margin-top: 15px;"  class="col-lg-7">
                          <b>{{list.tournament_name}}</b><b style="color: #9c9b9b;margin-left: 5px;">{{list.category}} {{list.gender}} {{list.subcategory}}</b>
                          <span style="float: right;font-size: 15px;color: #18d26e;">{{list.tournament_startDate}}</span>
                        </div>
                        <div class="row col-lg-7" style="color: #9c9b9b;font-size: 14px;padding-left: 20px; margin-top: 15px;">
                          <div class="col-lg-3">PLAYERS</div>
                          <div class="col-lg-1"></div>
                          <div class="col-lg-2">ROUND</div>
                          <div class="col-lg-1"></div>
                          <div class="col-lg-4" style="text-align: center;padding:  0px 15px;">SCORE</div>
                          <div class="col-lg-1"></div>
                        </div>
                        <div class="tournamentcard col-lg-7" ng-repeat="sublist in list.matchModel">
                          <div class="row" style="font-size: 14px;padding: 5px 0px;">
                            <div class="col-lg-3" ng-if="sublist.first_player.length<=0 && sublist.winner.length<=0">{{sublist.first_player}}</div>
                            <div class="col-lg-3" ng-if="sublist.first_player.length>0">{{sublist.first_player}}</div>
                            <div class="col-lg-3" ng-if="sublist.second_player == sublist.winner && sublist.first_player.length<=0" style="color: #18d26e;">BYE</div>
                            <div class="col-lg-1"></div>
                            <div class="col-lg-2">{{sublist.round}}</div>
                            <div class="col-lg-1"></div>
                            <div class="col-lg-4" style="text-align: center;">
                              <span style="padding:  0px 15px;" ng-if="sublist.score.length>0">{{sublist.score | myfilter : 'a'}}</span>
                              <span style="padding:  0px 15px;" ng-if="sublist.score.length>0">{{sublist.score | myfilter : 'b'}}</span>
                              <span style="padding:  0px 15px;" ng-if="sublist.score.length>0">{{sublist.score | myfilter : 'c'}}</span>
                              
                              <span style="padding:  0px 15px;" ng-if="sublist.score.length<=0">-</span>
                              <span style="padding:  0px 15px;" ng-if="sublist.score.length<=0">-</span>
                              <span style="padding:  0px 15px;" ng-if="sublist.score.length<=0">-</span>
                            </div>
                            
                            <div class="col-lg-1"><img ng-if="sublist.first_player == sublist.winner && sublist.winner.length>0 && sublist.first_player !== ' & '" src="resources/images/checkmark.png" style="width: 25px;height: 25px;"></div>
                            
                          </div>
                          <div class="row" style="font-size: 14px;padding: 5px 0px;">
                          <div class="col-lg-3" ng-if="sublist.second_player.length<=0 && sublist.winner.length<=0 ">{{sublist.second_player}}</div>
                            <div class="col-lg-3" ng-if="sublist.second_player.length>0 ">{{sublist.second_player}}</div>
                            <div class="col-lg-3" ng-if="sublist.first_player == sublist.winner && sublist.second_player.length<=0 " style="color: #18d26e;">BYE</div>
                            <div class="col-lg-1"></div>
                            <div class="col-lg-2">{{sublist.round}}</div>
                            <div class="col-lg-1"></div>
                            <div class="col-lg-4" style="text-align: center;">
                              <span style="padding:  0px 15px;" ng-if="sublist.score.length>0">{{sublist.score | myfilter : 'd'}}</span>
                              <span style="padding:  0px 15px;" ng-if="sublist.score.length>0">{{sublist.score | myfilter : 'e'}}</span>
                              <span style="padding:  0px 15px;" ng-if="sublist.score.length>0">{{sublist.score | myfilter : 'f'}}</span>
                              
                              <span style="padding:  0px 15px;" ng-if="sublist.score.length<=0">-</span>
                              <span style="padding:  0px 15px;" ng-if="sublist.score.length<=0">-</span>
                              <span style="padding:  0px 15px;" ng-if="sublist.score.length<=0">-</span>
                            </div>
                            
                            <div class="col-lg-1"><img ng-if="sublist.second_player == sublist.winner && sublist.winner.length>0 && sublist.second_player !== ' & '" src="resources/images/checkmark.png" style="width: 25px;height: 25px;"></div>
                            
                          </div>
                      </div>
                      
                      
                    </div>
    
    				<div class="col-lg-7"  ng-if="myResList.length <=0" style="padding: 100px;"><h6>No Tournaments Started yet!!!</h6></div>
                    
                    
                </div>
                     </div> 
                     <div class="col-lg-1"></div>
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui/0.4.0/angular-ui.min.js"></script>
  
  <script  src="resources/javascript/custom/profile.js" ></script>
  

</body>
</html>
