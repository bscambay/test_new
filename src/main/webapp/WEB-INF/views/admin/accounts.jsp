<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
				
<div class="row-fluid">
	<div class="span12">
	
		<div class="widget black">
           	<div class="widget-title">
               	<h4><i class="icon-user"></i> Accounts</h4>
               	<span class="tools">
               		<div class="btn-group pull-right">
						<button id="editable-sample_new" data-ng-click="addNewAccount()" title="Add New Account" class="btn">
						<i class="icon-plus"></i> Add Account</button>	
					</div>
				</span>
			</div>
            <div class="widget-body">
				
					<table data-datatable="" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>Account PIN</th>
								<th>Name</th>
								<th>Job Title</th>
								<th>E-mail Address</th>
								<th>Location</th>
								<th>Phone</th>
								<th>Roles</th>
								<th style="text-align:center; width:20%">Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${accounts}" var="account">
								<tr>
									<td>${account.pin}</td>
									<td>${account.name}</td>
									<td>${account.jobTitle}</td>
									<td>${account.emailAddress}</td>
									<td>${account.division} / ${account.branch}</td>
									<td>${account.deskPhone}</td>
									<td>${account.roleNames}</td>
									<td style="text-align:center">
										<button class="btn btn-default">
											<span class="icon-eye-open"></span> View
										</button>
										<button class="btn btn-primary">
											<span class="icon-edit"></span> Edit
										</button>
										<button class="btn btn-danger">
											<span class="icon-trash"></span> Delete
										</button>
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