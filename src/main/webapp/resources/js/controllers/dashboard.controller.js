/**
 * Controller for the Dashboards dialogs
 */
app.controller('dashboardController', Dashboard)

Dashboard.$inject = [ '$scope', '$http', '$location', '$route',
		'$templateCache', 'pageService']

function Dashboard($scope, $http, $location, $route, $templateCache, pageService) {
	
	pageService.setPageTitle("Dashboard");
	pageService.setPageTitleIcon("dashboard");
	pageService.setBreadcrumbData([{
		text:"Home", href:"#", active:false
	}, {
		text:"Dashboard", href:"#dashboard", active:true
	}]
	);
	
	
	/**
	 * This is necessary to make Ajax callbacks using Spring Security.
	 */
	$scope.getCsrfToken = function() {
		return $("meta[name='_csrf']").attr('content');
	};
	
	/**
	 * This returns the name of the Spring Security token
	 */
	$scope.getCsrfHeader = function() {
		return $("meta[name='_csrf_header']").attr('content');
	};
	

	


};
				
				
				