<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--  Bootstrap is sourced in this jsp twice, once here and once at the bottom of the page. This is in addition
      to being sourced in homeSignedIn.jsp. Without being sourced in this jsp, I get errors that some functions are
      undefined. Without being sourced TWICE in this jsp, the dropdown menus at the top of the page do not work.
      This is a messy solution and I do not understand why this works, so any improvement is welcome if you
      can manage it. -Mike C -->

<script src="resources/metrolab/assets/bootstrap/js/bootstrap.min.js"></script>

<!-- BEGIN BODY -->
<body class="fixed-top">

	<!-- BEGIN PAGE -->
	<!--      <div id="main-content"> -->

	<!-- BEGIN PAGE CONTAINER-->
	<div class="container-fluid ">
		<!-- BEGIN PAGE HEADER-->
		<div class="row-fluid"></div>
		<!-- END PAGE HEADER-->


		<!-- BEGIN PAGE CONTENT-->
		<div class="row-fluid">
			<div class="span12">



				<!-- BEGIN TAB PORTLET-->
				<div class="widget widget-tabs purple disable-sorting">
					<div class="widget-title">
						<h4>
							<i class="icon-reorder"></i> Claims by Stage
						</h4>
					</div>
					<div class="widget-body">
						<div class="tabbable ">
							<ul class="nav nav-tabs">
								<li><a href="dashboard#widget_tab5" data-toggle="tab">Federal
										Court</a></li>
								<li><a href="dashboard#widget_tab4" data-toggle="tab">Appeals
										Council</a></li>
								<li><a href="dashboard#widget_tab3" data-toggle="tab">Hearing
										Office</a></li>
								<li><a href="dashboard#widget_tab2" data-toggle="tab">Reconsideration</a></li>
								<li class="active"><a href="dashboard#widget_tab1"
									data-toggle="tab">Initial</a></li>
							</ul>
							<div class="tab-content">
								<!-- *************** -->
								<!-- *************** -->
								<!--  Initial Stage  -->
								<!-- *************** -->
								<!-- *************** -->

								<!--BEGIN METRO STATES-->
								<div class="tab-pane active" id="widget_tab1">
									<div class="metro-nav">
										<div class="metro-nav-block nav-block-orange">
											<a data-original-title="" href="#"> <i class="icon-user"></i>
												<div class="info">321</div>
												<div class="status">Claims In</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-green">
											<a data-original-title="" href="#"> <i
												class="icon-thumbs-up"></i>
												<div class="info">200</div>
												<div class="status">Approvals Out</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-red">
											<a data-original-title="" href="#"> <i
												class="icon-thumbs-down"></i>
												<div class="info">25</div>
												<div class="status">Denials Out</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-orange">
											<a data-original-title="" href="#"> <i
												class="icon-briefcase"></i>
												<div class="info">96</div>
												<div class="status">Backlog</div>
											</a>
										</div>
										<div class="metro-nav-block nav-olive double">
											<a data-original-title="" href="#"> <i class="icon-time"></i>
												<div class="info">3.5 Days</div>
												<div class="status">Average Decision Time</div>
											</a>
										</div>
									</div>
									<div class="metro-nav">
										<div class="metro-nav-block nav-light-purple">
											<a data-original-title="" href="#"> <i
												class="icon-fast-forward"></i>
												<div class="info">29</div>
												<div class="status">QDDs</div>
											</a>
										</div>
										<div class="metro-nav-block nav-light-blue">
											<a data-original-title="" href="#"> <i class="icon-heart"></i>
												<div class="info">43</div>
												<div class="status">CALs</div>
											</a>
										</div>
										<div class="metro-nav-block nav-light-green">
											<a data-original-title="" href="#"> <i
												class="icon-medkit"></i>
												<div class="info">123</div>
												<div class="status">MERs</div>
											</a>
										</div>
										<div class="metro-nav-block nav-light-brown">
											<a data-original-title="" href="#"> <i
												class="icon-user-md"></i>
												<div class="info">34</div>
												<div class="status">Consultative Exams</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-grey double">
											<a data-original-title="" href="#"> <i
												class="icon-dollar"></i>
												<div class="info">$53412</div>
												<div class="status">Total Allowances</div>
											</a>
										</div>
									</div>
								</div>



								<!-- *************** -->
								<!-- *************** -->
								<!-- Reconsideration -->
								<!-- *************** -->
								<!-- *************** -->

								<!--BEGIN METRO STATES-->
								<div class="tab-pane" id="widget_tab2">
									<div class="metro-nav">
										<div class="metro-nav-block nav-block-orange">
											<a data-original-title="" href="#"> <i class="icon-user"></i>
												<div class="info">218</div>
												<div class="status">Claims In</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-green">
											<a data-original-title="" href="#"> <i
												class="icon-thumbs-up"></i>
												<div class="info">120</div>
												<div class="status">Approvals Out</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-red">
											<a data-original-title="" href="#"> <i
												class="icon-thumbs-down"></i>
												<div class="info">16</div>
												<div class="status">Denials Out</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-orange">
											<a data-original-title="" href="#"> <i
												class="icon-briefcase"></i>
												<div class="info">82</div>
												<div class="status">Backlog</div>
											</a>
										</div>
										<div class="metro-nav-block nav-olive double">
											<a data-original-title="" href="#"> <i class="icon-time"></i>
												<div class="info">5 Days</div>
												<div class="status">Average Decision Time</div>
											</a>
										</div>
									</div>
									<div class="metro-nav">
										<div class="metro-nav-block nav-light-purple">
											<a data-original-title="" href="#"> <i
												class="icon-fast-forward"></i>
												<div class="info">23</div>
												<div class="status">QDDs</div>
											</a>
										</div>
										<div class="metro-nav-block nav-light-blue">
											<a data-original-title="" href="#"> <i class="icon-heart"></i>
												<div class="info">20</div>
												<div class="status">CALs</div>
											</a>
										</div>
										<div class="metro-nav-block nav-light-green">
											<a data-original-title="" href="#"> <i
												class="icon-medkit"></i>
												<div class="info">103</div>
												<div class="status">MERs</div>
											</a>
										</div>
										<div class="metro-nav-block nav-light-brown">
											<a data-original-title="" href="#"> <i
												class="icon-user-md"></i>
												<div class="info">23</div>
												<div class="status">Consultative Exams</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-grey double">
											<a data-original-title="" href="#"> <i
												class="icon-dollar"></i>
												<div class="info">$46251</div>
												<div class="status">Total Allowances</div>
											</a>
										</div>
									</div>
								</div>

								<!-- *************** -->
								<!-- *************** -->
								<!-- Hearings Office -->
								<!-- *************** -->
								<!-- *************** -->

								<!--BEGIN METRO STATES-->
								<div class="tab-pane" id="widget_tab3">
									<div class="metro-nav">
										<div class="metro-nav-block nav-block-orange">
											<a data-original-title="" href="#"> <i class="icon-user"></i>
												<div class="info">198</div>
												<div class="status">Claims In</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-green">
											<a data-original-title="" href="#"> <i
												class="icon-thumbs-up"></i>
												<div class="info">79</div>
												<div class="status">Approvals Out</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-red">
											<a data-original-title="" href="#"> <i
												class="icon-thumbs-down"></i>
												<div class="info">10</div>
												<div class="status">Denials Out</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-orange">
											<a data-original-title="" href="#"> <i
												class="icon-briefcase"></i>
												<div class="info">109</div>
												<div class="status">Backlog</div>
											</a>
										</div>
										<div class="metro-nav-block nav-olive double">
											<a data-original-title="" href="#"> <i class="icon-time"></i>
												<div class="info">7.4 Days</div>
												<div class="status">Average Decision Time</div>
											</a>
										</div>
									</div>
									<div class="metro-nav">
										<div class="metro-nav-block nav-light-purple">
											<a data-original-title="" href="#"> <i
												class="icon-fast-forward"></i>
												<div class="info">2</div>
												<div class="status">QDDs</div>
											</a>
										</div>
										<div class="metro-nav-block nav-light-blue">
											<a data-original-title="" href="#"> <i class="icon-heart"></i>
												<div class="info">3</div>
												<div class="status">CALs</div>
											</a>
										</div>
										<div class="metro-nav-block nav-light-green">
											<a data-original-title="" href="#"> <i
												class="icon-medkit"></i>
												<div class="info">67</div>
												<div class="status">MERs</div>
											</a>
										</div>
										<div class="metro-nav-block nav-light-brown">
											<a data-original-title="" href="#"> <i
												class="icon-user-md"></i>
												<div class="info">11</div>
												<div class="status">Consultative Exams</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-grey double">
											<a data-original-title="" href="#"> <i
												class="icon-dollar"></i>
												<div class="info">$33012</div>
												<div class="status">Total Allowances</div>
											</a>
										</div>
									</div>
								</div>


								<!-- *************** -->
								<!-- *************** -->
								<!-- Appeals Council -->
								<!-- *************** -->
								<!-- *************** -->

								<!--BEGIN METRO STATES-->
								<div class="tab-pane" id="widget_tab4">
									<div class="metro-nav">
										<div class="metro-nav-block nav-block-orange">
											<a data-original-title="" href="#"> <i class="icon-user"></i>
												<div class="info">167</div>
												<div class="status">Claims In</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-green">
											<a data-original-title="" href="#"> <i
												class="icon-thumbs-up"></i>
												<div class="info">67</div>
												<div class="status">Approvals Out</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-red">
											<a data-original-title="" href="#"> <i
												class="icon-thumbs-down"></i>
												<div class="info">20</div>
												<div class="status">Denials Out</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-orange">
											<a data-original-title="" href="#"> <i
												class="icon-briefcase"></i>
												<div class="info">80</div>
												<div class="status">Backlog</div>
											</a>
										</div>
										<div class="metro-nav-block nav-olive double">
											<a data-original-title="" href="#"> <i class="icon-time"></i>
												<div class="info">8 Days</div>
												<div class="status">Average Decision Time</div>
											</a>
										</div>
									</div>
									<div class="metro-nav">
										<div class="metro-nav-block nav-light-purple">
											<a data-original-title="" href="#"> <i
												class="icon-fast-forward"></i>
												<div class="info">1</div>
												<div class="status">QDDs</div>
											</a>
										</div>
										<div class="metro-nav-block nav-light-blue">
											<a data-original-title="" href="#"> <i class="icon-heart"></i>
												<div class="info">2</div>
												<div class="status">CALs</div>
											</a>
										</div>
										<div class="metro-nav-block nav-light-green">
											<a data-original-title="" href="#"> <i
												class="icon-medkit"></i>
												<div class="info">34</div>
												<div class="status">MERs</div>
											</a>
										</div>
										<div class="metro-nav-block nav-light-brown">
											<a data-original-title="" href="#"> <i
												class="icon-user-md"></i>
												<div class="info">67</div>
												<div class="status">Consultative Exams</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-grey double">
											<a data-original-title="" href="#"> <i
												class="icon-dollar"></i>
												<div class="info">$29893</div>
												<div class="status">Total Allowances</div>
											</a>
										</div>
									</div>
								</div>

								<!-- *************** -->
								<!-- *************** -->
								<!--  Federal Court  -->
								<!-- *************** -->
								<!-- *************** -->

								<!--BEGIN METRO STATES-->
								<div class="tab-pane" id="widget_tab5">
									<div class="metro-nav">
										<div class="metro-nav-block nav-block-orange">
											<a data-original-title="" href="#"> <i class="icon-user"></i>
												<div class="info">87</div>
												<div class="status">Federal Court In</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-green">
											<a data-original-title="" href="#"> <i
												class="icon-thumbs-up"></i>
												<div class="info">45</div>
												<div class="status">Approvals Out</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-red">
											<a data-original-title="" href="#"> <i
												class="icon-thumbs-down"></i>
												<div class="info">16</div>
												<div class="status">Denials Out</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-orange">
											<a data-original-title="" href="#"> <i
												class="icon-briefcase"></i>
												<div class="info">26</div>
												<div class="status">Backlog</div>
											</a>
										</div>
										<div class="metro-nav-block nav-olive double">
											<a data-original-title="" href="#"> <i class="icon-time"></i>
												<div class="info">28 Days</div>
												<div class="status">Average Decision Time</div>
											</a>
										</div>
									</div>
									<div class="metro-nav">
										<div class="metro-nav-block nav-light-purple">
											<a data-original-title="" href="#"> <i
												class="icon-fast-forward"></i>
												<div class="info">0</div>
												<div class="status">QDDs</div>
											</a>
										</div>
										<div class="metro-nav-block nav-light-blue">
											<a data-original-title="" href="#"> <i class="icon-heart"></i>
												<div class="info">0</div>
												<div class="status">CALs</div>
											</a>
										</div>
										<div class="metro-nav-block nav-light-green">
											<a data-original-title="" href="#"> <i
												class="icon-medkit"></i>
												<div class="info">45</div>
												<div class="status">MERs</div>
											</a>
										</div>
										<div class="metro-nav-block nav-light-brown">
											<a data-original-title="" href="#"> <i
												class="icon-user-md"></i>
												<div class="info">2</div>
												<div class="status">Consultative Exams</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-grey double">
											<a data-original-title="" href="#"> <i
												class="icon-dollar"></i>
												<div class="info">$18928</div>
												<div class="status">Total Allowances</div>
											</a>
										</div>
									</div>
								</div>


							</div>


							<div class="space10"></div>
							<!--END METRO STATES-->
						</div>
					</div>
				</div>
			</div>


			<!-- END PAGE CONTENT -->

			<!--Begin map and calendar row-->

			<div class="row-fluid ui-sortable">

				<!-- Begin GoogleMap Portlet-->

				<div class="span6">
					<div class="widget orange">
						<div class="widget-title">
							<h4>
								<i class="icon-tasks"></i> Backlogs, per Field Office
							</h4>
							<span class="tools"> <a href="javascript:;"
								class="icon-chevron-down"></a> <a href="javascript:;"
								class="icon-remove"></a>
							</span>
							<!--  NOT CURRENTLY USING UPDATE BUTTON
                            <div class="update-btn">
                                <a href="javascript:;" class="btn update-easy-pie-chart"><i class="icon-repeat"></i> Update</a>
                            </div>
                            -->
						</div>
						<div class="widget-body">
							<div id="map"></div>
						</div>
					</div>
					<!--END GoogleMap Portlet-->
				</div>
				<!--Begin Calendar ----->
				<div class="span6 responsive" data-tablet="span7 fix-margin"
					data-desktop="span7">
					<!-- BEGIN CALENDAR PORTLET-->
					<div class="widget yellow">
						<div class="widget-title">
							<h4>
								<i class="icon-calendar"></i> Calendar
							</h4>
							<span class="tools"> <a href="javascript:;"
								class="icon-chevron-down"></a> <a href="javascript:;"
								class="icon-remove"></a>
							</span>
						</div>
						<div class="widget-body" style="overflow: hidden; width: auto; height: 500px;">
							<div id="calendar" class="has-toolbar"></div>
						</div>
					</div>
					<!-- --End Calendar -->
				</div>
			</div>

			<!-- BEGIN DRAGGABLE PORTLETS -->
			<div class="row-fluid ui-sortable" id="draggable">

				<div class="row-fluid ui-sortable ">
					<div class="span4">
						<!-- BEGIN CHART PORTLET-->
						<div class="widget ">
							<div class="widget-title">
								<h4>
									<i class="icon-reorder"></i> Claims by Stage
								</h4>
								<span class="tools"> <a href="javascript:;"
									class="icon-chevron-down"></a> <a href="javascript:;"
									class="icon-remove"></a>
								</span>
							</div>
							<div class="widget-body">
								<div class="text-center">
									<canvas id="doughnut" height="300" width="400"></canvas>
									<div id="doughnutLegend"></div>
								</div>
							</div>
						</div>
						<!-- END CHART PORTLET-->
					</div>
					<div class="span4">
						<!-- BEGIN CHART PORTLET-->
						<div class="widget green">
							<div class="widget-title">
								<h4>
									<i class="icon-reorder"> </i> Backlogs, past 12 months
								</h4>
								<span class="tools"> <a href="javascript:;"
									class="icon-chevron-down"></a> <a href="javascript:;"
									class="icon-remove"></a>
								</span>
							</div>
							<div class="widget-body">
								<div class="text-center">
									<canvas id="line" height="300" width="450"></canvas>
								</div>
							</div>
						</div>
						<!-- END CHART PORTLET-->
					</div>

					<!-- END TAB PORTLET-->


				</div>
				<div class="row-fluid ui-sortable">
					<div class="span4">
						<!--BEGIN GENERAL STATISTICS-->
						<div class="widget purple">
							<div class="widget-title">
								<h4>
									<i class="icon-tasks"></i> General Statistics
								</h4>
								<span class="tools"> <a href="javascript:;"
									class="icon-chevron-down"></a> <a href="javascript:;"
									class="icon-remove"></a>
								</span>
							</div>
							<div class="widget-body">
								<div class="row-fluid">
									<div class="text-center">
										<div class="sparkline">
											<div id="metro-sparkline-type1"></div>
											<div class="sparkline-tittle">Server Load</div>
										</div>
										<div class="sparkline">
											<div id="metro-sparkline-type2"></div>
											<div class="sparkline-tittle">Network Load</div>
										</div>
										<div class="sparkline">
											<div id="metro-sparkline-type3"></div>
											<div class="sparkline-tittle">Visit Load</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--END GENERAL STATISTICS-->
					</div>
					<div class="span4">
						<!-- BEGIN NOTIFICATIONS PORTLET-->
						<div class="widget blue">
							<div class="widget-title">
								<h4>
									<i class="icon-bell"></i> Notification
								</h4>
								<span class="tools"> <a href="javascript:;"
									class="icon-chevron-down"></a> <a href="javascript:;"
									class="icon-remove"></a>
								</span>
							</div>
							<div class="widget-body">
								<ul class="item-list scroller padding"
									style="overflow: hidden; width: auto; height: 320px;"
									data-always-visible="1">
									<li><span class="label label-success"><i
											class="icon-bell"></i></span> <span>Statistics updated.</span>
										<div class="pull-right">
											<span class="small italic ">Just now</span>

										</div></li>
									<li><span class="label label-success"><i
											class="icon-bell"></i></span> <span>New user registered.</span>
										<div class="pull-right">
											<span class="small italic ">15 mins ago</span>

										</div></li>
									<li><span class="label label-warning"><i
											class="icon-bullhorn"></i></span> <span>New role added.</span>
										<div class="pull-right">
											<span class="small italic ">3 hours ago</span>

										</div></li>
									<li><span class="label label-important"><i
											class=" icon-bug"></i></span> <span>Hearings Backlog
											surpassed 100.</span>
										<div class="pull-right">
											<span class="small italic ">9 mins ago</span>

										</div></li>
									<li><span class="label label-important"><i
											class=" icon-bug"></i></span> <span>Appeals Decision Time
											increased.</span>
										<div class="pull-right">
											<span class="small italic ">10 hours ago</span>

										</div></li>
									<li><span class="label label-warning"><i
											class="icon-bullhorn"></i></span> <span>Web server #12 failed
											to reload.</span>
										<div class="pull-right">
											<span class="small italic ">3 mins ago</span>

										</div></li>
									<li><span class="label label-success"><i
											class="icon-bell"></i></span> <span>Initial Stage Total
											Allowances surpassed $50,000.</span>
										<div class="pull-right">
											<span class="small italic ">40 mins ago</span>

										</div></li>
									<li><span class="label label-warning"><i
											class="icon-bullhorn"></i></span> <span>Alerting a user
											account balance.</span>
										<div class="pull-right">
											<span class="small italic ">1 hours ago</span>

										</div></li>
									<li><span class="label label-important"><i
											class=" icon-bug"></i></span> <span>Alerting administrators
											staff.</span>
										<div class="pull-right">
											<span class="small italic ">1 mins ago</span>

										</div></li>
									<li><span class="label label-important"><i
											class=" icon-bug"></i></span> <span>Messages are not sent to
											users.</span>
										<div class="pull-right">
											<span class="small italic ">11 hours ago</span>

										</div></li>
									<li><span class="label label-warning"><i
											class="icon-bullhorn"></i></span> <span>Web server #12 failed
											to reload.</span>
										<div class="pull-right">
											<span class="small italic ">1 day ago</span>

										</div></li>
									<li><span class="label label-success"><i
											class="icon-bell"></i></span> <span>New order received.</span>
										<div class="pull-right">
											<span class="small italic ">10 mins ago</span>

										</div></li>
									<li><span class="label label-warning"><i
											class="icon-bullhorn"></i></span> <span>Alerting a user
											account balance.</span>
										<div class="pull-right">
											<span class="small italic ">3 hours ago</span>

										</div></li>
									<li><span class="label label-important"><i
											class=" icon-bug"></i></span> <span>Alerting administrators
											support staff.</span>
										<div class="pull-right">
											<span class="small italic ">6 hours ago</span>

										</div></li>
									<li><span class="label label-important"><i
											class=" icon-bug"></i></span> <span>Messages are not sent to
											users.</span>
										<div class="pull-right">
											<span class="small italic ">3 days ago</span>

										</div></li>
									<li><span class="label label-warning"><i
											class="icon-bullhorn"></i></span> <span>Web server #12 failed
											to relosd.</span>
										<div class="pull-right">
											<span class="small italic ">1 day ago</span>

										</div></li>
								</ul>
								<div class="space10"></div>
								<a href="#" class="pull-right">View all notifications</a>
								<div class="clearfix no-top-space no-bottom-space"></div>
							</div>
						</div>
						<!-- END NOTIFICATIONS PORTLET-->
					</div>
					<div class="span4">
						<!-- BEGIN CHAT PORTLET-->
						<div class="widget red">
							<div class="widget-title">
								<h4>
									<i class="icon-comments-alt"></i> Chats
								</h4>
								<span class="tools"> <a href="javascript:;"
									class="icon-chevron-down"></a> <a href="javascript:;"
									class="icon-remove"></a>
								</span>
							</div>
							<div class="widget-body">
								<div class="timeline-messages">
									<!-- Comment -->
									<div class="msg-time-chat">
										<a class="message-img" href="#"><img alt=""
											src="resources/metrolab/img/avatar1.jpg" class="avatar"></a>
										<div class="message-body msg-in">
											<span class="arrow"></span>
											<div class="text">
												<p class="attribution">
													<a href="#">Jhon Doe</a> at 1:55pm, 25th January 2017
												</p>
												<p>Hi, I have a quick question.</p>
											</div>
										</div>
									</div>
									<!-- /comment -->

									<!-- Comment -->
									<div class="msg-time-chat">
										<a class="message-img" href="#"><img alt=""
											src="resources/metrolab/img/avatar2.jpg" class="avatar"></a>
										<div class="message-body msg-out">
											<span class="arrow"></span>
											<div class="text">
												<p class="attribution">
													<a href="#">Jonathan Smith</a> at 2:01pm, 25th January 2017
												</p>
												<p>Sure, how can I help?</p>
											</div>
										</div>
									</div>
									<!-- /comment -->

									<!-- Comment -->
									<div class="msg-time-chat">
										<a class="message-img" href="#"><img alt=""
											src="resources/metrolab/img/avatar1.jpg" class="avatar"></a>
										<div class="message-body msg-in">
											<span class="arrow"></span>
											<div class="text">
												<p class="attribution">
													<a href="#">Jhon Doe</a> at 2:03pm, 25th January 2017
												</p>
												<p>Did you get my recent request for MERS?</p>
											</div>
										</div>
									</div>
									<!-- /comment -->

									<!-- Comment -->
									<div class="msg-time-chat">
										<a class="message-img" href="#"><img alt=""
											src="resources/metrolab/img/avatar2.jpg" class="avatar"></a>
										<div class="message-body msg-out">
											<span class="arrow"></span>
											<div class="text">
												<p class="attribution">
													<a href="#">Jonathan Smith</a> at 2:05pm, 25th January 2017
												</p>
												<p>Yes, we've sent the preliminary findings.</p>
											</div>
										</div>
									</div>
									<!-- /comment -->
								</div>
								<div class="chat-form">
									<div class="input-cont">
										<input type="text" placeholder="Type a message here..." />
									</div>
									<div class="btn-cont">
										<a href="javascript:;" class="btn btn-primary">Send</a>
									</div>
								</div>
							</div>
						</div>
						<!-- END CHAT PORTLET-->
					</div>
				</div>
			<div class="row-fluid">
				<div class="span4">
					<!-- BEGIN PROGRESS PORTLET-->
					<div class="widget purple">
						<div class="widget-title">
							<h4>
								<i class="icon-tasks"></i> Task In progress
							</h4>
							<span class="tools"> <a href="javascript:;"
								class="icon-chevron-down"></a> <a href="javascript:;"
								class="icon-remove"></a>
							</span>
						</div>
						<div class="widget-body">
							<ul class="unstyled">
								<li><span class="btn btn-inverse"> <i
										class="icon-refresh"></i></span> Schedule CEs <strong class="label">
										48%</strong>
									<div class="space10"></div>
									<div class="progress">
										<div style="width: 48%;" class="bar"></div>
									</div></li>
								<li><span class="btn btn-inverse"> <i
										class="icon-check"></i></span> Research backlog <strong
									class="label label-success"> 85%</strong>
									<div class="space10"></div>
									<div class="progress progress-success">
										<div style="width: 85%;" class="bar"></div>
									</div></li>
								<li><span class="btn btn-inverse"> <i
										class="icon-fire"></i></span> Update Title II stats <strong
									class="label label-important"> 65%</strong>
									<div class="space10"></div>
									<div class="progress progress-danger">
										<div style="width: 65%;" class="bar"></div>
									</div></li>

							</ul>
						</div>
					</div>
				</div>
				<!-- END PROGRESS PORTLET-->
				<!-- BEGIN ALERTS PORTLET-->
				<div class="span4">
					<div class="widget orange">
						<div class="widget-title">
							<h4>
								<i class="icon-bell-alt"></i> Alerts
							</h4>
							<span class="tools"> <a class="icon-chevron-down"
								href="javascript:;"></a> <a class="icon-remove"
								href="javascript:;"></a>
							</span>
						</div>
						<div class="widget-body">
							<div class="alert">
								<button data-dismiss="alert" class="close">×</button>
								<strong>Warning!</strong> Information can not be verified.
	
							</div>
							<div class="alert alert-success">
								<button data-dismiss="alert" class="close">×</button>
								<strong>Success!</strong> You successfully read this important
								message.
							</div>
							<div class="alert alert-info">
								<button data-dismiss="alert" class="close">×</button>
								<strong>Info!</strong> Heads up! This alert needs your
								attention.
							</div>
							<div class="alert alert-error">
								<button data-dismiss="alert" class="close">×</button>
								<strong>Error!</strong> Change a few things. Please submit
								again.
							</div>
						</div>
					</div>
					<!-- END ALERTS PORTLET-->

				</div>

				<!-- END DRAGGABLE PORTLETS-->
			</div>
			</div>
		</div>
		<!-- END PAGE CONTAINER-->
	</div>

	<!-- END PAGE -->

	<!-- END CONTAINER -->

	<!-- BEGIN FOOTER -->
	<div id="footer">2013 &copy; Metro Lab Dashboard.</div>
	<!-- END FOOTER -->

	<!-- BEGIN JAVASCRIPTS -->
	<!-- Load javascripts at bottom, this will reduce page load time -->
	<script src="resources/metrolab/js/jquery-1.8.3.min.js"></script>
	<script src="resources/metrolab/js/jquery.nicescroll.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="resources/metrolab/assets/jquery-slimscroll/jquery-ui-1.9.2.custom.min.js"></script>
	<script type="text/javascript"
		src="resources/metrolab/assets/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- <script
		src="resources/css/style-responsive.css"></script> -->
	<script
		src="resources/metrolab/assets/fullcalendar/fullcalendar/fullcalendar.min.js"></script>
	<script src="resources/metrolab/assets/bootstrap/js/bootstrap.min.js"></script>

	<!-- ie8 fixes -->
	<!--[if lt IE 9]>
   <script src="resources/metrolab/js/excanvas.js"></script>
   <script src="resources/metrolab/js/respond.js"></script>
   <![endif]-->

	<script
		src="resources/metrolab/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"
		type="text/javascript"></script>
	<script src="resources/metrolab/js/jquery.sparkline.js"
		type="text/javascript"></script>
	<script src="resources/metrolab/assets/chart-master/Chart.js"></script>
	<script src="resources/metrolab/js/jquery.scrollTo.min.js"></script>
	<!--     <script src="resources/metrolab/js/form-component.js"></script> 
   <script src="resources/metrolab/js/form-validation-script.js"></script> 
   <script src="resources/metrolab/js/form-wizard.js"></script> -->


	<!--script for this page only-->

	<script src="resources/metrolab/js/easy-pie-chart.js"></script>
	<script src="resources/metrolab/js/sparkline-chart.js"></script>
	<script src="resources/metrolab/js/home-page-calender.js"></script>
	<script src="resources/metrolab/js/home-chartjs.js"></script>
	<script src="resources/metrolab/js/draggable-portlet.js"></script>
	<script src="resources/js/dropdown.js"></script>

	<script>
		jQuery(document).ready(function() {
			DraggablePortlet.init();
		});
	</script>
	<script>
		$(".ui-sortable").sortable({
			cancel : ".disable-sorting"
		});
	</script>
	<script>
		$(function() {
			$("#draggable").draggable({
				revert : function(event, ui) {
					// on older version of jQuery use "draggable"
					// $(this).data("draggable")
					// on 2.x versions of jQuery use "ui-draggable"
					// $(this).data("ui-draggable")
					$(this).data("uiDraggable").originalPosition = {
						top : 0,
						left : 0
					};
					// return boolean
					return !event;
					// that evaluate like this:
					// return event !== false ? false : true;
				}
			});
			$("#droppable").droppable();
		});
	</script>
	<script>
		$(function() {
			$("#draggable").draggable();
		});
	</script>

	<!-- END JAVASCRIPTS -->

	<!--Datatables-->
	<script
		src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>

	<!-- Google Maps NOTE THIS IS BILL'S API KEY!!! MUST BE REPLACED BEFORE GOING TO TESTING/VALIDATION -->
	<script src="resources/js/maps/googlemaps.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCI99j2TRL8VywBAovrE9jOJEUwL6NR5CA&callback=initMap"></script>
</body>
<!-- END BODY -->
