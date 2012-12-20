<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据库作业提交系统</title>
<link rel="icon" href="images/icon.png" type="image/x-icon" /> 
<link rel="shortcut icon" href="images/icon.png" type="image/x-icon" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet" type="text/css">

</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>	

<div class="header insetPane"> 
  		<div id=left>
    		数据库作业提交系统
		</div>
		<div id=right>
			<div id="Login">

					<input class="input-small" type="text" name="login_uno" id="login_uno" placeholder="学号"/>
			
					<input class="input-small" type="password" name="login_upass" id="login_upass" value="" placeholder="密码"/>
		
					<button class="btn btn-primary" name="btn_login" id="btn_login">登录</button>
			
			</div>
		</div>
	</div>

	<div class="container insetPane">
		<div id=left>
			<img src="images/index.jpg" class="img-rounded" width="488" height="274" />
		</div>
		<div id=right>
  			<p style="font-size: 20pt;">注册</p>

  			<div id="Register">
  			<table width="318" border="0">
    			<tr>
      				<td width="126">学号</td>
      				<td width="182">
                    	
        				<input type="text" name="uno" id="uno" />
      					
                    </td>
    			</tr>
    			<tr>
      				<td>姓名</td>
      				<td>
                    	
        				<input type="text" name="uname" id="uname" />
      					
                    </td>
    			</tr>
    			<tr>
      				<td>密码</td>
      				<td>
                    	
        				<input type="password" name="upass" id="upass" onclick="this.value=''"/>
      					
                    </td>
    			</tr>
    			<tr>
      				<td>重复密码</td>
      				<td>
                    	
        				<input type="password" name="upass2" id="upass2" onclick="this.value=''"/>
      					
                    </td>
    			</tr>
                <tr>
      				<td>邮箱</td>
      				<td>
                    	
        				<input type="text" name="umail" id="umail" />
      					
                    </td>
    			</tr>
    			<tr>
      				<td></td>
      				<td>                   	
        				<button class="btn btn-success" name="btn_register" id="btn_register">注册</button>      					
        				<button class="btn" name="btn_reset" id="btn_reset">重置</button>
      					
                    </td>
    			</tr>
  			</table>
  			</div>
		</div>
	</div>
	<div id="footer">
		© Copyright 2012 by the <a href="http://ws.nju.edu.cn">Websoft Research Group</a>, NJU. All rights reserved.
	</div>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/index.js"></script>
	</body>
</html>