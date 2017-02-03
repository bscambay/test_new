/**
 * Chat Controller implements integration with Skype for Business to allow 
 * application users to chat with each other.
 */
app.controller('chatController', function($scope) {
	
	$scope.onChatClick = function() {
		$('#chatModal').modal('show');
	};
});