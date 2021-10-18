<%@page import="com.uts.dao.AdminDao"%>
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
						<table id="data_list" class="table table-hover table-bordered"
							cellspacing="0" width="100%">
							<thead>
								<tr style="color:white;">
									<th>User account</th>
									<th>User </th>
									<th>Email</th>
									<th>Phone Number</th>
									<th>Balance</th>
									<th>Management options</th>
								</tr>
							</thead>

						
							<%
								ArrayList<AdminBean> userData = new ArrayList<AdminBean>();
								userData = (ArrayList<AdminBean>) request.getAttribute("data");
								
								if (userData == null) {
									
									AdminDao adminDao = new AdminDao();
									userData = (ArrayList<AdminBean>) adminDao.getUserListInfo();
									
								}
	
								for (AdminBean bean : userData) {
							%>
							<tbody style="color:#33b031;">
								<td><%=bean.getName()%></td>
								<td><%=bean.getUsername()%></td>
								<td><%=bean.getEmail()%></td>
								<td><%=bean.getPhone()%></td>
								<td><%=bean.getBalance()%></td>
								<td>
								<button type="button" class="btn btn-warning btn-xs"
										data-toggle="modal" data-target="#updateModal" id="btn_update"
									    
									    onclick="showInfo2('<%=bean.getAid()%>','<%=bean.getUsername()%>','<%=bean.getName()%>','<%=bean.getPassword()%>','<%=bean.getEmail()%>','<%=bean.getPhone()%>','<%=bean.getBalance()%>')">Change</button>
								<button type="button" class="btn btn-danger btn-xs"
									onclick="deletebook(<%=bean.getAid()%>)">delete</button></td>
							</tbody>
							<%
								}
							%>
		
					</table>
					</div>
				</div>
	<script type="text/javascript">
		

		function deletebook(aid) {
			con = confirm("confirm deletion?");
			if(con == true) {
				location.href = "/e-library/DeleteUserServlet?aid=" + aid;
			}
		}
		
		function showInfo2(aid, username, name, password, email, phone, balance){
			
			location.href = "/e-library/admin_userInformation.jsp?aid=" +aid+"&username="+username+"&name="+name+"&password="+password+
					"&email="+email+"&phone="+phone+"&balance="+balance; 
		}
		
		
	</script>
				
			</div>
		</div>
	</div>
</body>
</html>