<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row-fluid">
	<div class="span12">
	
		<!-- BEGIN BLANK PAGE PORTLET-->
       	<div class="widget yellow">
           	<div class="widget-title">
               	<h4><i class="icon-gift"></i> Packages</h4>
				<span class="tools">
					<div class="btn-group pull-right">
						<a href="#newPackage">
							<button id="editable-sample_new"
								title="Add New Package" class="btn-green">
								<i class="icon-plus"></i> Add Package
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
							<th style="width:20%;">Name</th>
							<th style="width:40%;">Description</th>
							<th style="text-align:center; width:30%">Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${packages}" var="_package">
							<tr>
								<td style="text-align:center">${_package.id}</td>
								<td>${_package.name}</td>
								<td>${_package.description}</td>
								<td style="text-align:center">
									<a class="btn btn-default packageLink" href="#packages/view/${_package.id}" title="View Package">
										<span class="icon-eye-open"></span> View
									</a>
									<a class="btn btn-primary packageLink" href="#packages/copy/${_package.id}" title="Copy Package">
										<span class="icon-copy"></span> Copy
									</a>
									<a class="btn btn-primary packageLink" href="#packages/edit/${_package.id}" title="Edit Package">
										<span class="icon-edit"></span> Edit
									</a>
									<button class="btn btn-danger packageButton" data-ng-click="deletePackage(${_package.id})" title="Delete Package">
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