activityApp.controller('apiController', ['$scope', 'apiService', function ($scope, apiService) {

	$scope.data = {
		activities: []
	};

	$scope.registerActivity = function() {
		apiService.registerActivity($scope).then(function(promise) {
	    if(promise.data) {
	    	$scope.data.activities.push(promise.data);
	  	}
	    $scope.inputActivity = "";
	  }, function(promise) {
	  	$scope.alert = promise.data;
	  });
	};

}]);