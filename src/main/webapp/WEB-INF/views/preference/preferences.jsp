<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- BEGIN BLANK PAGE PORTLET-->
<div class="widget profile">
	<div>

				<div class="widget-body" id="preferenceForm">
						<form role="form" id="preferenceSetter">
							<div class="form-group">
								<label>Background Color</label> <select
									data-ng-model="preference.backgroundColor"
									data-ng-init="preference.backgroundColor = ('${preferences.backgroundColor}' || '1')">
									<option value="1">White</option>
									<option value="0">Black</option>
									<option value="2">Blue</option>
									<option value="3">Yellow</option>
									<option value="4">Red</option>
									<option value="5">Green</option>
									<option value="6">Purple</option>
									<option value="7">Orange</option>
									<option value="8">Grey</option>
									<option value="9">Gold</option>

								</select>
							</div>

							<div class="form-group">
								<label>Font Color</label> <select
									data-ng-model="preference.fontColor"
									data-ng-init="preference.fontColor = ('${preferences.fontColor}' || '0')">
									<option value="0">Black</option>
									<option value="1">White</option>
									<option value="2">Blue</option>
									<option value="3">Yellow</option>
									<option value="4">Red</option>
									<option value="5">Green</option>
									<option value="6">Purple</option>
									<option value="7">Orange</option>
									<option value="8">Grey</option>
									<option value="9">Gold</option>

								</select>
							</div>

							<div class="form-group">
								<label>Font Size</label> <select
									data-ng-model="preference.fontSize"
									data-ng-init="preference.fontSize = ('${preferences.fontSize}' || '14')">
									<option value="12">Small</option>
									<option value="14">Medium</option>
									<option value="22">Large</option>
									<option value="30">Extra Large</option>
								</select>
							</div>

							<div class="form-group">
								<label>Font Family</label> <select
									data-ng-model="preference.fontFamily"
									data-ng-init="preference.fontFamily = ('${preferences.fontFamily}' || '0')">
									<option value="0">Helvetica Neue</option>
									<option value="1">Times New Roman</option>
									<option value="2">Georgia</option>
									<option value="3">Arial</option>
									<option value="4">Arial Black</option>
									<option value="5">Comic Sans MS</option>
									<option value="6">Impact</option>
									<option value="7">Verdana</option>
									<option value="8">Courier New</option>
									<option value="9">Lucida Console</option>

								</select>
							</div>
							
							<div class="form-group">
								<label>
									<input type="checkbox" 
									data-ng-model="preference.compliance508" 
									data-ng-checked="${preferences.compliance508}"
									data-ng-value="true">
								508 Compliance
								</label>
							</div>


							<div class="space15"></div>
							<div class="form-group">
								<button class="btn btn-success"
									data-ng-click="saveNewPreference(${pageContext.request.userPrincipal.name})">
									<i class="icon-save"></i> Save Preferences
								</button>

								<button class="btn btn-danger" data-ng-click="setterReset()"><i class="icon-reply"></i> Reset
								</button>

							</div>

						</form>

					</div>
				</div>
			</div>



<!-- END BLANK PAGE PORTLET-->