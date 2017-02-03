/**
 * Controller for the roles dialogs
 */

app.config(function($routeProvider) {
	$routeProvider.when('/roles', {
    	templateUrl: "roles",
    	controller: "roleController",
    	activetab: 'roles'
    }).when('/newRole', {
    	templateUrl: "roles/new",
    	controller: "roleController",
    	activetab: 'roles'
    }).when('/newAccountRole/:roleId', {
    	templateUrl: "resources/templates/urlRouter.html",
    	controller: "roleController",
    	activetab: 'roles'
	});
});


app.controller('roleController', role)

role.$inject = [ '$scope', '$http', '$location', '$route', '$templateCache',
             '$routeParams', 'pageService', 'csrfService', 'responseService']

function role($scope, $http, $location, $route, $templateCache, $routeParams, pageService,
             csrfService, responseService) {
       if ($route.current.templateUrl === "roles") {
             pageService.setPageTitle("Admin");
             pageService.setPageTitleIcon("cogs");
             pageService.setBreadcrumbData([ {
                    text : "Home",
                    href : "#",
                    active : false
             }, {
                    text : "Roles",
                    href : "#roles",
                    active : true
             } ]);
       } else if ($route.current.templateUrl === "roles/new") {
             pageService.setPageTitle("Admin");
             pageService.setPageTitleIcon("cogs");
             pageService.setBreadcrumbData([ {
                    text : "Home",
                    href : "#",
                    active : false
             }, {
                    text : "Roles",
                    href : "#roles",
                    active : false
             }, {
                    text : "Create New Role",
                    href : "#newRole",
                    active : true
             } ]);
       } 
       
       /* Handles the Delete Role button click */
       $scope.deleteRole = function(roleId) {
   		if (confirm("Are you sure you want to delete this role?"))
   		{
   			$http.post('roles/delete/' + roleId, {}, csrfService.getHeader())
   				.then(function(response) {
   					if (!responseService.errorResponse(response))
   					{
   						$location.path('/roles');
   						$templateCache.remove('roles');
   						$route.reload();
   					}
   				}, function(response) {
   					alert(response.status);
   				});
		   		}
		 };
       
       /* Handles the Save button click */
       $scope.saveNewRole = function() {




             $http.post('roles/saveNew', $scope.role, csrfService.getHeader()).then(
                           function(response) {
                                 $location.path('/roles');
                                 $templateCache.remove('roles');
                                 $route.reload();
                           }, function(response) {
                                 alert(response.statusText);
                           });
       };

       /* Handles the Cancel button click */
       $scope.cancelNewRole = function() {
             $location.path('/roles');
       };
       
       $scope.doneClick = function(){
    	   $location.path('/roles');
       };
       
       $scope.cancelAccountRole = function() {
    	   $location.path('/roles');
   		};

   		if($routeParams.roleId){
   			$scope.templateUrl = 'roles/newAccountRole/' + $routeParams.roleId;
   		}
   		
   		$scope.accounts=[];
   		
       /* Model for the role */
       $scope.role = {
             name : null,
             description : null
       };


	
	
	/* Handles the Add New Account Role button click*/
	$scope.addNewAccountRole = function(roleId) {
		$location.path('/newAccountRole/'+roleId);
	};
	
	$scope.addRoleToAccount = function(roleId, accountPin){
			$http.post('packages/save', $scope._package, csrfService.getHeader())
			.then(function(response) {
				if (!responseService.errorResponse(response))
				{
					
					// Role-back changes if failure
				} else {
					// Move entry from box 1 to box 2
					
				}
			}, function (response) {
				alert(response.status);
		});
	};



       /* Handles the Add New Role button click */
       $scope.addNewRole = function() {
             $location.path('/newRole');
       };
       
};