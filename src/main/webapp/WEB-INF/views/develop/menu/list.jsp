<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row-fluid">
	<div class="span12">
	
		<!-- BEGIN BLANK PAGE PORTLET-->
       	<div class="widget yellow">
           	<div class="widget-title">
               	<h4><i class="icon-tasks"></i> Menus</h4>
				<span class="tools">
					<div class="btn-group pull-right">
						<a href="#menus/new">
							<button id="editable-sample_new"
								title="Add New Menu" class="btn-green">
								<i class="icon-plus"></i> Add Menu
							</button>
						</a>
					</div>
				</span>
			</div>
            <div class="widget-body">

				<table data-datatable="" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th style="text-align:center;">ID</th>
							<th>Name</th>
							<th>Description</th>
							<th>Package</th>
							<th>Allowed Roles</th>
							<th style="text-align:center; width:20%">Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${menus}" var="menu">					
							<tr>
								<td style="text-align:center">${ menu.id }</td>
								<td>${ menu.name }</td>
								<td>${ menu.description }</td>
								<td>
									<c:choose>
               							<c:when test="${empty menu.getPackage()}">
               								None
               							</c:when>
               							<c:otherwise>
               								${ menu.getPackage().name }
               							</c:otherwise>
               						</c:choose>
								</td>
								<td>${ menu.roleNames }</td>
								<td style="text-align:center">
									<a class="btn btn-default" href="#menus/view/${menu.id}" title="View Menu">
										<span class="icon-eye-open"></span> View
									</a>
									<a class="btn btn-primary" href="#menus/copy/${menu.id}" title="Copy Menu">
										<span class="icon-copy"></span> Copy
									</a>
									<a class="btn btn-primary" href="#menus/edit/${menu.id}" title="Edit Menu">
										<span class="icon-edit"></span> Edit
									</a>
									<button class="btn btn-danger" data-ng-click="deleteMenu(${menu.id})" title="Delete Menu">
										<span class="icon-trash"></span> Delete
									</button>
								</td>
							</tr>
						</c:forEach>							
					</tbody>
				</table>

			</div>
		</div>
		<!-- END BLANK PAGE PORTLET-->
			
	</div>
	<!--  /.span12 -->
</div>
<!-- /.row-fluid -->