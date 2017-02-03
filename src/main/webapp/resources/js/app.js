/**
 * Initializes Angular app, sets templates and default controller to their routes (views)
 */

var app = angular.module("myApp", ["ngRoute", "datatables"]);


app.controller("goldController", function($scope, pageService) {

	$scope.pageData = pageService.pageData;
});

app.config(function($routeProvider) {
	$routeProvider.when('/dashboard', {
    	templateUrl: "dashboard",
    	controller: "dashboardController",
    	activetab: 'dashboard'
    }).otherwise({
    	templateUrl: "dashboard",
    	controller: 'dashboardController',
    	activetab: 'dashboard'
    });
});







