activityApp.factory('apiService', ['$http', function($http) {

	return {
  	registerActivity: function(input) {
      var promise = $http.post('/api/activities', { activity: input.inputActivity, activities: input.data.activities })
      .success(function (data, status, headers, config) {
        return data;
      })
      .error(function (data, status, headers, config) {
        return data;
      });

      return promise;
  	}
	}

}]);