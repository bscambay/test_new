/**
 * Controller for the preferences dialogs
 */

app.config(function($routeProvider) {
	$routeProvider.when('/preferences', {
    	templateUrl: "preferences",
    	controller: "preferenceController",
    	activetab: 'preferences'
	});
});



app.controller('preferenceController', preference)

preference.$inject=['$scope', '$http', '$location', '$route', '$templateCache', 'pageService', 'csrfService']

	
function preference($scope, $http, $location, $route, $templateCache, pageService, csrfService) {
	
	pageService.setPageTitle("My Settings");
	pageService.setPageTitleIcon("cog");
	pageService.setBreadcrumbData([{
		text:"Home", href:"#", active:false
	}, {
		text:"My Settings", href:"#preferences", active:true
	}]
);
	
	/* Handles the Save button click */
	$scope.saveNewPreference = function(idIn) {
		
		while (idIn.toString().length < 6) {
			idIn = "0" + idIn;
		}
		$scope.preference.accountPin = idIn;
		
		$http.post('preferences/saveNew', $scope.preference, csrfService.getHeader())
			.then(function(response) {
				$location.path('/preferences');
				$templateCache.remove('preferences');
				$route.reload();
			}, function (response) {
				alert(response.statusText);
			});
	};
	
	/* Handles the Cancel button click */
	$scope.cancelNewPreference = function() {
		preferenceForm.style.display = 'none';
	};
	
	/* Model for the preference */
	$scope.preference = {
			preferenceId: null,
			accountPin: null,
			backgroundColor: null,
			fontColor: null,
			fontSize: null,
			fontFamily: null,
			compliance508: false,
			themeColor: null
	};
	
	/* Handles the Add New preference button click*/
	$scope.addNewPreference = function() {
		preferenceForm.style.display = 'block';
/*		$location.path('/preference');   */
	};
	
	/* Accepts a color and sets style. These first two functions require explicit arguments. 
	 * Currently these methods will only change the styling on a limited part of the page, the 'preftable', but
	 * can be extended for further styling options.
	 * */
	$scope.applyFontStyle = function(colorIn) {
		fontColor = $scope.findColor(colorIn);
		sectionYouWantStyled = document.getElementById("preftable");
		sectionYouWantStyled.style.color=fontColor;
	}
	
	$scope.applyBackgroundStyle = function(colorIn) {
		backgroundColor = $scope.findColor(colorIn);
		sectionYouWantStyled = document.getElementById("preftable");
		sectionYouWantStyled.style.backgroundColor=backgroundColor;
	}
	
	$scope.applyFontSize = function(sizeIn) {
		fontSize = sizeIn + "px";
		sectionYouWantStyled = document.getElementById("preftable");
		sectionYouWantStyled.style.fontSize=fontSize;
	}
	
	$scope.applyFontFamily = function(familyIn) {
		fontFamily = $scope.findFamily(familyIn)
		sectionYouWantStyled = document.getElementById("preftable");
		sectionYouWantStyled.style.fontFamily=fontFamily;
	}
	
	/* These two functions do the same but take no explicit arguments */
	$scope.applyFontStyleNow = function() {
		fontColor = $scope.findColor($scope.preference.fontColor);
		prefTableIn = document.getElementById("preferenceSetter");
		prefTableIn.style.color=fontColor;
	}
	
	$scope.applyBackgroundStyleNow = function() {
		backgroundColor = $scope.findColor($scope.preference.backgroundColor);
		prefTableIn = document.getElementById("preferenceSetter");
		prefTableIn.style.backgroundColor=backgroundColor;
	}
	
	$scope.applyFontSizeNow = function() {
		fontSize = $scope.preference.fontSize + "px";
		sectionYouWantStyled = document.getElementById("preferenceSetter");
		sectionYouWantStyled.style.fontSize=fontSize;
	}
	
	$scope.applyFontFamilyNow = function() {
		fontFamily = $scope.findFamily($scope.preference.fontFamily)
		sectionYouWantStyled = document.getElementById("preferenceSetter");
		sectionYouWantStyled.style.fontFamily=fontFamily;
	}
	
	$scope.setterReset = function() {
		preferenceSetter = document.getElementById("preferenceSetter");
		preferenceSetter.style.color = 'black';
		preferenceSetter.style.backgroundColor = 'white';
		preferenceSetter.style.fontSize = '14px';
		preferenceSetter.style.fontFamily = 'Helvetica Neue,Helvetica,Arial,sans-serif';
	}
	
	
	
	/* These functions apply settings to entire web page */
	$scope.applyFontStyleGlobally = function(colorIn) {
		fontColor = $scope.findColor(colorIn);
		sectionYouWantStyled = document.getElementById("wrapper");
		sectionYouWantStyled.style.color=fontColor;
		sectionYouWantStyled = document.getElementById("page-wrapper");
		sectionYouWantStyled.style.color=fontColor;
		sectionYouWantStyled = document.getElementById("preftable");
		sectionYouWantStyled.style.color=fontColor;
	}
	
	$scope.applyBackgroundStyleGlobally = function(colorIn) {
		backgroundColor = $scope.findColor(colorIn);
		sectionYouWantStyled = document.getElementById("wrapper");
		sectionYouWantStyled.style.backgroundColor=backgroundColor;
		sectionYouWantStyled = document.getElementById("page-wrapper");
		sectionYouWantStyled.style.backgroundColor=backgroundColor;
		sectionYouWantStyled = document.getElementById("preftable");
		sectionYouWantStyled.style.backgroundColor=backgroundColor;
	}
	
	$scope.applyFontSizeGlobally = function(sizeIn) {
		fontSize = sizeIn + "px";
		sectionYouWantStyled = document.getElementById("wrapper");
		sectionYouWantStyled.style.fontSize=fontSize;
		sectionYouWantStyled = document.getElementById("page-wrapper");
		sectionYouWantStyled.style.fontSize=fontSize;
		sectionYouWantStyled = document.getElementById("preftable");
		sectionYouWantStyled.style.fontSize=fontSize;
	}
	
	$scope.applyFontFamilyGlobally = function(familyIn) {
		fontFamily = $scope.findFamily(familyIn)
		sectionYouWantStyled = document.getElementById("wrapper");
		sectionYouWantStyled.style.fontFamily=fontFamily;
		sectionYouWantStyled = document.getElementById("page-wrapper");
		sectionYouWantStyled.style.fontFamily=fontFamily;
		sectionYouWantStyled = document.getElementById("preftable");
		sectionYouWantStyled.style.fontFamily=fontFamily;
	}
	
	

	
	/* Currently colors and fonts are stored in the Database as numbers, referencing IDs on their respective tables.
	 * This method translates those numbers into names but can be deleted if we choose
	 * to structure our database differently in the future
	 */
	
	$scope.findColor = function(colorIn) {	
		if (colorIn == 0) {
			return "Black";
		} else if (colorIn == 1) {
			return "White";
		} else if (colorIn == 2) {
			return "Blue";
		} else if (colorIn == 3) {
			return "Yellow";
		} else if (colorIn == 4) {
			return "Red";
		} else if (colorIn == 5) {
			return "Green";
		} else if (colorIn == 6) {
			return "Purple";
		} else if (colorIn == 7) {
			return "Orange";
		} else if (colorIn == 8) {
			return "Grey";
		} else if (colorIn == 9) {
			return "Gold";
		}
	}
	
	$scope.findFamily = function(familyIn) {	
		if (familyIn == 0) {
			return "Helvetica Neue,Helvetica,Arial,sans-serif";
		} else if (familyIn == 1) {
			return "Times New Roman";
		} else if (familyIn == 2) {
			return "Georgia";
		} else if (familyIn == 3) {
			return "Arial";
		} else if (familyIn == 4) {
			return "Arial Black";
		} else if (familyIn == 5) {
			return "Comic Sans MS";
		} else if (familyIn == 6) {
			return "Impact";
		} else if (familyIn == 7) {
			return "Verdana";
		} else if (familyIn == 8) {
			return "Courier New";
		} else if (familyIn == 9) {
			return "Lucida Console";
		}
	}
	
	
};
				
				
				