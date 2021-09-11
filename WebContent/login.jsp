<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>
       University of Western Sydney E-library
    </title>
    <link rel="stylesheet" type="text/css" href="static/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="static/css/demo.css" />
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="static/css/component.css" />
    <!--[if IE]>
        <script src="js/html5.js">
        </script>
    <![endif]-->
</head>
<body>
<div class="container demo-1">
        <div class="content">
            <div id="large-header" class="large-header">
                <canvas id="demo-canvas"></canvas>
                <div class="logo_box">
                    <h3>
                    University of Western Sydney E-library
                    </h3>
                    <%
						String state = (String) session.getAttribute("state");
						session.removeAttribute("state");
						if (state != null) {
					%>
						<label class="control-label" for="username"><%=state %></label>

					<%}%>
                    <form action="LoginServlet" name="f" method="post">
                        <div class="input_outer">
                            <span class="u_user">
                            </span>
                            <input name="username" class="text" style="color: #FFFFFF !important" type="text"
                                   placeholder="Enter account">
                        </div>
                        <div class="input_outer">
                            <span class="us_uer">
                            </span>
                            <input name="password" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"
                                   value="" type="password" placeholder="Enter password">
                        </div>
                        <div class="mb2">
                        	<input type="submit" class="act-but submit"  value="Login" style="color: #FFFFFF;width:380px;height: 50px;">
                           
                            <a class="act-but submit" href="register.jsp" style="color: #FFFFFF">
                                Click to register
                            </a>
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="static/js/TweenLite.min.js">
    </script>
    <script src="static/js/EasePack.min.js">
    </script>
    <script src="static/js/rAF.js">
    </script>
    <script src="static/js/demo-1.js">
    </script>
    <div style="text-align:center;">
    </div>
</body>
</html>