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
								<div class="text-muted bootstrap-admin-box-title">search</div>
							</div>
							<div
								class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
								<form class="form-horizontal" action="/e-library/selectServlet"
									method="post">
									<input type="hidden" name="tip" value="1">
									<div class="col-lg-7 form-group">
										<label class="col-lg-4 control-label" for="query_bname">Book information</label>
										<div class="col-lg-8">
											<input class="form-control" id="bookName" name="name"
												type="text" value=""> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
									</div>
									<div class="col-lg-3 form-group">

										<button type="submit" class="btn btn-primary" id="btn_query">search</button>
									</div>
									<div class="col-lg-3 form-group">
										<button type="button" class="btn btn-primary" id="btn_add"
											data-toggle="modal" onclick="goToAddBook();" data-target="#addModal">Add books</button>
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
									<th>Types of books</th>
									<th>Book name</th>
									<th>Author name</th>
									<th>Book publishing house</th>
									<th>Book price</th>
									<th>Borrowing price</th>
									<th>Overdue amount</th>
									<th>Management options</th>
								</tr>
							</thead>

						
							<%
								ArrayList<BookBean> bookdata = new ArrayList<BookBean>();
								bookdata = (ArrayList<BookBean>) request.getAttribute("data");
								if (bookdata == null) {
									BookDao bookdao = new BookDao();
									bookdata = (ArrayList<BookBean>) bookdao.get_ListInfo();
								}
	
								for (BookBean bean : bookdata) {
							%>
							<tbody style="color:#33b031;">
								<td><%=bean.getCard()%></td>
								<td><%=bean.getType()%></td>
								<td><%=bean.getName()%></td>
								<td><%=bean.getAuthor()%></td>
								<td><%=bean.getPress()%></td>
								<td><%=bean.getBookPrice()%></td>
								<td><%=bean.getBorrowPrice()%></td>
								<td><%=bean.getOverduePrice()%></td>
								<td>
								<button type="button" class="btn btn-warning btn-xs"
										data-toggle="modal" data-target="#updateModal" id="btn_update"
										onclick="showInfo2('<%=bean.getBid()%>','<%=bean.getCard()%>','<%=bean.getType()%>','<%=bean.getName()%>',
											'<%=bean.getAuthor()%>','<%=bean.getPress()%>','<%=bean.getBookPrice()%>','<%=bean.getBorrowPrice()%>','<%=bean.getOverduePrice()%>')">Change</button>
								<button type="button" class="btn btn-danger btn-xs"
										onclick="deletebook(<%=bean.getBid()%>)">delete</button></td>
							</tbody>
							<%
								}
							%>
		
					</table>
					</div>
				</div>
	<script type="text/javascript">
		

		function deletebook(bid) {
			con = confirm("confirm deletion?");
			if(con == true) {
				location.href = "/e-library/deleteServlet?bid=" + bid;
			}
		}
		
		
		function goToAddBook(){
			location.href = "/e-library/addBook.jsp" ;
		}
		
		function showInfo2(bid, card, type, name, author, press, bookPrice,borrowPrice,overduePrice){
			location.href = "/e-library/updateBookPage.jsp?bid=" +bid+"&card="+card+"&type="+type+"&name="+name+
					"&author="+author+"&press="+press+"&bookPrice="+bookPrice+"&borrowPrice="+borrowPrice+"&overduePrice="+overduePrice; 
		}
		
		
	</script>
				
			</div>
		</div>
	</div>
</body>
</html>