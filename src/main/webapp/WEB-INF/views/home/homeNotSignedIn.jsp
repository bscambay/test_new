<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link href="resources/metrolab/assets/bootstrap/css/bootstrap-responsive.min.css"	rel="stylesheet" />
<link href="resources/metrolab/assets/bootstrap/css/bootstrap-fileupload.css"	rel="stylesheet" />
<link href="resources/metrolab/assets/font-awesome/css/font-awesome.css"  rel="stylesheet" />
<link href="resources/metrolab/css/style.css" rel="stylesheet" />
<link href="resources/metrolab/css/style-responsive.css" rel="stylesheet" />
<link href="resources/metrolab/css/style-default.css" rel="stylesheet"	id="style_color" />
<link href="resources/css/gold.css" rel="stylesheet" />
<link href="resources/css/icomoon.css" rel="stylesheet">
<link rel='shortcut icon' href='resources/images/gold.png' />
</head>

<body class="container v-height splashpage">

            <div class="v-align span12">
              <div class="span6 offset3">
			<div class="Absolute-Center is-Responsive">
                    <div class="widget red">
                        <div class="widget-title">
                           <h4>Sign In</h4>
                        </div>
                        <div class="widget-body form">
                           <!-- BEGIN FORM-->
                            <c:if test="${not empty error}">
								<div class="alert alert-block alert-error fade in" role="alert">
									<button type="button" class="close" data-dismiss="alert" class="close"><span aria-hidden="true">&times;</span></button>
									<strong>${error}</strong>
							 	</div>
							</c:if>
							<c:if test="${not empty msg}">
								 <div class="alert alert-block alert-success fade in" role="alert">
									 <button type="button" class="close" data-dismiss="alert" class="Close"><span aria-hidden="true">&times;</span></button>
								 	<strong>${msg}</strong>
								</div>
							</c:if>
	                          <form action="authenticate" method='POST' class="form-horizontal">
								<div class="control-group">
									<label for="inputPin" class="control-label">PIN</label>
									<div class="controls">
										<input type="text" id="inputPin" placeholder="PIN"	name="username" />
									</div>
								</div>

								<div class="control-group">
									<label for="inputPassword" class="control-label">Password</label>
									<div class="controls">
										<input type="password" id="inputPassword" placeholder="Password" name="password" />
									</div>
								</div>
								<div class="form-actions">
									<button type="submit" class="btn btn-success">Sign In</button>
								</div>
								<div class="control-group">
									<div class="controls">
										<p>
											New here? <a href="signup">Sign Up</a>
										</p>
									</div>
								</div>				
								<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	<!-- jQuery -->
	 <script src="./resources/metrolab/js/jquery-1.8.3.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	 <script src="resources/metrolab/assets/bootstrap/js/bootstrap.min.js"></script>
	 
	 <script src="resources/metrolab/js/jQuery.dualListBox-1.3.js" type="text/javascript"></script>

	</body>
</html>