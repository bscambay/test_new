<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



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

									<select id="box1View" multiple="multiple"
									style="height: 300px; width: 75%">
										<c:forEach items="${accounts}" var="account">
											<option value="${account.pin}, ${ account.name}">${account.pin},
												${account.name}</option>
										</c:forEach>
									</select> 
									<br> 
									
									<select id="box1Storage" style="display: none;"></select>
								</td>
								
								<td style="width: 21%; vertical-align: middle">
									 
									<button id="to2" class="btn" type="button">&nbsp;&nbsp;&gt;&nbsp;&nbsp;</button><br>

									<button id="allTo2" class="btn" type="button">&nbsp;&gt;&gt;&nbsp;</button><br>

									<button id="allTo1" class="btn" type="button">&nbsp;&lt;&lt;&nbsp;</button><br>

									<button id="to1" class="btn" type="button">&nbsp;&nbsp;&lt;&nbsp;&nbsp;</button>
								
								</td>
								
								<td style="width: 35%">
									
									<select id="box2View" multiple="multiple"
										style="height: 300px; width: 75%;"></select>
									
									<br> 
									 
									<select	id="box2Storage" style="display: none;">

								</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="mtop20">
					<input ng-click="doneClick()" value="Done" class="btn">
				</div>
			</form>
		</div>
	</div>
</div>

<!-- /.row -->