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
	    	var changepwdUrl = url+"changeOrganisePassword";
	    	$.ajax({
	    		async : false,
	            url: changepwdUrl,
	            data: formData,
	            contentType: false,
	            processData: false,
	            type: 'POST',
	            success: function(data){
	             if(data == "Password updated successfully"){
	            	 $scope.successmsg = "Password updated successfully...";
	           		 $("#success-alert").fadeIn(1000);
	           	  	 setTimeout(function(){ $("#success-alert").fadeOut(1000) }, 3000);
	           	   window.location.href = "organiserlogin";
	             }else{
	            	 $scope.errormsg = data;
	         		 $("#danger-alert").fadeIn(1000);
	         	  	 setTimeout(function(){ $("#danger-alert").fadeOut(1000) }, 3000);
	             }
	            }
	        });
	    }	
	
});