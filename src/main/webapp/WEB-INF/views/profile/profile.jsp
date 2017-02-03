<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- BEGIN BLANK PAGE PORTLET-->
<div class="widget">
	<div class="widget-title de-header">
		
			<h4><i class = "icon-user"></i> ${nameObj.firstName} ${nameObj.lastName}</h4>
		<span class="tools">
        	<div class="btn-group pull-right">
						<button id="editable-sample_new" data-ng-click="editProfile()" title="Edit Profile" class="btn-green">
						<i class="icon-edit"></i> 
						Edit Profile
						</button>	
			</div>
		</span> 
	</div>

	<div class="widget-body bio">

		<!-- DISPLAY CURRENT USER DATA STORED IN DATABASE -->
		<p><label>Name : </label> <span class="uppercase">${user.name}</span></p>
		<p><label>PIN : </label> ${user.pin}</p>
		<p><label>Roles</label>
		
			<c:forEach items="${user.roles}" var="role">
				&bull; ${role.name}&mdash;${role.description} <br><label></label>
			</c:forEach>
		
		</p>
		<p><label>Desk Phone : </label> ${user.deskPhone}</p>
		<p><label>Email Address : </label> ${user.emailAddress}</p>
		<p><label>Job Title : </label> ${user.jobTitle}</p>
		<p><label>Division : </label> ${user.division}</p>
		<p><label>Branch : </label> ${user.branch}</p>
		<p><label>Location : </label> ${user.physicalLocation}</p>
		
	</div>
	<div id="list-outer">
		<div  class="table profile-head">
			<ul class = "social-link-pf" id = "profile-icons">
				<li data-ng-controller="chatController"><a data-ng-click="onChatClick()"> <i class="icon-comments-alt"></i>
				</a></li>
				<li><a href="mailto:${user.emailAddress}"> <i
						class="icon-envelope-alt"></i>
				</a></li>
			</ul>
		</div>
	</div>
</div>
	
		
		
		
		
	<!-- END WIDGET BODY -->
<!-- END BLANK PAGE PORTLET -->