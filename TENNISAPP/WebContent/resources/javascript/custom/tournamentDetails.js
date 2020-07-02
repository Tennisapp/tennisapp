var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {
	var myUrl = window.location.href;
	var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
	$( "#dateOfBirth" ).datepicker({
		  dateFormat : 'yy-mm-dd',
	     changeMonth: true,
	     changeYear: true,
	     yearRange: '-100y:c+nn',
	     maxDate: '-1d'
	   });
	
	$scope.openNav = function () {
	      document.getElementById("mySidenav").style.width = "300px";
	    }
	    
	    $scope.closeNav = function closeNav() {
	      document.getElementById("mySidenav").style.width = "0";
	    }
	    $scope.sessionstore = function () {
	    	
	    	sessionStorage.tournament =1;
		    }
	$scope.init = function(){
		$scope.afterLoginTournament();
		$scope.getProfileData();
	}
	
	
	//prepare google map 

	 $scope.Markers = [
         {
             "title": 'Aksa Beach',
             "lat": '19.1759668',
             "lng": '72.79504659999998',
             "description": 'Aksa Beach is a popular beach and a vacation spot in Aksa village at Malad, Mumbai.'
         }];
	

          
	
	
	
	$scope.afterLoginTournament = function(){
		var mainCategoryList = url+"playerView/singleTournamentWithCategories?tournamentId="+$("#tournamentid").val();
		$http({
			method : "GET",
			url : mainCategoryList
		  }).then(function mySuccess(response) {
		    var list = response.data;
		    //console.log(JSON.stringify(list));
		    $scope.tournamentCat = list;
			$scope.category = list.tournamentId;
			$scope.tournamentStartDate = list.tournamentStartDate;
			$scope.regEndDate = list.regEndDate;
			$scope.regStartDate = list.regStartDate;
			$scope.enableButtonDetails();
			$scope.prepareAndSplitDropDown(list.categoryList);
			var coordinateValues=list.coordinate.split(',');
			var lat=coordinateValues[0];
			var lng=coordinateValues[1];
			
			
			//google map code
			 $scope.Markers = [
		           {
		               "title": list.venueName,
		               "lat": lat,
		               "lng": lng,
		               "description": 'Tennis Game Academy '+list.venueAddress
		           }];
			 
			 //Setting the Map options.
	           $scope.MapOptions = {
	               center: new google.maps.LatLng($scope.Markers[0].lat, $scope.Markers[0].lng),
	               zoom: 12,
	               mapTypeId: google.maps.MapTypeId.ROADMAP
	           };

	           //Initializing the InfoWindow, Map and LatLngBounds objects.
	           $scope.InfoWindow = new google.maps.InfoWindow();
	           $scope.Latlngbounds = new google.maps.LatLngBounds();
	           $scope.Map = new google.maps.Map(document.getElementById("dvMap"), $scope.MapOptions);

	           //Looping through the Array and adding Markers.
	           for (var i = 0; i < $scope.Markers.length; i++) {
	               var data = $scope.Markers[i];
	               var myLatlng = new google.maps.LatLng(data.lat, data.lng);

	               //Initializing the Marker object.
	               var marker = new google.maps.Marker({
	                   position: myLatlng,
	                   map: $scope.Map,
	                   title: data.title
	               });

	               //Adding InfoWindow to the Marker.
	               (function (marker, data) {
	                   google.maps.event.addListener(marker, "click", function (e) {
	                       $scope.InfoWindow.setContent("<div style = 'width:200px;min-height:40px'>" + data.description + "</div>");
	                       $scope.InfoWindow.open($scope.Map, marker);
	                   });
	               })(marker, data);

	               //Plotting the Marker on the Map.
	               $scope.Latlngbounds.extend(marker.position);
	           }

	           //Adjusting the Map for best display.
	           $scope.Map.setCenter($scope.Latlngbounds.getCenter());
	          // $scope.Map.fitBounds($scope.Latlngbounds);
		            
		  }, function myError(response) {
			alert(response);
		});
		
	}

$scope.prepareAndSplitDropDown = function(data){
    $scope.allCategories =[]; $scope.allSubCategories = []; $scope.allGenderList = [];
    for(var i = 0; i < data.length; i++){
    	var n = (data[i].categoryName).split("_");
    	var input1 = {
        		"mainCat":n[n.length - 2],
        		"id":i
        		
        };
    	var input2 = {
        		"subCat":n[n.length - 1],
        		"id":i
        };
    	var input3 = {
        		"genCat":n[n.length - 3],
        		"id":i
        };
    	$scope.allCategories.push(input1);
    	$scope.allSubCategories.push(input2);
    	$scope.allGenderList.push(input3);
    }
    
}
$scope.download = function(){
	var svgid = $scope.rounds.length;
	domtoimage.toBlob(document.getElementById("downloaddraw"+svgid))
    .then(function(blob) {
      window.saveAs(blob, $scope.tournamentCat.title+"("+$scope.catTtle+').png');
    });
}
$scope.expandeDiv = function(){
	var category = $("#genCat").children("option:selected").val()+"_"+$("#mainCat").children("option:selected").val()+"_"+$("#subCat").children("option:selected").val();
	for(var i = 0; i < ($scope.tournamentCat.categoryList).length; i++){
		if (category == ($scope.tournamentCat.categoryList[i]).categoryName)
        {
			$scope.singleCategory = $scope.tournamentCat.categoryList[i];
			$scope.playerListForAcategory = $scope.tournamentCat.categoryList[i].playerList;
			$scope.tournamentID = $scope.tournamentCat.tournamentId;
			$scope.categoryID = $scope.tournamentCat.categoryList[i].categoryId;
			$scope.tournamentFeeForReg = $scope.tournamentCat.categoryList[i].tournamentFee;
			$scope.matchTypeReg = $scope.tournamentCat.categoryList[i].matchType;
			$scope.catTtle = $scope.tournamentCat.categoryList[i].categoryName;
			//$scope.afterLoginTournament();
			$scope.getDraws();
			$scope.isPlayerListPublish();
			$scope.CatNotExist = "";
		  $('#hideThis').show();
		  break;
        }else{
        	$scope.singleCategory={};
        	$('#hideThis').hide();
        	$scope.CatNotExist = "Tournament category does not exist! Please change.";
        }
	}

}	
$scope.getDraws = function(){
	var buildDrawsUrl = url+"playerView/buildCategoryDrwas?tournamentId="+$scope.tournamentID+"&categoryId="+$scope.categoryID+"&tournamentStart="+$scope.tournamentStartDate;
    $http({
    	method : "GET",
    	url : buildDrawsUrl
      }).then(function mySuccess(response) {
    	  $scope.rounds = response.data.drwasList;
    	  $scope.compaireDate = response.data.matchStarted;
    	  $scope.drawPublish = response.data.drawsPublish;
      }, function myError(response) {
    	//alert(response);
      });
  }

$scope.isPlayerListPublish = function(){
	var isPublishUrl = url+"playerView/isPlayerListPublish?tournamentId="+$scope.tournamentID+"&categoryId="+$scope.categoryID;
	$http({
    	method : "GET",
    	url : isPublishUrl
      }).then(function mySuccess(response) {
    	  $scope.playersPublish = response.data.playersPublish;
      }, function myError(response) {
    	//alert(response);
      });
}
$scope.enableButtonDetails = function(){
	var isDrwasCreated = url+"playerView/isPlayerviewDrwasCreated?tournamentId="+$scope.tournamentID+"&regEndDate="+$scope.regEndDate+"&regStartDate="+$scope.regStartDate;
	$http({
		method : "GET",
		url : isDrwasCreated
	  }).then(function mySuccess(response) {
	   $scope.enableButton = response.data;
	  }, function myError(response) {
		//alert(response);
	});
}
$scope.registerPlayerForTournament = function(tournamentFee,matchType,player,gender,age){
	var playerId = $("#popupmsg").val();
	if(playerId < 0 || playerId == "" || playerId == undefined){
		window.location.href = "playerhome";
	}else{
		if(player < 0){
			if(matchType == 1)
		      $("#modalContactForm").modal("show");
			else{
				var tournamentUrl = url+"playerView/getPlayerList?tournamentId="+$scope.tournamentID+"&categoryId="+$scope.categoryID;
				$http({
					method : "GET",
					url : tournamentUrl
				  }).then(function mySuccess(response) {
					  $scope.otherPlayers = response.data;
				  }, function myError(response) {
					//alert(response);
				  });
				$scope.getRankCategories();
				 $("#modalDoublesRegForm").modal("show");
			}
			 
	  }else{
		  alert("You've already resistered...");
	  }
	  }
}
//Player Registration
$scope.validatePlayerRegistration = function () {
    var name =  $scope.name; 
	var phone =  parseInt($scope.phone); 
	var email =  $scope.email; 
	var address =  $scope.address; 
	var addressLine2 =  $("#autocomplete").val();
	var dateOfBirth =  $("#dateOfBirth").val();
	var rankid = $scope.rankItem.rankId;
	var itaRank = parseInt($("#itaRank").val()); 
	var itaId = parseInt($("#itaId").val()); 
	//var gender = $("input[name='gender']:checked").val();
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
	if(addressLine2.trim() == ""){
		$scope.registerPlyrValidate = "AddressLine2 should not be empty...";
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
		"name": name,
		"dateOfBirth":dateOfBirth,
		"address":address,
		"addressLine2": addressLine2,
		"lavel":"high",
		"phone":phone,
		"email":email,
		"itaId":itaId,
		"itaRank":itaRank,
		//"gender":parseInt(gender),
		"points":5,
		"rank":rankid
		 }
		$scope.addSecondPlayerRegistration(input);
  }
// Player registration
$scope.addSecondPlayerRegistration = function (input) {
	var addPlayerUrl = url+"playerView/addSecondPlayer";
	$.ajax({
		 async:false,
	      type: "POST",
	      contentType : 'application/json; charset=utf-8',
	      url:addPlayerUrl,
	      data: JSON.stringify(input), 
           success: function(data){
        	   if(data > 0){
        		   $scope.secondPlayer = data;
        		   $("#modalDoublesRegForm").modal("hide");
   				   $("#modalSecondPayment").modal("show");
        	   }
        	   else if(data == -1)
        		   $scope.registerPlyrValidate = "Player already registered";
        	   else
        		   $scope.registerPlyrValidate = "Something went wrong";
        		   
        }
    });
	
}
$scope.selectSecondPlayer = function () {
	$scope.secondPlayer = $( "#secondPlayer option:selected" ).val();
	$("#modalDoublesRegForm").modal("hide");
	$("#modalSecondPayment").modal("show");
}
$scope.registerDoublesPlayerForTournamentCategory = function(){
	var formData = new FormData();
	formData.append('cardHolderName', $scope.cardSecondHolderName);
	formData.append('cardNumber', $scope.cardSecondNumber);
	formData.append('cardType', $scope.cardSecondType);
	formData.append('amount', $("#Secondamount").val());
	formData.append('playerIdForReg', $("#SecondplayerIdForReg").val());
	formData.append('tournamentIdForReg',$("#SecondtournamentIdForReg").val());
	formData.append('categoryIdForReg', $("#SecondcategoryIdForReg").val());
	formData.append('matchTypeReg', 2);
	formData.append('secondPlayer',$scope.secondPlayer);
	
	var paymentUrl = url+"registerPlayerForTournamentCategoryFromJs";
	$.ajax({
        url: paymentUrl,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
        	$scope.recursionMethodCall();
         if(data == "Payment Received Successfully"){
        	 $("#modalSecondPayment").modal("hide");
        	// $scope.messageWithSucces(data);
        	 alert(data);
         }else{
        	// $scope.messageWithError(data);
        	 alert(data);
         }
        }
    });
	
}
$scope.getRankCategories = function(){
	var rankListUrl = url+"playerView/getAllRankCategories";
	$http({
		method : "GET",
		url : rankListUrl
	  }).then(function mySuccess(response) {
		  $scope.rankList = response.data;
		  $scope.rankItem = $scope.rankList[0];
	  }, function myError(response) {
	  });
	}
