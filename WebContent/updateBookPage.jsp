<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page
	import="com.uts.bean.BookBean,com.uts.dao.BookDao,com.uts.dao.TypeDao,com.uts.bean.TypeBean"%>
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
					<li><a href="#"><i
							class="glyphicon glyphicon-chevron-right"></i> user management</a></li>
					<li><a href="#"><i
							class="glyphicon glyphicon-chevron-right"></i> Book classification management</a></li>
					
				</ul><br><br>
				
			</div>

			<div class="col-md-10">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default bootstrap-admin-no-table-panel">
							<div class="panel-heading">
								<div class="text-muted bootstrap-admin-box-title">update Book</div>
							</div>
							<div
								class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
								<form class="form-horizontal" action="/e-library/UpdateBookServlet"
									method="post">
									<input type="hidden" name="updatebid" value="<%=request.getParameter("bid")%>">
									<div class="col-lg-7 form-group">
										<label class="col-lg-4 control-label" for="query_bname">Book ID</label>
										<div class="col-lg-8">
										
										
											<input class="form-control" id="card" name="card"
												type="text" value="<%=request.getParameter("card")%>"> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
									</div>
									
									
									<div class="col-lg-7 form-group">
										<label class="col-lg-4 control-label" for="query_bname">Book name</label>
										<div class="col-lg-8">
											<input class="form-control" id="name" name="name"
												type="text" value="<%=request.getParameter("name")%>"> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
									</div>
									
									<div class="col-lg-7 form-group">
										<label class="col-lg-4 control-label" for="query_bname">Book type</label>
										<div class="col-lg-8">
											<select class="form-control" id="type" name="type"
												onPropertyChange="showValue(this.value)">
												<option value="-1">option</option>
										<%
											TypeDao typedao = new TypeDao();
											ArrayList<TypeBean> data = (ArrayList<TypeBean>) typedao.get_ListInfo();
											data = (ArrayList<TypeBean>) typedao.get_ListInfo();
											for (TypeBean bean : data) {
										%>
											<option value="<%=bean.getName()%>">
												<%=bean.getName()%>
											</option>
										<%
											}
										%>
												
											
												
											</select> 
										</div>
									</div>
									
									
										<div class="col-lg-7 form-group">
										<label class="col-lg-4 control-label" for="query_bname">Author name</label>
										<div class="col-lg-8">
											<input class="form-control" id="author" name="author"
												type="text" value="<%=request.getParameter("author")%>"> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
									</div>
									
										<div class="col-lg-7 form-group">
										<label class="col-lg-4 control-label" for="query_bname">Book publishing house</label>
										<div class="col-lg-8">
											<input class="form-control" id="press" name="press"
												type="text" value="<%=request.getParameter("press")%>"> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
									</div>
									
										<div class="col-lg-7 form-group">
										<label class="col-lg-4 control-label" for="query_bname">Book price</label>
										<div class="col-lg-8">
											<input class="form-control" id="bookPrice" name="bookPrice"
												type="text" value="<%=request.getParameter("bookPrice")%>"> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
									</div>
									
										<div class="col-lg-7 form-group">
										<label class="col-lg-4 control-label" for="query_bname">Borrowing price</label>
										<div class="col-lg-8">
											<input class="form-control" id="borrowPrice" name="borrowPrice"
												type="text" value="<%=request.getParameter("borrowPrice")%>"> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
									</div>
									
										<div class="col-lg-7 form-group">
										<label class="col-lg-4 control-label" for="query_bname">Overdue amount</label>
										<div class="col-lg-8">
											<input class="form-control" id="overduePrice" name="overduePrice"
												type="text" value="<%=request.getParameter("overduePrice")%>"> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
									</div>
								
									
									<div class="col-lg-3 form-group">

										<button type="submit" class="btn btn-primary" id="btn_query">Update</button>
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