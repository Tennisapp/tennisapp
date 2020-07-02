var app = angular.module('myApp', []);

app.controller('myCtrl', function($scope, $http) {
	
	var myUrl = window.location.href;
	var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
	var playerID;
	
	 $scope.openNav = function () {
	      document.getElementById("mySidenav").style.width = "300px";
	    }
	    
	    $scope.closeNav = function closeNav() {
	      document.getElementById("mySidenav").style.width = "0";
	    }
	    $scope.sessionstore = function () {
	    	sessionStorage.tournament =1;
		}
	
	$scope.init = function() {
		 
		 $scope.getRankCategories();
		 $scope.getPlayerSettings();
		 
   };
   
   
   $scope.getPlayerSettings = function(){
	   var playerSettingsUrl = url+"playerView/getPlayerSettings";
		$http({
			method : "GET",
			url : playerSettingsUrl
		  }).then(function mySuccess(response) {
			  console.log(response.data);
			  
			  var result = response.data
			  playerID = result.player_id;
			  $scope.name = result.player_name;
			  $scope.phone = result.player_phone;
			  $scope.email  = result.player_email;
			  $scope.address = result.player_add;
			  $scope.address2 = result.player_add2;
			  $("#dateOfBirth").val(result.player_dob);
			  console.log(result.rank);
			  $scope.rankItem= result.rank;
			  if(result.rank ==1){
				  $scope.itaRank = ""; 
				  $scope.itaId = "";
			  }else{
				  $scope.itaRank = result.player_itarank; 
				  $scope.itaId = result.player_itaid;
			  }
			   
			  $scope.gender = result.gender;
				//var gender = $("input[name='gender']:checked").val();
		  }, function myError(response) {
		  });
	   
   }
   $scope.getRankCategories = function(){
	   
		var rankListUrl = url+"playerView/getAllRankCategories";
		$http({
			method : "GET",
			url : rankListUrl
		  }).then(function mySuccess(response) {
			  console.log("ranks==>"+ JSON.stringify(response.data));
			  $scope.rankList = response.data;
			  $scope.rankItem = $scope.rankList[0];
		  }, function myError(response) {
		  });
		}
   
   $scope.validatePlayerRegistration = function () {
	    var name =  $scope.name; 
		var phone =  parseInt($scope.phone); 
		var email =  $scope.email; 
		var rank = $scope.rankItem; 
		var address =  $scope.address; 
		var address2=$("#autocomplete").val();
		var dateOfBirth =  $("#dateOfBirth").val();
		var rankid = $scope.rankItem;
		var itaRank = parseInt($("#itaRank").val()); 
		var itaId = parseInt($("#itaId").val()); 
		var gender = $scope.gender;
		if(name.trim() == ""){
			$scope.registerPlyrValidate = "Name should not be empty...";
			return false;
		}
		if(phone == ""){
			$scope.registerPlyrValidate = "Phone should not be empty...";
			return false;
		}
		if((phone.toString()).length < 9){
			$scope.registerPlyrValidate = "Enter Valid Phone Number...";
			return false;
		}
		if(email.trim() == ""){
			$scope.registerPlyrValidate = "Email should not be empty...";
			return false;
		}
		
		
		if(address.trim() == ""){
			$scope.registerPlyrValidate = "Address should not be empty...";
			return false;
		}
		if(address2.trim() == ""){
			$scope.registerPlyrValidate = "Address should not be empty...";
			return false;
		}
		if(dateOfBirth == ""){
			$scope.registerPlyrValidate = "Date of birth should not be empty...";
			return false;
		}
		if(rankid == undefined || isNaN(rankid) || rankid == ""){
			$scope.registerPlyrValidate = "Please select ranking from list...";
			return false;
		}
		if(((itaRank == "" || isNaN(itaRank)) || (itaId == "" || isNaN(itaId))) && rankid !=1){
			$scope.registerPlyrValidate = "Id & Rank should not be empty..";
			return false;
		}
		if((itaRank == "" || isNaN(itaRank)) && (itaId == "" || isNaN(itaId)) && rankid ==1){
			itaRank = 11111111;
			itaId = 11111111;
		}
		
			var input = {
			"player_id" :	playerID,	
			"player_name" : name,
			"player_add":address,
			"player_add2":address2,
			"player_phone":phone,
			"player_email":email,
			"player_itaid":itaId,
			"player_itarank":itaRank,
			 "rank" : rank
			 }
			$scope.updatePlayerSettings(input);
	  }
   
   $scope.updatePlayerSettings = function (input) {

		var addPlayerUrl = url+"playerView/updatePlayersSettings";
		$.ajax({
			  async:false,
		      type: "POST",
		      contentType : 'application/json; charset=utf-8',
		      url:addPlayerUrl,
		      data: JSON.stringify(input), 
		      Success: function (data) {
		    	  console.log(JSON.stringify(data));
		    	 alert(data.responseText);
		      },
		      error: function (data) {
		    	  console.log(JSON.stringify(data));
		    	  alert(data.responseText);
		      }
		  });
	}
	
});