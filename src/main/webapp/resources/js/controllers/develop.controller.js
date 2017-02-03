// TODO Chris - Abstract & Refactor the F*** out of this

/**
 * Develop Controller provides Angular support for develop screens
 */

app.config(function($routeProvider) {
	$routeProvider.when('/menus', {
    	templateUrl: "menus",
    	controller: "developController",
    	activetab: 'menus'
    }).when('/menus/new', {
    	templateUrl: "menus/new",
    	controller: "developController",
    	activetab: 'menus'
    }).when('/referenceTypes', {
    	templateUrl: "referenceTypes",
    	controller: "developController",
    	activetab: 'referenceTypes'
    }).when('/referenceTypes/new', {
    	templateUrl: "referenceTypes/new",
    	controller: "developController",
    	activetab: 'referenceTypes'
    }).when('/referenceTypes/:action/:refTypeId', {
    	templateUrl: "resources/templates/urlRouter.html",
    	controller: "developController",
    	activetab: 'referenceTypes'
    }).when('/packages', {
    	templateUrl: "packages",
    	controller: "developController",
    	activetab: 'packages'
    }).when('/newPackage', {
    	templateUrl: "packages/new",
    	controller: "developController",
    	activetab: 'packages'
    }).when('/packages/:action/:packageId', {
    	templateUrl: "resources/templates/urlRouter.html",
    	controller: "developController",
    	activetab: 'packages'
    }).when('/menus/:action/:menuId', {
    	templateUrl: "resources/templates/urlRouter.html",
    	controller: "developController",
    	activetab: 'menus'
	});
});

