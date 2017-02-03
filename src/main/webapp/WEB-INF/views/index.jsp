<%@ page language="java" import="javax.servlet.jsp.PageContext"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@page session="true"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

<title>Gold</title>

<link href="resources/metrolab/assets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="resources/metrolab/assets/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" />
<link
	href="resources/metrolab/assets/bootstrap/css/bootstrap-fileupload.css"
	rel="stylesheet" />
<link href="resources/metrolab/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="resources/metrolab/css/style.css" rel="stylesheet" />
<link href="resources/metrolab/css/style-responsive.css"
	rel="stylesheet" />
<link href="resources/metrolab/css/style-${themeColor}.css" rel="stylesheet"
	id="style_color" />
<!-- Datatables CSS -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<!-- CSS overrides for Gold -->
<link href="resources/css/gold.css" rel="stylesheet" />

<link rel='shortcut icon' href='resources/images/gold.png' />

</head>

<body class="fixed-top" data-ng-app="myApp"
	data-ng-controller="goldController" id="global">

	<!-- BEGIN HEADER -->
	<div id="header" class="navbar navbar-inverse navbar-fixed-top">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="navbar-inner">
			<div class="container-fluid">
				<!--BEGIN SIDEBAR TOGGLE-->
				<div class="sidebar-toggle-box hidden-phone">
					<div class="icon-reorder tooltips" data-placement="right"
						data-original-title="Toggle Navigation"></div>
				</div>
				<!--END SIDEBAR TOGGLE-->

				<!-- BEGIN LOGO -->
				<a class="brand" href="./"> <img src="resources/images/gold.png"
					alt="Gold" /> Gold
				</a>
				<!-- END LOGO -->

				<!-- BEGIN RESPONSIVE MENU TOGGLER -->
				<a class="btn btn-navbar collapsed" id="main_menu_trigger"
					data-toggle="collapse" data-target=".nav-collapse"> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="arrow"></span>
				</a>
				<!-- END RESPONSIVE MENU TOGGLER -->
				<div id="top_menu" class="nav notify-row">
					<!-- BEGIN NOTIFICATION -->
					<ul class="nav top-menu">
						<!-- BEGIN SETTINGS -->
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown"> <i class="icon-tasks"></i> <span
								class="badge badge-important">6</span>
						</a>
							<ul class="dropdown-menu extended tasks-bar">
								<li>
									<p>You have 6 pending tasks</p>
								</li>
								<li><a href="#">
										<div class="task-info">
											<div class="desc">Dashboard v1.3</div>
											<div class="percent">44%</div>
										</div>
										<div class="progress progress-striped active no-margin-bot">
											<div class="bar" style="width: 44%;"></div>
										</div>
								</a></li>
								<li><a href="#">
										<div class="task-info">
											<div class="desc">Database Update</div>
											<div class="percent">65%</div>
										</div>
										<div
											class="progress progress-striped progress-success active no-margin-bot">
											<div class="bar" style="width: 65%;"></div>
										</div>
								</a></li>
								<li><a href="#">
										<div class="task-info">
											<div class="desc">Iphone Development</div>
											<div class="percent">87%</div>
										</div>
										<div
											class="progress progress-striped progress-info active no-margin-bot">
											<div class="bar" style="width: 87%;"></div>
										</div>
								</a></li>
								<li><a href="#">
										<div class="task-info">
											<div class="desc">Mobile App</div>
											<div class="percent">33%</div>
										</div>
										<div
											class="progress progress-striped progress-warning active no-margin-bot">
											<div class="bar" style="width: 33%;"></div>
										</div>
								</a></li>
								<li><a href="#">
										<div class="task-info">
											<div class="desc">Dashboard v1.3</div>
											<div class="percent">90%</div>
										</div>
										<div
											class="progress progress-striped progress-danger active no-margin-bot">
											<div class="bar" style="width: 90%;"></div>
										</div>
								</a></li>
								<li class="external"><a href="#">See All Tasks</a></li>
							</ul></li>
						<!-- END SETTINGS -->
						<!-- BEGIN INBOX DROPDOWN -->
						<li class="dropdown" id="header_inbox_bar"><a
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="icon-envelope-alt"></i> <span
								class="badge badge-important">5</span>
						</a>
							<ul class="dropdown-menu extended inbox">
								<li>
									<p>You have 5 new messages</p>
								</li>
								<li><a href="#"> <span class="photo"><img
											src="./resources/metrolab/img/avatar-mini.png" alt="avatar" /></span>
										<span class="subject"> <span class="from">Jonathan
												Smith</span> <span class="time">Just now</span>
									</span> <span class="message"> Hello, this is an example msg. </span>
								</a></li>
								<li><a href="#"> <span class="photo"><img
											src="./resources/metrolab/img/avatar-mini.png" alt="avatar" /></span>
										<span class="subject"> <span class="from">Jhon
												Doe</span> <span class="time">10 mins</span>
									</span> <span class="message"> Hi, Jhon Doe Bhai how are you ?
									</span>
								</a></li>
								<li><a href="#"> <span class="photo"><img
											src="./resources/metrolab/img/avatar-mini.png" alt="avatar" /></span>
										<span class="subject"> <span class="from">Jason
												Stathum</span> <span class="time">3 hrs</span>
									</span> <span class="message"> This is an awesome dashboard. </span>
								</a></li>
								<li><a href="#"> <span class="photo"><img
											src="./resources/metrolab/img/avatar-mini.png" alt="avatar" /></span>
										<span class="subject"> <span class="from">Jondi
												Rose</span> <span class="time">Just now</span>
									</span> <span class="message"> Hello, this is metrolab </span>
								</a></li>
								<li><a href="#">See all messages</a></li>
							</ul></li>
						<!-- END INBOX DROPDOWN -->
						<!-- BEGIN NOTIFICATION DROPDOWN -->
						<li class="dropdown" id="header_notification_bar"><a
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="icon-bell-alt"></i> <span class="badge badge-warning">7</span>
						</a>
							<ul class="dropdown-menu extended notification">
								<li>
									<p>You have 7 new notifications</p>
								</li>
								<li><a href="#"> <span class="label label-important"><i
											class="icon-bolt"></i></span> Server #3 overloaded. <span
										class="small italic">34 mins</span>
								</a></li>
								<li><a href="#"> <span class="label label-warning"><i
											class="icon-bell"></i></span> Server #10 not respoding. <span
										class="small italic">1 Hours</span>
								</a></li>
								<li><a href="#"> <span class="label label-important"><i
											class="icon-bolt"></i></span> Database overloaded 24%. <span
										class="small italic">4 hrs</span>
								</a></li>
								<li><a href="#"> <span class="label label-success"><i
											class="icon-plus"></i></span> New user registered. <span
										class="small italic">Just now</span>
								</a></li>
								<li><a href="#"> <span class="label label-info"><i
											class="icon-bullhorn"></i></span> Application error. <span
										class="small italic">10 mins</span>
								</a></li>
								<li><a href="#">See all notifications</a></li>
							</ul></li>
						<!-- END NOTIFICATION DROPDOWN -->

					</ul>
				</div>
				<!-- END  NOTIFICATION -->
				<div class="top-nav ">
					<ul class="nav pull-right top-menu">
						<!-- BEGIN SUPPORT -->
						<li class="dropdown mtop5" data-ng-controller="chatController">
							<a class="dropdown-toggle element" data-placement="bottom"
							data-toggle="tooltip" data-ng-click="onChatClick()"
							data-original-title="Chat"> <i class="icon-comments-alt"></i>
						</a>
						</li>
						<li class="dropdown mtop5"><a class="dropdown-toggle element"
							data-placement="bottom" data-toggle="tooltip"
							data-original-title="Help"> <i class="icon-headphones"></i>
						</a></li>
						<!-- END SUPPORT -->
						<!-- BEGIN USER LOGIN DROPDOWN -->
						<li class="dropdown mtop5"><a class="dropdown-toggle"
							data-toggle="dropdown"> <i class="icon-user"></i>&nbsp; <span
								class="username"> ${username} <sec:authorize
										access="hasRole('admin')">
                               			(Admin Account)
                               		</sec:authorize>
                               		<sec:authorize
										access="hasRole('developer')">
                               			(Developer)
                               		</sec:authorize>
							</span> <b class="caret"></b>
						</a>
							<ul class="dropdown-menu extended logout">
								<c:url value="/" var="logoutUrl" />
								<li id="profile"><a href="#profile"><i
										class="icon-user"></i> My Profile</a></li>
								<li id="inbox">
									<a href="#inbox">
										<i class="icon-inbox"></i> My Inbox
									</a>
								</li>
								<li id="tasks">
									<a href="#tasks">
										<i class="icon-tasks"></i> My Tasks
									</a>
								</li>
								<li id="preference" class="withSeparator"><a href="#preferences"><i
										class="icon-cog"></i> My Settings</a></li>
								<li id="logout"><a href="${logoutUrl}"
									onclick="$('#logoutForm').submit();" id="logout"> <i
										class="icon-key"></i> Log Out
								</a></li>
							</ul></li>
						<!-- END USER LOGIN DROPDOWN -->


					</ul>
					<!-- END TOP NAVIGATION MENU -->
				</div>
			</div>
		</div>
		<!-- END TOP NAVIGATION BAR -->
	</div>
	<!-- END HEADER -->

	<!-- BEGIN CONTAINER -->
	<div id="container" class="row-fluid">

		<!-- BEGIN SIDEBAR -->
		<div class="sidebar-scroll">
			<div id="sidebar" class="nav-collapse collapse"
				data-ng-controller="widgetsController">

				<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
				<div class="navbar-inverse">
					<form class="navbar-search visible-phone">
						<input type="text" class="search-query" placeholder="Search" />
					</form>
				</div>
				<!-- END RESPONSIVE QUICK SEARCH FORM -->
				<!-- BEGIN SIDEBAR MENU -->
				<ul class="sidebar-menu">

					<li class="sub-menu"
						data-ng-class="{active: ['dashboard'].indexOf($route.current.activetab) != -1}">
						<a class="" href="#dashboard"> <i class="icon-dashboard"></i>
							<span>Dashboard</span>
					</a>
					</li>
					
					<!-- BEGIN MESSAGING MENU -->
					<li class="sub-menu" data-ng-class="{active: ['inbox', 'sent', 'trash'].indexOf($route.current.activeTab) != -1}">
						<a><i class="icon-envelope-alt"></i> <span>Messages</span> <span class="arrow"></span></a>
						<ul class="sub">
							<li data-ng-class="{active: $route.current.activetab === 'inbox'}">
								<a href="#inbox"><i class="icon-inbox"></i> Inbox</a>
							</li>
							<li data-ng-class="{active: $route.current.activetab === 'sent'}">
								<a href="#sent"><i class="icon-reply"></i> Sent</a>
							</li>
							<li data-ng-class="{active: $route.current.activetab === 'trash'}">
								<a href="#trash"><i class="icon-trash"></i> Trash</a>
							</li>
						</ul>
					</li>
					<!-- END MESSAGING MENU -->
					
					<!-- TASKS MENU -->
					<li class="sub-menu" data-ng-class="{active: $route.current.activetab === 'tasks'}">
						<a><i class="icon-tasks"></i> <span>Tasks</span></a>
					</li>
					<!-- /TASKS MENU -->

					<!-- BEGIN DEVELOPMENT MENU -->
					<sec:authorize access="hasRole('developer')">
					<li class="sub-menu"
						data-ng-class="{active: ['packages', 'menus', 'listWorkflows', 'referenceTypes].indexOf($route.current.activetab) != -1}">
						<a href="" class=""> <i class="icon-wrench"></i> <span>Development</span>
							<span class="arrow"></span>
					</a>
						<ul class="sub">
							<li data-ng-class="{active: $route.current.activetab == 'packages'}">
								<a href="#packages"><i class="icon-gift"> </i> Packages </a>
							</li>
							<li data-ng-class="{active: $route.current.activetab == 'menus'}">
								<a href="#menus"><i class="icon-tasks"> </i> Menus </a>
							</li>
							<li><a><i class="icon-leaf"></i> Forms</a></li>
							<li><a><i class="icon-bolt"></i> Actions</a></li>
							<li><a><i class="icon-subscript"></i> Functions</a></li>
							<li data-ng-class="{active: $route.current.activetab == 'listWorkflows'}">
								<a href="#workflows" class=""><i class="icon-random"></i> <span>Workflows</span></a>
							</li>
							<li><a><i class="icon-quote-right"></i> Business Rules</a></li>
							<li><a><i class="icon-gear"></i> Data Sources</a></li>
							<li><a><i class="icon-code"></i> Schema</a></li>
							<li><a><i class="icon-puzzle-piece"></i> Web Services</a></li>
							<li data-ng-class="{active: $route.current.activetab == 'referenceTypes'}">
								<a href="#referenceTypes"><i class="icon-reorder"> </i> Reference Types</a>
							</li>
						</ul>
					</li>
					</sec:authorize>
					<!-- END DEVELOPMENT MENU -->

					<!-- BEGIN ADMIN MENU -->
					<sec:authorize access="hasRole('admin')">
					<li class="sub-menu" data-ng-class="{active: ['roles', 'accounts'].indexOf($route.current.activetab) != -1}">
						<a href="" class=""> <i class="icon-cogs"></i> <span>Admin</span>
							<span class="arrow"></span>
						</a>
						<ul class="sub">
							<li data-ng-class="{active: $route.current.activetab === 'accounts'}">
								<a href="#accounts"><i class="icon-user"></i> <span>Accounts</span></a>
							</li>
							<li data-ng-class="{active: $route.current.activetab === 'roles'}">
								<a href="#roles" class=""> <i class="icon-group"></i> <span>Roles</span></a>
							</li>
						</ul>
					</li>
					</sec:authorize>
					<!--  END ADMIN MENU -->

				</ul>
				<!-- END SIDEBAR MENU -->
			</div>
		</div>
		<!-- END SIDEBAR -->

		<!-- BEGIN PAGE -->
		<div id="main-content">

			<!-- BEGIN PAGE CONTAINER-->
			<div class="container-fluid">

				<div class="row-fluid">
					<div class="span12">

						<!-- BEGIN THEME CUSTOMIZER-->
						<div id="theme-change" class="hidden-phone">
							<i class="icon-cogs"></i> <span class="settings"> <span
								class="text">Theme Color:</span> <span class="colors"> <span
									class="color-default" data-style="default"></span> <span
									class="color-green" data-style="green"></span> <span
									class="color-gray" data-style="gray"></span> <span
									class="color-purple" data-style="purple"></span> <span
									class="color-red" data-style="red"></span>
							</span>
							</span>
						</div>
						<!-- END THEME CUSTOMIZER-->

						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title">
							<i class="icon-{{pageData.pageTitleIcon}}"></i>
							{{pageData.pageTitle}}
						</h3>

						<ul class="breadcrumb">
							<li data-ng-repeat="breadcrumb in pageData.breadcrumbData"
								data-ng-class="{active: breadcrumb.active}"><a
								href="{{breadcrumb.href}}" data-ng-if="!breadcrumb.active">{{breadcrumb.text}}</a>
								<span data-ng-if="breadcrumb.active">{{breadcrumb.text}}</span>
								<span class="divider" data-ng-if="!breadcrumb.active">/</span></li>

							<li class="pull-right search-wrap">
								<form action="search_result.html" class="hidden-phone">
									<div class="input-append search-input-area">
										<input class="" id="appendedInputButton" type="search"
											placeholder="Search Gold">
										<button class="btn" type="button">
											<i class="icon-search"></i>
										</button>
									</div>
								</form>
							</li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->

					</div>
				</div>

				<!-- BEGIN PAGE CONTENT-->
				<div class="row-fluid">
					<div class="span12">

						<div class="ng-view"></div>

					</div>
				</div>
				<!-- END PAGE CONTENT-->

			</div>
		</div>
		<!-- END PAGE -->

	</div>
	<!-- END CONTAINER -->

	<!--  HIDDEN CONTENT -->

	<!-- Modal -->
	<div id="chatModal" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="chatModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
				<span class="icon-remove"></span></button>
			<h3 id="chatModalLabel">Chat</h3>
		</div>
		<div class="modal-body">
			<p>Display Skype Business integration chat window.</p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		</div>
	</div>

	<!-- Logout form -->
	<form style="visibility: hidden" id="logoutForm" method="post"
		action="logout">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>

	<!-- END HIDDEN CONTENT -->

	<!-- Gold Footer -->

	<div id="footer">
		<div class="footer-info">
			<img src="resources/images/logo-fb-share.png" />
			<div>
				&nbsp;<br/>
				<span class="header">Social Security Administration</span><br/>
				Disability Application Prototype
			</div>
		</div>
		<div class="footer-contact">
			<span class="header">Contact Information</span><br/>
			(410) 597-0508<br/>
			<a href="mailto:marina.ainbinder@ssa.gov">marina.ainbinder@ssa.gov</a>
		</div>
	</div>

	<!-- BEGIN JAVASCRIPTS -->

	<!-- Do not change this version of jquey without talking to Chris first -->
	<script src="./resources/metrolab/js/jquery-1.8.3.min.js"></script>
	<!-- See note, above -->
	
	<script src="resources/js/gold.js"></script>

	<script src="resources/metrolab/js/jquery.nicescroll.js"
		type="text/javascript"></script>
	<script src="resources/metrolab/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/metrolab/js/jquery.scrollTo.min.js"></script>
	<script
		src="resources/metrolab/assets/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- ie8 fixes -->
	<!--[if lt IE 9]>
   <script src="resources/metrolab/js/excanvas.js"></script>
   <script src="resources/metrolab/js/respond.js"></script>
   <![endif]-->
   
	<!--common script for all pages-->
	<script src="resources/metrolab/js/common-scripts.js"></script>
	<script src="resources/js/dashboard-common-scripts.js"></script>


	<!-- END JAVASCRIPTS Metrolab -->


	<!--Datatables-->
	<script
		src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>


	<!--Angular-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
		

	<!--Angular-Datatables-->
	<script
		src="./resources/angular-datatables/js/angular-datatables.factory.js"></script>
	<script
		src="./resources/angular-datatables/js/angular-datatables.instances.js"></script>
	<script
		src="./resources/angular-datatables/js/angular-datatables.options.js"></script>
	<script
		src="./resources/angular-datatables/js/angular-datatables.renderer.js"></script>
	<script
		src="./resources/angular-datatables/js/angular-datatables.util.js"></script>
	<script
		src="./resources/angular-datatables/js/angular-datatables.directive.js"></script>
	<script src="./resources/angular-datatables/js/angular-datatables.js"></script>
	

	<!--  Gold Angular Files -->
	<script src="./resources/js/app.js"></script>
	<script src="./resources/js/services/page.service.js"></script>
	<script src="./resources/js/services/response.service.js"></script>
	<script src="./resources/js/services/csrf.service.js"></script>
	<script src="./resources/js/controllers/workflow.controller.js"></script>
	<script src="./resources/js/controllers/account.controller.js"></script>
	<script src="./resources/js/controllers/role.controller.js"></script>
	<script src="./resources/js/controllers/widgets.controller.js"></script>
	<script src="./resources/js/controllers/preference.controller.js"></script>
	<script src="./resources/js/controllers/profile.controller.js"></script>
	<script src="resources/js/controllers/chat.controller.js"></script>
	<script src="resources/js/controllers/develop.controller.js"></script>
	<script src="resources/js/controllers/profile.controller.js"></script>
	<script src="resources/js/controllers/dashboard.controller.js"></script>	

</body>
</html>
