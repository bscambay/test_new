<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row-fluid">
	<div class="span12">
	
		<!-- BEGIN BLANK PAGE PORTLET-->
       	<div class="widget yellow">
           	<div class="widget-title">
               	<h4>
               		<i class="icon-reorder"></i>
               		<c:choose>
               			<c:when test="${empty refType.name}">
               				New Reference Type
               			</c:when>
               			<c:otherwise>
               				<c:out value="${refType.name}" />
               			</c:otherwise>
               		</c:choose>
               	</h4>
               	
               	<span class="tools">
					<a data-ng-click="cancelEdit('referenceTypes')" class="icon-remove" title="Cancel"></a>
				</span>
               	
			</div>
            <div class="widget-body">

				<div class="row-fluid">
					<div class="span-12">
	
						<form role="form" class="form-horizontal">

							<c:if test="${ readOnly }">
								<div class="control-group">
                            	<label class="control-label">ID</label>
                                <div class="controls">
                                    <c:out value="${ refType.id }" />
                                </div>
                            </div>
							</c:if>
							<c:if test="${ !readOnly }">
								<input type="hidden" data-ng-model="refType.id" data-ng-init="refType.id = ${ refType.id }" />
							</c:if>

  							<div class="control-group">
                            	<label class="control-label">Name</label>
                                <div class="controls">
                                	<c:if test="${ readOnly }">
                                		<c:out value="${ refType.name }" />
                                	</c:if>
                                    <c:if test="${ !readOnly }">
                                		<input type="text" placeholder="Name" class="input-xxlarge" data-ng-model="refType.name" data-ng-init="refType.name = '${ refType.name }'" maxlength="256" />
                                	</c:if>
                                </div>
                            </div>
							
							<div class="widget gray">
					           	<div class="widget-title">
					               	<h4>Values</h4>
									<span class="tools">
										<div class="btn-group pull-right">
											<a href="">
												<button id="editable-sample_new"
													title="Add New Value" class="btn-green">
													<i class="icon-plus"></i> Add Value
												</button>
											</a>
										</div>
									</span>
								</div>
					            <div class="widget-body">
							
									<table data-datatable="" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th style="text-align:center; width:10%">ID</th>
												<th style="width:20%;">Text</th>
												<th>Ordinal</th>
												<th>Active Start Date</th>
												<th>Active End Date</th>
												<c:if test="${ !readOnly }">
													<th style="text-align:center; width:30%">Actions</th>
												</c:if>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${refType.values}" var="value">
												<tr>
													<td style="text-align:center">${value.id}</td>
													<td>${value.text}</td>
													<td>${value.ordinal}</td>
													<td><fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${value.activeStartDate}" /></td>
													<td><fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${value.activeEndDate}" /></td>
													<c:if test="${ !readOnly }">
														<td style="text-align:center">
														
														</td>
													</c:if>
												</tr>
											</c:forEach>
												
										</tbody>
									</table>
								</div>
							</div>
							
							<c:if test="${ readOnly }">
								<button class="btn btn-default mtop10" data-ng-click="cancelEdit('referenceTypes')">
									<i class="icon-ok"></i> OK
								</button>
							</c:if>
							<c:if test="${ !readOnly }">
								<button class="btn btn-success mtop10" data-ng-click="saveReferenceType()">
									<i class="icon-ok"></i> Save
								</button>
								
								<button class="btn btn-danger mtop10" data-ng-click="cancelEdit('referenceTypes')">
									<i class="icon-remove"></i> Cancel
								</button>
							</c:if>								

						</form>

					</div>
					<!-- /.span-12 -->
				</div>
				<!-- /.row-fluid -->

			</div>
		</div>
		<!-- END BLANK PAGE PORTLET-->
			
	</div>
	<!--  /.span12 -->
</div>
<!-- /.row-fluid -->