app.controller('developController', 
		function($scope, $http, $location, $templateCache, $route, $routeParams, 
				pageService, csrfService, responseService) {
	
	var PACKAGE_COL_NAME = 'packages';
	var PACKAGE_COL_NAME_TXT = 'Packages';
	var MENU_COL_NAME = 'menus';
	var MENU_COL_NAME_TXT = 'Menus';
	var REF_TYPE_COL_NAME = 'referenceTypes';
	var REF_TYPE_COL_NAME_TXT = 'Reference Types';
		
	pageService.setPageTitle("Development");
	pageService.setPageTitleIcon("wrench");

	if ($route.current.templateUrl === "packages")
	{
		// Packages
		pageService.setBreadcrumbData([{
			text:"Home", href:"#", active:false
		}, {
			text:"Packages", href:"#packages", active:true
		}]);
	}
	else if ($route.current.templateUrl === "packages/new")
	{
		// New package
		pageService.setBreadcrumbData([{
			text:"Home", href:"#", active:false
		}, {
			text:"Packages", href:"#packages", active:false
		}, {
			text: "New Package", active: true
		}]);
	}
	if ($route.current.templateUrl === "referenceTypes")
	{
		// Packages
		pageService.setBreadcrumbData([{
			text:"Home", href:"#", active:false
		}, {
			text:"Reference Types", href:"#referenceTypes", active:true
		}]);
	}
	else if ($route.current.templateUrl === "referenceTypes/new")
	{
		// New package
		pageService.setBreadcrumbData([{
			text:"Home", href:"#", active:false
		}, {
			text:"Reference Types", href:"#referenceTypes", active:false
		}, {
			text: "New Reference Type", active: true
		}]);
	}
	else if ($route.current.templateUrl === "resources/templates/urlRouter.html")
	{
		if (["edit", "view", "copy"].indexOf($route.current.params.action) != -1)
		{
			var col = null;
			var id = null;
			var colTxt = null;
			
			if ($route.current.params.packageId)
			{
				col = PACKAGE_COL_NAME;
				colTxt = PACKAGE_COL_NAME_TXT;
				id = $route.current.params.packageId;
			}
			else if ($route.current.params.menuId)
			{
				col = MENU_COL_NAME;
				colTxt = MENU_COL_NAME_TXT;
				id = $route.current.params.menuId;
			}
			else if ($route.current.params.refTypeId)
			{
				col = REF_TYPE_COL_NAME;
				colTxt = REF_TYPE_COL_NAME_TXT;
				id = $route.current.params.refTypeId;
			}
			
			// Edit or view existing packages
			$http.post(col + "/name/" + id, null, csrfService.getHeader())
				.then(function(response) {
						if (!responseService.errorResponse(response)) {
							
							var prefix = $route.current.params.action === "copy" ? "Copy of " : "";
							var name = null;
							
							if (col === PACKAGE_COL_NAME)
							{
								name = response.data.attributes.packageName;
							}
							else if (col === MENU_COL_NAME)
							{
								name = response.data.attributes.menuName;
							}
							else if (col === REF_TYPE_COL_NAME)
							{
								name = response.data.attributes.refTypeName;
							}
							
							pageService.setBreadcrumbData([{
								text:"Home", href:"#", active:false
							}, {
								text:colTxt, href:"#" + col, active:false
							}, {
								text: prefix + name, active:true
							}]);
						}
						else
						{
							
							pageService.setBreadcrumbData([{
								text:"Home", href:"#", active:false
							}, {
								text:colTxt, href:"#" + col, active:false
							}, {
								text:"[Error Getting Name]", active:true
							}]);
						}
					}, function (response) {
						alert(response.status);
					});				
		}
		else
		{
			// Unexpected action
			pageService.setBreadcrumbData(pageService.DEFAULT_BREADCRUMB);
		}
	}
	else if ($route.current.templateUrl === "menus")
	{
		// Menus
		pageService.setBreadcrumbData([{
			text:"Home", href:"#", active:false
		}, {
			text:"Menus", href:"#menus", active:true
		}]);

	}
	else if ($route.current.templateUrl === "menus/new")
	{
		// New menu
		pageService.setBreadcrumbData([{
			text:"Home", href:"#", active:false
		}, {
			text:"Menus", href:"#menus", active:false
		}, {
			text: "New Menu", active: true
		}]);
	}
	else
	{
		// Unexpected template
		pageService.setBreadcrumbData(pageService.DEFAULT_BREADCRUMB);
	}
	
	/**
	 * Template redirects
	 */
	if ($routeParams.packageId && $routeParams.action)
	{
		$scope.templateUrl = 'packages/' + $routeParams.action + 
			'/' + $routeParams.packageId;
	}
	else if ($routeParams.menuId && $routeParams.action)
	{
		$scope.templateUrl = 'menus/' + $routeParams.action + '/' + 
			$routeParams.menuId;
	}
	else if ($routeParams.refTypeId && $routeParams.action)
	{
		$scope.templateUrl = 'referenceTypes/' + $routeParams.action + '/' + 
			$routeParams.refTypeId;
	}

	/**************************************************************************
	 * Working variables
	 *************************************************************************/
	
	$scope._package = {
			id: null,
			name: null,
			description: null
	};
	
	$scope.menus = null;
	
	$scope.menu = {
			id: null,
			name: null,
			description: null
	};
	
	$scope.refType = {
		id: null,
		name: null,
		values: []
	};
	
	/**
	 * Handler for the save button click on the edit package page
	 */
	$scope.savePackage = function() {
		$http.post('packages/save', $scope._package, csrfService.getHeader())
			.then(function(response) {
				if (!responseService.errorResponse(response))
				{
					$location.path('/packages');
					$templateCache.remove('packages');
					$route.reload();
				}
			}, function (response) {
				alert(response.status);
		});
	};
	
	/**
	 * Handler for the save button click on the edit menu page
	 */
	$scope.saveMenu = function() {
		$http.post('menus/save', $scope.menu, csrfService.getHeader())
			.then(function(response) {
				if (!responseService.errorResponse(response))
				{
					$location.path('/menus');
					$templateCache.remove('menus');
					$route.reload();
				}
			}, function (response) {
				alert(response.status);
		});
	};
	
	/**
	 * Handle cancel button click
	 */
	$scope.cancelEdit = function(list) {
		$location.path('/' + list);
		$templateCache.remove(list);
		$route.reload();
	};
	
	/**
	 * Handle delete button click event
	 */
	$scope.deletePackage = function(packageId) {
		if (confirm("Are you sure you want to delete this package?"))
		{
			$http.post('packages/delete/' + packageId, {}, csrfService.getHeader())
				.then(function(response) {
					if (!responseService.errorResponse(response))
					{
						$location.path('/packages');
						$templateCache.remove('packages');
						$route.reload();
					}
				}, function(response) {
					alert(response.status);
				});
		}
	};
	
	/**
	 * Handle delete button click event
	 */
	$scope.deleteMenu = function(menuId) {
		if (confirm("Are you sure you want to delete this menu?"))
		{
			$http.post('menus/delete/' + menuId, {}, csrfService.getHeader())
				.then(function(response) {
					if (!responseService.errorResponse(response))
					{
						$location.path('/menus');
						$templateCache.remove('menus');
						$route.reload();
					}
				}, function(response) {
					alert(response.status);
				});
		}
	};
	
});