<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- BEGIN BLANK PAGE PORTLET-->
<div class="widget profile">
	<div class="widget-title de-header">
		<h4>
			<i class="icon-edit"></i> Edit Profile
		</h4>
		
		<span class="tools">
					<a href="#profile" class="icon-remove" title="Cancel"></a>
		</span> 
		
	</div>
	<div class="widget-body">
		<!-- FORM TO UPDATE APPLICABLE USER PROFILE DATA -->
		<!-- bind the form to the controller object via modelAttribute -->
		<spring:url value="profile" var="editProfileUrl" />
		<form:form class="form-horizontal" method="post" modelAttribute="profileForm"
			action="${editProfileUrl}">

			<!-- bind to signupForm.firstName -->
			<spring:bind path="firstName">
				<div class="control-group">
					<label class="control-label" for="firstName">First Name</label>
					<div class="controls">
						<form:input path="firstName" type="text" class="span6"
							id="firstName" value="${nameObj.firstName}" />
					</div>
				</div>
			</spring:bind>

			<!-- bind to signupForm.middleName -->
			<spring:bind path="middleName">
				<div class="control-group">
					<label class="control-label" for="middleName">Middle Name</label>
					<div class="controls">
						<form:input path="middleName" type="text" class="span6"
							id="middleName" placeholder="optional"
							value="${nameObj.middleName}" />
					</div>
				</div>
			</spring:bind>

			<!-- bind to signupForm.lastName -->
			<spring:bind path="lastName">
				<div class="control-group">
					<label class="control-label" for="lastName">Last Name</label>
					<div class="controls">
						<form:input path="lastName" type="text" class="span6"
							id="lastName" value="${nameObj.lastName}" />
					</div>
				</div>
			</spring:bind>

			<!-- CANNOT BE CHANGED BY USER -->
			<div class="control-group">
				<label class="control-label" for="pin">Pin</label>
				<div class="controls">
					<input type="text" class="span6" id="pin" value="${user.pin}" disabled>
				</div>
			</div>

			<!-- CANNOT BE CHANGED BY USER -->
			<div class="control-group">
				<label class="control-label" for="roles">Roles</label>
				<div class="controls">
					<select class="span6" multiple="multiple" data-placeholder="Your Roles" tabindex="1" id="roles" disabled>
						<c:forEach items="${user.roles}" var="role">
							<option value="${role.name}">${role.name} &mdash; ${role.description}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<!-- bind to signupForm.deskphone -->
			<spring:bind path="deskPhone">
				<div class="control-group">
					<label class="control-label" for="deskPhone">Desk Phone Number</label>
					<div class="controls">
						<form:input path="deskPhone" type="tel" class="span6"
							id="deskPhone" placeholder="123-456-7899"
							value="${user.deskPhone}" />
					</div>
				</div>
			</spring:bind>


			<!-- bind to signupForm.emailAddress -->
			<spring:bind path="emailAddress">
				<div class="control-group">
					<label class="control-label" for="emailAddress">Email Address</label>
					<div class="controls">
						<form:input path="emailAddress" type="text" class="span6"
							id="emailAddress" placeholder="john.smith" value="${shortEmail}"
							aria-describedby="email" />
						<span class="input-group-addon" id="email">@ssa.gov</span>
					</div>
				</div>
			</spring:bind>

			<!-- bind to signupForm.jobTitle -->
			<spring:bind path="jobTitle">
				<div class="control-group">
					<label class="control-label" for="jobTitle">Job Title</label>
					<div class="controls">
						<form:input path="jobTitle" type="text" class="span6"
							id="jobTitle" placeholder="IT Specialist"
							value="${user.jobTitle}" />
					</div>
				</div>
			</spring:bind>

			<!-- bind to signupForm.division -->
			<spring:bind path="division">
				<div class="control-group">
					<label class="control-label" for="division">Division</label>
					<div class="controls">
						<form:input path="division" type="text" class="span6"
							id="division" placeholder="DDHIMA" value="${user.division}" />
					</div>
				</div>
			</spring:bind>

			<!-- bind to signupForm.branch -->
			<spring:bind path="branch">
				<div class="control-group">
					<label class="control-label" for="branch">Branch</label>
					<div class="controls">
						<form:input path="branch" type="text" class="span6"
							id="branch" placeholder="DMB" value="${user.branch}" />
					</div>
				</div>
			</spring:bind>

			<!-- bind to signupForm.physcialLocation -->
			<spring:bind path="physicalLocation">
				<div class="control-group">
					<label class="control-label" for="location">Physical Location</label>
					<div class="controls">
						<form:input path="physicalLocation" type="text"
							class="span6" id="location" placeholder="1-A-23-B RMB"
							value="${user.physicalLocation}" />
					</div>
				</div>
			</spring:bind>

			<div class="form-actions">
				<button type="submit" class="btn btn-success mtop10"><i class="icon-ok"></i> Save</button>
				<a href="#profile">
				<button class="btn btn-danger mtop10"><i class="icon-remove"></i> Cancel</button>
				</a>
			</div>
		</form:form>
		<!-- END FORM -->
	</div>
	<!-- END WIDGET BODY -->  	
</div>
<!-- END BLANK PAGE PORTLET -->