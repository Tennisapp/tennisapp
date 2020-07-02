var app = angular.module('myApp', []);

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
	
});