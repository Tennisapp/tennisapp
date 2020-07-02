var app = angular.module('myApp', ['ui', 'ui.filters']);

app.controller('myCtrl', function($scope, $http) {
	
	var myUrl = window.location.href;
	var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
	
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
	    	$scope.getRegisteredTournaments();
	    	$scope.getPlayerSettings();
	    	$scope.getResultsTournaments();
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
				  $scope.playerName = result.player_name;
				  //$scope.getRankCategories(result.rank);
				  $scope.dob = result.player_dob;
				  
				  $scope.rankItem= result.rank;
				  console.log(result);
				  if(result.rank ==1){
					  $scope.rank ="";
					  $scope.rankName="";
				  }else{
					  $scope.getRankCategories(result.rank);
					$scope.rank =   result.player_itarank + "("+ result.player_itaid+")";
				  }
				   
				  $scope.gender = result.gender;
					//var gender = $("input[name='gender']:checked").val();
			  }, function myError(response) {
			  });
		   
	   }
	   $scope.getRankCategories =  function(rank){
		   
			var rankListUrl = url+"playerView/getAllRankCategories";
			$http({
				method : "GET",
				url : rankListUrl
			  }).then(function mySuccess(response) {
				  console.log("rankdata=="+ JSON.stringify(response.data));
				  angular.forEach(response.data, function (value, key) {
					  console.log(value.rankId);
					  if(value.rankId == rank)
						  $scope.rankName = value.rankName;
				  });
				  
			  }, function myError(response) {
			  });
			}
	   $scope.getRegisteredTournaments = function(){
		   
		   var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
			var tournamentUrl = url+"playerView/getTournamentListForAPlayer" ;
			$http({
				method : "GET",
				url : tournamentUrl
			  }).then(function mySuccess(response) {
				  //console.log(response.data);
			      $scope.prepareMyList(response.data);
			  }, function myError(response) {
				//alert(response);
			});
	   }
	
	   
	   
	 
$scope.getResultsTournaments = function(){
		   
		   var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
			var tournamentUrl = url+"playerView/getRegisteredTournsForAPlayer" ;
			$http({
				method : "GET",
				url : tournamentUrl
			  }).then(function mySuccess(response) {
				  //console.log(response.data);
			      $scope.prepareMyResults(response.data);
			  }, function myError(response) {
				//alert(response);
			});
	   }
$scope.prepareMyList = function(data){
	   $scope.myRegList =[];
	   angular.forEach(data, function (value, key) { 
		   angular.forEach(data[key].categoryBean, function (innvalue, innkey) { 
			   var obj={
					   "tournament_id" : value.tournament_id,
					   "tournament_name" : value.tournament_name,
					   "tournament_startDate" : value.tournament_startDate,
					   "categoryId" : innvalue.category_id,
					   "category" : innvalue.category_name.split("_")[1],
						"subcategory"  : innvalue.category_name.split("_")[2],
						"gender" :   innvalue.category_name.split("_")[0]
			   }
			   $scope.myRegList.push(obj);
        });
    }); 
	   console.log("shivaregis==>"+ JSON.stringify($scope.myRegList));
	   $scope.shiva = $scope.myRegList[0];
	   $scope.selectedsubcat = $scope.myRegList[0];
}
$scope.prepareMyResults = function(data){
	   $scope.myResList =[];
	   angular.forEach(data, function (value, key) { 
		   angular.forEach(data[key].categoryModel, function (innvalue, innkey) { 
			   var obj={
					   "tournament_id" : value.tournament_id,
					   "tournament_name" : value.tournament_name,
					   "tournament_startDate" : value.tournament_startDate,
					   "categoryId" : innvalue.category_id,
					   "category" : innvalue.category_name.split("_")[1],
						"subcategory"  : innvalue.category_name.split("_")[2],
						"gender" :   innvalue.category_name.split("_")[0],
						"matchModel" : innvalue.matchModel
			   }
			   $scope.myResList.push(obj);
        });
    }); 
	   console.log("shivaresults==>"+ JSON.stringify($scope.myResList));
	 $scope.selectedRescat = $scope.myResList[0];
	 $scope.selectedRessubcat = $scope.myResList[0];
	
}
	   
	   
	  $scope.filterResCate = function (item2) { 
		  console.log("rescat==="+$scope.selectedRescat);
		    return item2.category === $scope.selectedRescat.category && item2.subcategory === $scope.selectedRessubcat.subcategory ; 
		};
		
		
		$scope.filterCate = function (item) { 
			  console.log("regscat==="+JSON.stringify($scope.shiva));
			    return item.category === $scope.shiva.category && item.subcategory === $scope.selectedsubcat.subcategory ; 
			};
		
});

app.filter("myfilter", function(){

    return function(score,parm){
    	var set = score.split(",");
    	console.log("set==>"+set.length);
    	var seta = set[0].split("-")[0];
    	var setb = set[1].split("-")[0];
    	var setc = set[2].split("-")[0];
    	var setd = set[0].split("-")[1];
    	var sete = set[1].split("-")[1];
    	var setf = set[2].split("-")[1];

        if(parm==='a'){
        	return seta;
        }
        if(parm==='b'){
        	return setb;
        }
        if(parm==='c'){
        	return setc;
        }
        if(parm==='d'){
        	return setd;
        }
        if(parm==='e'){
        	return sete;
        }
        if(parm==='f'){
        	return setf;
        }
        
        

        return "";
    };
});