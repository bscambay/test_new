/**
 * Controller for the workflows dialogs
 */

app.config(function($routeProvider) {
	$routeProvider.when('/workflow', {
		templateUrl : "workflow",
		controller: "workflowController",
		activetab: 'addWorkflow'
	}).when('/workflows', {
    	templateUrl: "workflows",
    	controller: "workflowController",
    	activetab: 'listWorkflows'
    });
});

app.controller('workflowController', workflow)

workflow.$inject = [ '$scope', '$http', '$location', '$route',
		'$templateCache', '$window', 'pageService', 'csrfService' ]

function workflow($scope, $http, $location, $route, $templateCache, $window,
		pageService, csrfService) {
	if ($route.current.templateUrl === "workflows") {
		pageService.setPageTitle("Development");
		pageService.setPageTitleIcon("wrench");
		pageService.setBreadcrumbData([ {
			text : "Home",
			href : "#",
			active : false
		}, {
			text : "Workflows",
			href : "#workflows",
			active : true
		} ]);
	} else if ($route.current.templateUrl === "workflow") {
		pageService.setPageTitle("Development");
		pageService.setPageTitleIcon("wrench");
		pageService.setBreadcrumbData([ {
			text : "Home",
			href : "#",
			active : false
		}, {
			text : "Workflows",
			href : "#workflows",
			active : false
		}, {
			text : "Create New Workflow",
			href : "#workflow",
			active : true
		} ]);
	}

	/* Handles the Save button click */
	$scope.saveNewWorkflow = function() {

		$http.post('workflows/saveNew', $scope.workflow,
				csrfService.getHeader()).then(function(response) {
			$location.path('/workflows');
			$templateCache.remove('workflows');
			$route.reload();
		}, function(response) {
			alert(response.statusText);
		});
	};

	/* Handles the Cancel button click */
	$scope.cancelNewWorkflow = function() {
		$location.path('/workflows');
	};

	/* Handles the Add New Workflow button click */
	$scope.addNewWorkflow = function() {

		$location.path('/workflow');

	};

	/* Model for the workflow */
	$scope.workflow = {
		name : null,
		description : null
	};

	$scope.showDetails = function() {
		$window.alert('This would open the workflow details in view mode');
	};

};