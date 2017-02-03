/**
 * Angular factory service: csrfService
 */

var app = angular.module("myApp");


app.factory('csrfService', function() {
	
	var getCsrfHeader = function() {
		return $("meta[name='_csrf_header']").attr('content');
	};
	
	var getCsrfToken = function() {
		return $("meta[name='_csrf']").attr('content');
	};
	
	return {
		getHeader: function() {
			var hdr = {};
			hdr[getCsrfHeader()] = getCsrfToken();
			return {
				headers: hdr
			};
		},
		getCsrfHeader: getCsrfHeader,
		getCsrfToken: getCsrfToken
	};
});
