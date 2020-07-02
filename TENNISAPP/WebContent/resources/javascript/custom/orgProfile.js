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
		 
		var myUrl = window.location.href;
		var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
		var tournamentUrl = url+"getMyTournaments";
		$http({
			method : "GET",
			url : tournamentUrl
		  }).then(function mySuccess(response) {
			  console.log(response.data);
		    $scope.mytournaments = response.data;
		    $scope.prepareAndSplitDropDown(response.data[0].categoryList);
		  }, function myError(response) {
			//alert(response);
		});
		 
		 
   };
   
   $scope.prepareAndSplitDropDown = function(data){
	   console.log("shiva"+data);
	    $scope.allCategories =[]; $scope.allSubCategories = []; $scope.allGenderList = [];
	    for(var i = 0; i < data.length; i++){
	    	var n = (data[i].categoryName).split("_");
	    	/*var input1 = {
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
	        };*/
	    	$scope.allCategories.push(n[n.length - 2]);
	    	$scope.allSubCategories.push(n[n.length - 1]);
	    	$scope.allGenderList.push(n[n.length - 3]);
	    }
	    
	    $scope.categories = $scope.allCategories.join(",")+ " - " + $scope.allGenderList.join(",")+" - " + $scope.allSubCategories.join(",") ;
	    
	}
   
   
   
	
});

app.filter('categoryFormat', function() {
    return function(data) {
    	 var allCategories =[]; 
    	 var allSubCategories = [];
    	 var allGenderList = [];
	    for(var i = 0; i < data.length; i++){
	    	var n = (data[i].categoryName).split("_");
	    	allCategories.push(n[n.length - 2]);
	    	allSubCategories.push(n[n.length - 1]);
	    	allGenderList.push(n[n.length - 3]);
	    }
	    
	    return allCategories.filter(onlyUnique).join(", ")+ " - " + allGenderList.filter(onlyUnique).join(", ")+" - " + allSubCategories.filter(onlyUnique).join(", ") ;
    	
    };
});

function onlyUnique(value, index, self) { 
    return self.indexOf(value) === index;
}