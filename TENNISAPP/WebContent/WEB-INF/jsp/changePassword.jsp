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
<style>
body{
font-family: "Montserrat", sans-serif;
}


.boxdesign{
margin-top: 50px;
box-shadow: 5px 10px 18px #888888;
    background: #fff;
    padding: 60px;
    color: #000;

}
label{
margin-bottom: 0px;
    margin-top: 15px;
        font-size: 14px;
}
.form-control{
 border-radius : 0px;

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
				<%-- <div class="dropdown" style="font-size: 13px;font-weight: 600;">
				<span class="white-text pb-2 pt-1 dropbtn" style="text-transform: uppercase;" ng-click="openNav()"><i class="ion-ios-person" style="font-size: 15px;padding: 3px;"></i>${sessionScope['scopedTarget.userSession'].name}</span>
				  <!-- <span class="caret"></span>
				  <div class="dropdown-profile">
				    <a data-toggle="modal" data-target="#modelplayerProfile" style="cursor:pointer;">PROFILE</a>
				    <a data-toggle="modal" data-target="#modelChangePassword" style="cursor:pointer;">CHANGE PASSWORD</a>
				    <a href="./playerlogout">LOGOUT</a>
				  </div> -->
				</div> --%>
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
       <div class="boxdesign container">
           <h3>CHANGE PASSWORD</h3>
           <hr>
          <form ng-submit="validateChangePassword();" method="post" name="changePassword" ngNativeValidate>
     <p style="margin: 0px;color: red;font-size: 14px;">{{changePwdValidate}}</p>
        <div class="">
          <label>CURRENT PASSWORD</label>
          <input type="text" id="oldPassword" ng-model="oldPassword" name="oldPassword" class="form-control" required="required" ng-click="changePwdValidate = null">
          <span style="color:Red;font-size: .8em;" ng-show="changePassword.oldPassword.$error.required">Current password is required!</span>
       </div>
      
        <div class="">
        <label>NEW PASSWORD</label>
          <input type="password" id="newPassword" ng-model="newPassword" name="newPassword" class="form-control" required="required" ng-click="changePwdValidate = null">
          <span style="color:Red;font-size: .8em;" ng-show="changePassword.newPassword.$error.required">New password is required!</span>
       </div> 
       <div class="">
        <label>REPEAT PASSWORD</label>
          <input type="password" id="repeatPassword" ng-model="repeatPassword" name="repeatPassword" class="form-control" required="required" ng-click="changePwdValidate = null">
          <span style="color:Red;font-size: .8em;" ng-show="changePassword.repeatPassword.$error.required">Repeat password is required!</span>
       </div>  
       <input type="hidden" id="existPassword" name="existPassword" value="${sessionScope['scopedTarget.userSession'].password}" class="form-control" required="required">
       <input type="hidden" id="changedPlayerId" name="changedPlayerId" value="${sessionScope['scopedTarget.userSession'].playerId}" class="form-control" required="required">           
      <div class="modal-footer d-flex justify-content-center">
        <button type="submit" class="btn btn-info" style="background: #18d26e;width: 100%;">SUBMIT</button>
      </div>
      </form>
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
  <script  src="resources/javascript/custom/changePassword.js" ></script>
  

</body>
</html>