$scope.registerPlayerForTournamentCategory = function(){
	var formData = new FormData();
	formData.append('cardHolderName', $scope.cardHolderName);
	formData.append('cardNumber', $scope.cardNumber);
	formData.append('cardType', $scope.cardType);
	formData.append('amount', $("#amount").val());
	formData.append('playerIdForReg', $("#playerIdForReg").val());
	formData.append('tournamentIdForReg',$("#tournamentIdForReg").val());
	formData.append('categoryIdForReg', $("#categoryIdForReg").val());
	formData.append('matchTypeReg', 1);
	formData.append('secondPlayer',-1);
	
	var paymentUrl = url+"registerPlayerForTournamentCategoryFromJs";
	$.ajax({
        url: paymentUrl,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
        	$scope.recursionMethodCall();
         if(data == "Payment Received Successfully"){
        	 $("#modalContactForm").modal("hide");
        	// $scope.messageWithSucces(data);
        	 alert(data);
         }else{
        	// $scope.messageWithError(data);
        	 alert(data);
         }
        }
    });
	
}
$scope.getProfileData = function(){
	var profileUrl = url+"getProfile";
	$http({
		method : "GET",
		url : profileUrl
	  }).then(function mySuccess(response) {
		  //console.log(JSON.stringify(response.data));
		  $scope.profileData = response.data;
	  }, function myError(response) {
		//alert(response);
	  });
}
$scope.validateChangePassword = function () {	
	var oldpwd = $scope.oldPassword;
	var newpwd = $scope.newPassword;
	var retypepwd = $scope.repeatPassword;
	var existPassword = $("#existPassword").val();
	var changedPlayerId = $("#changedPlayerId").val();
	
	if(oldpwd == ""){
		$scope.changePwdValidate = "Current Password Field should Not Be Empty...";
		return false;
	}
	if(existPassword != oldpwd){
		$scope.changePwdValidate = "Current Password is Wrong...";
		return false;
	}
	if(newpwd == ""){
		$scope.changePwdValidate = "New Password Field should Not Be Empty...";
		return false;
	}
	if(retypepwd == ""){
		$scope.changePwdValidate = "Repeat Password Field should Not Be Empty...";
		return false;
	}
	if(newpwd != retypepwd){
		$scope.changePwdValidate = "New Password and Repeat password should be match...";
		return false;
	}
		var formData = new FormData();
		formData.append('oldpwd', oldpwd);
		formData.append('newpwd', newpwd);
		formData.append('retypepwd', retypepwd);
		
		$scope.editPassword(formData);
}
$scope.editPassword = function (formData){
	var changepwdUrl = url+"playerView/changePlayerPassword";
	$.ajax({
        url: changepwdUrl,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
        	//showAlertSec(data);
         if(data == "Password updated successfully"){
        	// $scope.messageWithSucces(data);
        	 alert(data);
        	 window.location.href = "playerhome";
         }else{
        	 $scope.changePwdValidate = data;
         }
        }
    });
}
$scope.recursionMethodCall = function(){
	var mainCategoryList = url+"playerView/singleTournamentWithCategories?tournamentId="+$("#tournamentid").val();
	$http({
		method : "GET",
		url : mainCategoryList
	  }).then(function mySuccess(response) {
	    var list = response.data;
	    //console.log(JSON.stringify(list));
	    $scope.tournamentCat = list;
		$scope.category = list.tournamentId;
		$scope.tournamentStartDate = list.tournamentStartDate;
		$scope.regEndDate = list.regEndDate;
		$scope.regStartDate = list.regStartDate;
		$scope.enableButtonDetails();
		$scope.expandeDiv();
	  }, function myError(response) {
		//alert(response);
	});
	
}
});
app.filter('unique', function () {

    return function (items, filterOn) {

        if (filterOn === false) {
            return items;
        }

        if ((filterOn || angular.isUndefined(filterOn)) && angular.isArray(items)) {
            var hashCheck = {}, newItems = [];

            var extractValueToCompare = function (item) {
                if (angular.isObject(item) && angular.isString(filterOn)) {
                    return item[filterOn];
                } else {
                    return item;
                }
            };

            angular.forEach(items, function (item) {
                var valueToCheck, isDuplicate = false;

                for (var i = 0; i < newItems.length; i++) {
                    if (angular.equals(extractValueToCompare(newItems[i]), extractValueToCompare(item))) {
                        isDuplicate = true;
                        break;
                    }
                }
                if (!isDuplicate) {
                    newItems.push(item);
                }

            });
            items = newItems;
        }
        return items;
    };
});