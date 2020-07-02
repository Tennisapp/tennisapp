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
	
	$scope.init = function() {
		 
		 
		 $scope.getOrganizerSettings();
		 
   };
   
   
   $scope.getOrganizerSettings = function(){
	   var playerSettingsUrl = url+"playerView/getOrganizerSettings";
		$http({
			method : "GET",
			url : playerSettingsUrl
		  }).then(function mySuccess(response) {
			  console.log(response.data);
			  
			  var result = response.data
			  playerID = result.org_id;
			  $scope.name = result.org_name;
			  $scope.phone = result.org_phone;
			  $scope.email  = result.org_mailid;
			  $scope.address = result.org_add;
			  $scope.address2 = result.org_add2;
			  
		  }, function myError(response) {
		  });
	   
   }
 
   $scope.validateOrganizerRegistration = function () {
	    var name =  $scope.name; 
		var phone =  parseInt($scope.phone); 
		var email =  $scope.email; 
		var address =  $scope.address; 
		var address2=$("#autocomplete").val();
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
		
			var input = {
			"org_id" :	playerID,	
			"org_name" : name,
			"org_add":address,
			"org_add2":address2,
			"org_phone":phone,
			"org_mailid":email,
			 }
			$scope.updateOrganizerSettings(input);
	  }
   
   $scope.updateOrganizerSettings = function (input) {

		var addPlayerUrl = url+"playerView/updateOrganizerDetails";
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