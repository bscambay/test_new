<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Gold</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description">
<meta content="" name="author">
<link href="resources/metrolab/assets/bootstrap/css/bootstrap.min.css"	rel="stylesheet" />
<link href="resources/metrolab/assets/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="resources/metrolab/assets/bootstrap/css/bootstrap-fileupload.css"	rel="stylesheet" />
<link href="resources/metrolab/assets/font-awesome/css/font-awesome.css"	rel="stylesheet" />
<link href="resources/metrolab/css/style.css" rel="stylesheet" />
<link href="resources/metrolab/css/style-responsive.css"	rel="stylesheet" />
<link href="resources/metrolab/css/style-default.css" rel="stylesheet"	id="style_color" />
<link href="resources/css/gold.css" rel="stylesheet" />
<link rel='shortcut icon' href='resources/images/gold.png' />
<link href="resources/css/icomoon.css" rel="stylesheet">
</head>
<body class="container v-height splashpage">

	<div class="v-align span12">
			<div class="span6 offset3">
			<div class="Absolute-Center is-Responsive">
			<div class="widget red">
				<div class="widget-title">
					<h4>Sign Up</h4>
				</div>
				<div class="widget-body form">

					<!-- bind the form to the controller object via modelAttribute -->
					<spring:url value="signup" var="userActionUrl" />
					<form:form class="form-horizontal" method="post"
						modelAttribute="userForm" action="${userActionUrl}">
						<!--  bind to signupForm.pin -->
						<spring:bind path="pin">
							<div class="control-group ${status.error ? 'has-error' : ''}">
								<label class="control-label">PIN</label>
								<div class="controls">
									<form:input path="pin" type="text" class="form-control"
										id="pin" placeholder="6 digit PIN" />
									<span class="help-inline"><form:errors path="pin"
											class="input-error tooltips" /></span>
								</div>
							</div>
						</spring:bind>
						<!-- bind to signupForm.password -->
						<spring:bind path="password">
							<div class="control-group ${status.error ? 'has-error' : ''}">
								<label class="control-label">Password</label>
								<div class="controls">
									<form:password path="password" class="form-control"
										id="password" placeholder="Password" />
									<span class="help-inline"><form:errors path="password"
											class="input-error tooltips" /></span>
								</div>
							</div>
						</spring:bind>
						<!-- bind to signupForm.confirmPassword -->
						<spring:bind path="confirmPassword">
							<div class="control-group ${status.error ? 'has-error' : ''}">
								<label class="control-label">Confirm Password</label>
								<div class="controls">
									<form:password path="confirmPassword" class="form-control"
										id="password" placeholder="Re-enter Password" />
									<span class="help-inline"><form:errors
											path="confirmPassword" class="input-error tooltips" /></span>
								</div>
							</div>
						</spring:bind>
						<!-- bind to signupForm.name -->
						<spring:bind path="name">
							<div class="control-group ${status.error ? 'has-error' : ''}">
								<label class="control-label">Name</label>
								<div class="controls">
									<form:input path="name" type="text" class="form-control"
										id="name" placeholder="First and Last Name" />
									<span class="help-inline"><form:errors path="name"
											class="input-error tooltips" /></span>
								</div>
							</div>
						</spring:bind>

						<div class="form-actions">
							<button type="submit" class="btn btn-success">Sign Up</button>
						</div>

						<div class="control-group">
							<div class="controls">
								<p>
								<!--
								Already have an account? <a href="signin">Sign In</a>
								  -->
									Already have an account? <a href="/gold">Sign In</a>
								
								</p>
							</div>
						</div>
					</form:form>

				</div>
		
			</div>
		
		</div>
		
	</div>
	</div>

	<!-- jQuery -->
	<script src="./resources/js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="./resources/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="./resources/SBAdmin/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="./resources/SBAdmin/dist/js/sb-admin-2.js"></script>

</body>
</html>