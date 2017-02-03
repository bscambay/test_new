/**
 * Angular factory service: pageService
 */

var app = angular.module("myApp");

app.factory('pageService', function() {
	
	var DEFAULT_BREADCRUMB = [{
		text:"Home", href:"#", active:true
	}];
	
	var data = {
			pageTitle: "[No Page Title]",
			pageTitleIcon: "certificate",
			breadcrumbData: [{
				text:"Home", href:"#", active:false
			}, {
				text:"Dashboard", href:"#dashboard", active:true
			}]
	};
	
	var setPageTitle = function(pageTitle) {
		data.pageTitle = pageTitle;
	};
	
	var setPageTitleIcon = function(pageTitleIcon) {
		data.pageTitleIcon = pageTitleIcon;
	};
	
	var setBreadcrumbData = function(breadcrumbData) {
		data.breadcrumbData = breadcrumbData;
	};
	
	return {
		DEFAULT_BREADCRUMB: DEFAULT_BREADCRUMB,
		setPageTitle: setPageTitle,
		setPageTitleIcon: setPageTitleIcon,
		setBreadcrumbData: setBreadcrumbData,
		pageData: data
	};
});

