/**
 * Controller for the roles dialogs
 */
app.controller('accountRoleController', account_role)

role.$inject=['$scope', '$http', '$location', '$route', '$templateCache', 'pageService', 'csrfService']

function role($scope, $http, $location, $route, $templateCache, pageService, csrfService) {
	
	pageService.setPageTitle("AccountRoles");
	pageService.setPageTitleIcon("group");
	
	/* Handles the Save button click */
	$scope.saveNewRole = function() {
		
		$http.post('roles/saveNewAccountRole', $scope.role, csrfService.getHeader())
			.then(function(response) {
				$location.path('/roles');
				$templateCache.remove('roles');
				$route.reload();
			}, function (response) {
				alert(response.statusText);
			});
	};
	
	/* Handles the Cancel button click */
	$scope.cancelNewRole = function() {
		$location.path('/roles');
	};
	
	/* Model for the role */
	$scope.role = {
			name: null,
			description: null
	};
	
	/* Handles the Add New Role button click*/
	$scope.addNewRole = function() {
		$location.path('/newRole');
	};
	
	/* Handles the Add New Account Role button click*/
	$scope.addNewAccountRole = function(roleId) {
		
		$location.path('/newAccountRole/'+roleId);
	};
	
	
};
				
				
				