<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row-fluid">
	<div class="span12">
	
		<!-- BEGIN BLANK PAGE PORTLET-->
       	<div class="widget yellow">
           	<div class="widget-title">
               	<h4><i class="icon-reorder"></i> Reference Types</h4>
				<span class="tools">
					<div class="btn-group pull-right">
						<a href="#referenceTypes/new">
							<button id="editable-sample_new"
								title="Add New Reference Type" class="btn-green">
								<i class="icon-plus"></i> Add Reference Type
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
							<th>Values</th>
							<th style="text-align:center; width:30%">Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${refTypes}" var="refType">
							<tr>
								<td style="text-align:center">${refType.id}</td>
								<td>${refType.name}</td>
								<td>${refType.valuesAsString}</td>
								<td style="text-align:center">
									<a class="btn btn-default" href="#referenceTypes/view/${refType.id}" title="View Reference Type">
										<span class="icon-eye-open"></span> View
									</a>
									<a class="btn btn-primary" href="#referenceTypes/edit/${refType.id}" title="Edit Reference Type">
										<span class="icon-edit"></span> Edit
									</a>
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