
<%@page import="com.uts.bean.AdminBean"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page
	import="com.uts.bean.BookBean,com.uts.bean.HistoryBean,com.uts.dao.BookDao"%>
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
	AdminBean admin = (AdminBean) session.getAttribute("admin");
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-2 bootstrap-admin-col-left">
				<ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
					<li><a href="/e-library/book.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> Book information</a></li>
					<li><a href="/e-library/borrow.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> Borrowing information</a></li>
					<li><a href="/e-library/user_information.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> User information</a></li>
							<li><a href="/e-library/UserLogOutServlet"><i
							class="glyphicon glyphicon-chevron-right"></i> Log Out </a></li>
					
				</ul><br><br>
				
			</div>

			<div class="col-md-10">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default bootstrap-admin-no-table-panel">
							<div class="panel-heading">
								<div class="text-muted bootstrap-admin-box-title">search</div>
							</div>
							<div
								class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
								<form class="form-horizontal" action="/e-library/BorrowSlectServlet"
									method="post">
									<input type="hidden" name="tip" value="1">
									<div class="col-lg-7 form-group">
										<label class="col-lg-4 control-label" for="query_bname">Borrowing information</label>
										<div class="col-lg-8">
											<input class="form-control" id="bookName" name="name"
												type="text" value=""> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
									</div>
									<div class="col-lg-3 form-group">

										<button type="submit" class="btn btn-primary" id="btn_query">search</button>
									</div>
									
								</form>
							</div>
						</div>
					</div>
				</div>
<div class="row">
					<div class="col-lg-12">
						<table id="data_list" class="table table-hover table-bordered"
							cellspacing="0" width="100%">
							<thead>
								<tr style="color:white;">
									<th>Book ID</th>
									<th>Book name</th>
									<th>User name</th>
									<th>Borrowing date</th>
									<th>Due date</th>
									<th>operation</th>
								
								</tr>
							</thead>
						
							<%
								ArrayList<HistoryBean> bookdata = new ArrayList<HistoryBean>();
							
								AdminBean user =  (AdminBean)session.getAttribute("admin");
								int borrowStatus =1;
								
								BookDao bookdao = new BookDao();
									
								bookdata = (ArrayList<HistoryBean>) bookdao.get_HistoryListInfo(borrowStatus, user.getAid());
									for (HistoryBean bean : bookdata) {
										
										
										BookBean book =  bookdao.get_BookInfo(bean.getBid());
										double borrowPrice = book.getBorrowPrice();
										
										double overduePrice = book.getOverduePrice();
										
							%>
							<tbody style="color:#33b031;">
								<td><%=bean.getCard()%></td>
								<td><%=bean.getBookname()%></td>
								<td><%=bean.getUsername()%></td>
								<td><%=bean.getBegintime()%></td>
								<td><%=bean.getEndtime()%></td>
								<td>
									<button type="button" class="btn btn-warning btn-xs"
										data-toggle="modal" onclick="returnBook(<%=bean.getHid()%>,<%=bean.getCard()%>,'<%=bean.getEndtime()%> 00:00:00',<%=bean.getBid()%>,<%=bean.getAid()%>,<%=borrowPrice%>,<%=overduePrice%>)">Return</button>
					 
					                <button type="button" class="btn btn-danger btn-xs"
										onclick="delayBook(<%=bean.getHid()%>,'<%=bean.getEndtime()%> 00:00:00')">Delay</button>
								</td>
							</td>
							</tbody>
							<%}%>
						</table>
						</div>
				</div>
				
				<script type="text/javascript">
			    function returnBook(hid,card,endTime,bid,aid,borrowPrice,overduePrice) {
			    	var currentDay = getCurrentDate(1);
			    	
			    	
			    	var day=0;
			    	day = GetNumberOfDays(endTime,currentDay);
			    	
			    	if(day<=0){
			    		con=confirm("Confirm whether to return the book?"); 
			    		if(con==true){
					    	location.href = "/e-library/ReturnBookServlet?hid="+hid+"&card="+card+"&endTime="+endTime+"&bid="+bid+"&aid="+aid;
					    }
			    		
			    		
			    	}else{
			    		con=confirm("Confirm whether to return the book?Overdue days："+day+"day，Deduct overdue amount："+overduePrice*day); 
			    		if(con==true){
					    	location.href = "/e-library/ReturnBookServlet?hid="+hid+"&card="+card+"&endTime="+endTime+"&bid="+bid+"&aid="+aid;
					    }
			    		
			    	}
			    	
			    
			    }
			    
			    
			    function GetNumberOfDays(date1,date2){
			        var a1 = Date.parse(new Date(date1));
			        var a2 = Date.parse(new Date(date2));
			        var day = parseInt((a2-a1)/ (1000 * 60 * 60 * 24));
                   
			        return day
			    }
			    
			    
			  
			    function getCurrentDate(format) {
			      var now = new Date();
			      var year = now.getFullYear(); 
			      var month = now.getMonth();
			      var date = now.getDate();
			      var day = now.getDay();
			      var hour = now.getHours();
			      var minu = now.getMinutes();
			      var sec = now.getSeconds();
			      month = month + 1;
			      if (month < 10) month = "0" + month;
			      if (date < 10) date = "0" + date;
			      if (hour < 10) hour = "0" + hour;
			      if (minu < 10) minu = "0" + minu;
			      if (sec < 10) sec = "0" + sec;
			      var time = "";
			     
			      if(format==1){
			        time = year + "-" + month + "-" + date;
			      }
			     
			      else if(format==2){
			        time = year + "-" + month + "-" + date+ " " + hour + ":" + minu + ":" + sec;
			      }
			      return time;
			    }
			    
				function delayBook(hid,endTime) {
					con = confirm("Confirm if you want to delay returning the book?");
					if(con == true) {
						location.href = "/e-library/delayBookServlet?hid=" + hid+"&endTime="+endTime;
					}
				                    
				 }
				
			    
			    </script>
			</div>
		</div>
	</div>
</body>
</html>