<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8">
<title>Error</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="description">
<meta content="" name="author">

<link href="resources/metrolab/assets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="resources/metrolab/assets/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" />
<link href="resources/metrolab/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="resources/metrolab/css/style.css" rel="stylesheet" />
<link href="resources/metrolab/css/style-responsive.css"
	rel="stylesheet" />
<link href="resources/metrolab/css/style-default.css" rel="stylesheet"
	id="style_color" />

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="error-500">
	<div class="error-wrap">
		<h1>Ouch!</h1>
		<h2> ${errorMessage} </h2>
		<div class="metro green">
			<span> ${errorCodeZero} </span>
		</div>
		<div class="metro yellow">
			<span> ${errorCodeOne} </span>
		</div>
		<div class="metro purple">
			<span> ${errorCodeTwo} </span>
		</div>
		<p>
			<a href="./"> Return Home </a>
		</p>
	</div>

	<!-- END BODY -->
</body>
</html>