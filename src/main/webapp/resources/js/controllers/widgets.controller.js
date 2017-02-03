app.controller('widgetsController', makeActive)

function makeActive($scope, $route) {
	$scope.$route = $route;
	
	/**
	 * Handle updating view after content is updated
	 */
	$scope.$on('$viewContentLoaded', function() {
		// Update breadcrumb control here
		timeout(function() {
			alert("Here");			
		}, 500);
	});
};

