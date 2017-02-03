<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row-fluid">
	<div class="span12">
	
		<!-- BEGIN BLANK PAGE PORTLET-->
       	<div class="widget yellow">
           	<div class="widget-title">
               	<h4>
               		<i class="icon-tasks"></i>
               		<c:choose>
               			<c:when test="${empty menu.name}">
               				New Menu
               			</c:when>
               			<c:otherwise>
               				<c:out value="${menu.name}" />
               			</c:otherwise>
               		</c:choose>
               	</h4>
               	
               	<span class="tools">
					<a data-ng-click="cancelEdit('menus')" class="icon-remove" title="Cancel"></a>
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
                                    <c:out value="${ menu.id }" />
                                </div>
                            </div>
							</c:if>
							<c:if test="${ !readOnly }">
								<input type="hidden" data-ng-model="menu.id" data-ng-init="menu.id = ${ menu.id }" />
							</c:if>

  							<div class="control-group">
                            	<label class="control-label">Name</label>
                                <div class="controls">
                                	<c:if test="${ readOnly }">
                                		<c:out value="${ menu.name }" />
                                	</c:if>
                                    <c:if test="${ !readOnly }">
                                		<input type="text" placeholder="Name" class="input-xxlarge" data-ng-model="menu.name" data-ng-init="menu.name = '${ menu.name }'" maxlength="256" />
                                	</c:if>
                                </div>
                            </div>
							
							<div class="control-group">
								<label class="control-label">Description</label>
								<div class="controls">
									<c:if test="${ readOnly }">
										<c:out value="${ menu.description }" />
									</c:if>
									<c:if test="${ !readOnly }">
										<textarea rows="3" data-ng-model="menu.description" data-ng-init="menu.description = '${ menu.description }'" class="input-xxlarge" placeholder="Description"></textarea>
									</c:if>
								</div>
							</div>
							
							<c:if test="${ readOnly }">
								<button class="btn btn-default mtop10" data-ng-click="cancelEdit('menus')">
									<i class="icon-ok"></i> OK
								</button>
							</c:if>
							<c:if test="${ !readOnly }">
								<button class="btn btn-success mtop10" data-ng-click="saveMenu()">
									<i class="icon-ok"></i> Save
								</button>
								
								<button class="btn btn-danger mtop10" data-ng-click="cancelEdit('menus')">
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