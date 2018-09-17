<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="../scripts/jquery-1.11.1.min.js"></script>
<script src="./resources/js/controllers/role.controller.js"></script>

<div class="row-fluid">
	<div class="span12">

		<div class="widget black">
			<div class="widget-title">
				<h4>
					<i class="icon-plus"></i> Add Account to Role
				</h4>

				<span class="tools"> <a data-ng-click="cancelAccountRole()"
					class="icon-remove" title="Cancel"></a>
				</span>

			</div>
			<form name="form1" method="post" action="#" id="form1">
				<div>
					<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
						value="/wEPDwUKMTk5MjI0ODUwOWRkJySmk0TGHOhSY+d9BU9NHeCKW6o=">
				</div>
				<div>
					<table data-datatable="" style="width: 100%;" class="">
						<tbody>
							<tr>
								<td style="width: 35%">

									<!-- <select id="box1View" multiple="multiple"
									style="height: 300px; width: 75%"> -->
										<select id="sbOne" multiple="multiple"
									style="height: 300px; width: 75%" ng-options="">
										<c:forEach items="${accounts}" var="account">
											<option value="${account.pin}, ${ account.name}">${account.pin},
												${account.name}</option>
										</c:forEach>
									</select> 
									<br> 
									
									<!-- <select id="box1Storage" style="display: none;"></select> -->
								</td>
								
								<td style="width: 21%; vertical-align: middle">
									 
									<input type="button" id="right" class="btn" ng-click="moveRightItems()"  value="> "  style="width:45px;"/><br>

									<input type="button" id="rightall" class="btn" ng-click="moveRightAllItems()" value=">>" style="width:45px;"/><br>

									<input type= "button" id="leftall"  ng-click="moveLeftAllItems()" class="btn"  value="<<" style="width:45px;"/><br>

									<input Type="button" id="left"  ng-click="moveLeftItems()" class="btn" value="<" style="width:45px;"/>
								
								</td>
								
								<td style="width: 35%">
									
								<!-- 	<select id="box2View" multiple="multiple"
										style="height: 300px; width: 75%;"></select> -->
										<!-- <label for="multipleSelect"> Multiple select: </label><br> -->										
										<select id="sbTwo" multiple="multiple" ng-model="account.model" multiple
										style="height: 300px; width: 75%;">
										< option ng-repeat="option in data.availableOptions" value="{{account.Pin}}" >{{account.name}}</option>
										
										</select>
									
									<br> 
									 <!-- <tt>multipleSelect = {{account.model}}</tt><br/>
									 <h1>You selected: {account.model}}</h1> -->
									 
									<!-- <select	id="box2Storage" style="display: none;"> -->

								</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="mtop20">
<!-- 					<input ng-click="doneClick()" value="Done" class="btn"> -->
					<input ng-click="addAccountToRole(account.model)" value="Done" class="btn">
				</div>
			</form>
		</div>
	</div>
	
	//This is the code for javascript Controller in role.Controller for mvoing listbox items
	 /*   /*Handles Moving Users / Account from List Boxes   */
       $scope.moveRightItems= function(){      
    	   $(sbOne).find(':selected').appendTo(sbTwo);
       }
       $scope.moveRightAllItems = function() {
   	    $(sbOne).children().appendTo(sbTwo);
   	}
       $scope.moveLeftItems= function(){      
    	   $(sbTwo).find(':selected').appendTo(sbOne);
       }
       $scope.moveLeftAllItems= function(){      
//    	   $(sbTwo).find(':selected').appendTo(sbOne);
    	   $(sbTwo).children().appendTo(sbOne);
       }       */
	   
	 /*   /* Handles Adding Account to Role */
	$scope.addAccountToRole = function(accountmodel){
		$http.post('roles/saveAccount/' + $routeParams.roleId, $scope._package, csrfService.getHeader())
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
}; */


<!-- /.row -->