<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row-fluid">
	<div class="span12">
	
		<div class="widget yellow">
           	<div class="widget-title">
               	<h4><i class="icon-random"></i> Workflows</h4>
               	<span class="tools">
               		<div class="btn-group pull-right">
						<button id="editable-sample_new" data-ng-click="addNewWorkflow()" title="Add New Workflow" class="btn-green">
						<i class="icon-plus"></i> 
						Add Workflow
						</button>	
					</div>
				</span>
			</div>
            <div class="widget-body">
				
					<table data-datatable="" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th style="text-align:center; width:10%">ID</th>
								<th style="width:20%;">Name</th>
								<th style="width:40%;">Description</th>
								<th style="text-align:center; width:30%">Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${workflows}" var="workflow">
								<tr>
									<td style="text-align:center">${workflow.id}</td>
									<td>${workflow.name}</td>
									<td>${workflow.description}</td>
									<td style="text-align:center">
										<spring:url value="/workflows/${workflow.id}/delete" var="deleteUrl" />
										
										<button class="btn btn-default" data-ng-click="showDetails()">
											<span class="icon-eye-open"></span> View
										</button>
										
										<button class="btn btn-danger" onclick="$('#deleteForm${workflow.id}').submit();">
											 <span class="icon-trash"></span> Delete
										</button>
										
										<form style="visibility: hidden" id="deleteForm${workflow.id}" method="post" action="${deleteUrl}" 
											onsubmit="return confirm('Are you sure you want to permanently delete the ${workflow.name} workflow?');">
                        					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        				</form>
										
									</td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
					
				</div>
			</div>
		</div>
	</div>

<!-- /.row -->