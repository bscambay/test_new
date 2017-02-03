

app.config(function($routeProvider) {
	$routeProvider.when('/accounts', {
    	templateUrl: "accounts",
    	controller: "accountController",
    	activetab: 'accounts'
   });
});



app.controller('accountController', 
		function($scope, $http, $location, $templateCache, $route, $routeParams, 
				pageService, csrfService, responseService) {
	
	pageService.setPageTitle("Admin");
	pageService.setPageTitleIcon("cogs");
	
	if ($route.current.templateUrl === "accounts")
	{
		// Packages
		pageService.setBreadcrumbData([{
			text:"Home", href:"#", active:false
		}, {
			text:"Accounts", href:"#accounts", active:true
		}]);
	}
	else
	{
		// Unexpected action
		pageService.setBreadcrumbData(pageService.DEFAULT_BREADCRUMB);
	}
});