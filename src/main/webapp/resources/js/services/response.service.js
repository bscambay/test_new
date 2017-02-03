/**
 * Angular factory service: responseService
 */

var app = angular.module("myApp");


app.factory('responseService', function() {
	
	var errorResponse = function(response) {
		if (response && response.data && response.data.result == "success")
		{
			return false;
		}
		else
		{
			if (response && response.data)
			{
				alert("There was an error " + response.data.action + ": " + response.data.result);
			}
			else
			{
				alert("There was an error with a background call - no response was received from the server");
			}
			
			return true;
		}
	};
	
	return {
		errorResponse: errorResponse
	};
});
