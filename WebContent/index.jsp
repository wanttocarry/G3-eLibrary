<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page
	import="com.uts.bean.AdminBean,com.uts.bean.HistoryBean,com.uts.dao.AdminDao"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="ax-vertical-centered">
<head>
<meta charset="UTF-8">
<title>University of Western Sydney E-library</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
<link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
<script src="static/js/bootstrap.min.js"></script>
<script src="static/jQuery/jquery-3.1.1.min.js"></script>
<script src="static/js/bootstrap-dropdown.min.js"></script>
<script src="static/js/adminUpdateInfo.js"></script>
<script src="static/js/adminUpdatePwd.js"></script>
<style>
body {
	background-image: url("01.jpg");
}
</style>
</head>

<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>

<body class="bootstrap-admin-with-small-navbar">
	<%
	
	%>
	

	<div class="container">
		<div class="row">
				<div class="col-md-2 bootstrap-admin-col-left">
				<ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
					<li><a href="/e-library/book.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> Book information</a></li>
					<li><a href="/e-library/borrow.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> Borrowing information</a></li>
					<li><a href="#"><i
							class="glyphicon glyphicon-chevron-right"></i> Book classification management</a></li>
					
				</ul><br><br>
				
			</div>

			<!-- content -->
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="text-muted bootstrap-admin-box-title">Book management</div>
							</div>
							<div class="bootstrap-admin-panel-content">
								<ul>
									<li>Query the basic information of books according to book name, author and classification</li>
									<li>Add, modify or delete book information</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="text-muted bootstrap-admin-box-title">user management</div>
							</div>
							<div class="bootstrap-admin-panel-content">
								<ul>
									<li>Query basic user information according to account number, name and ID</li>
									<li>Add, modify, or delete user information</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="text-muted bootstrap-admin-box-title">Book classification management</div>
							</div>
							<div class="bootstrap-admin-panel-content">
								<ul>
									<li>View the book classification information and display the classification ID</li>
									<li>Add, modify, or delete Book classifications</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				
				
			</div>
		</div>
	</div>
	
	
	
</body>
</html>