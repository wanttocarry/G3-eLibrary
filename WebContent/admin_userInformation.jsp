<%@page import="com.uts.bean.HistoryBean"%>
<%@page import="com.uts.bean.AdminBean"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page
	import="com.uts.bean.BookBean,com.uts.dao.BookDao"%>
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
	
	<div class="container">
		<div class="row">
			<div class="col-md-2 bootstrap-admin-col-left">
				<ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
					<li><a href="/e-library/admin_book.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> Book management</a></li>
					<li><a href="/e-library/admin_user.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> user management</a></li>
					<li><a href="/e-library/UserLogOutServlet"><i
							class="glyphicon glyphicon-chevron-right"></i> Log out</a></li>
					
				</ul><br><br>
				
			</div>

			<div class="col-md-10">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default bootstrap-admin-no-table-panel">
							<div class="panel-heading">
								<div class="text-muted bootstrap-admin-box-title">User information</div>
							</div>
							<div
								class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
								<form class="form-horizontal" action="/e-library/AdminUserUpdateServlet"
									method="post">
									<input type="hidden" name="aid" value="<%=request.getParameter("aid")%>">
									<div class="col-lg-7 form-group">
										<label class="col-lg-4 control-label" for="query_bname">user name</label>
										<div class="col-lg-8">
											<input class="form-control" id="username" name="username"
												type="text" value="<%=request.getParameter("username")%>"> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
										<label class="col-lg-4 control-label" for="query_bname">name</label>
										<div class="col-lg-8">
											<input class="form-control" id="name" name="name"
												type="text" value="<%=request.getParameter("name")%>"> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
										<label class="col-lg-4 control-label" for="query_bname">password</label>
										<div class="col-lg-8">
											<input class="form-control" id="password" name="password"
												type="password" value="<%=request.getParameter("password")%>"> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
										<label class="col-lg-4 control-label" for="query_bname">email</label>
										<div class="col-lg-8">
											<input class="form-control" id="email" name="email"
												type="text" value="<%=request.getParameter("email")%>"> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
										<label class="col-lg-4 control-label" for="query_bname">Phone number</label>
										<div class="col-lg-8">
											<input class="form-control" id="phone" name="phone"
												type="text" value="<%=request.getParameter("phone")%>"> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
										
										<label class="col-lg-4 control-label" for="query_bname">balance</label>
										<div class="col-lg-8">
											<input class="form-control" id="balance" name="balance"
												type="text" value="<%=request.getParameter("balance")%>"> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
										
									</div>
									<div class="col-lg-3 form-group">

										<button type="submit" class="btn btn-primary" id="btn_query">update</button>
									</div>
									
								</form>
							</div>
						</div>
					</div>
				</div>

				
			</div>
		</div>
	</div>
</body>
</html>