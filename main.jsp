<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="student.vo.*"%>
<%@ page import="student.factory.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0"> 
<title>数据库作业提交系统</title>
<link rel="icon" href="images/icon.png" type="image/x-icon" /> 
<link rel="shortcut icon" href="images/icon.png" type="image/x-icon" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet" type="text/css">
</head>
  
<body class="home">
	<%
	response.setHeader("Cache-Control","no-cache"); 
	response.setHeader("Pragma","no-cache"); 
	response.setDateHeader ("Expires", 0);	
	%>
	<%request.setCharacterEncoding("utf-8");	
	if(request.getSession(false)== null ||
		session.getAttribute("uname") == null ||
		session.getAttribute("uno") == null ||
		session.getAttribute("umail") == null) {
		response.sendRedirect("index.jsp");
	}
	
	
	%>	
	<div id="publishbar">
    	<div class="barpanel">

        
        	<div class="tools">
        		<div class="station-hot"><a href="index.jsp" data-light="f">数据库作业提交系统</a></div>
        		<div>
            		<a class="bar-btn-reg menu-list" method="post" href="servlet/UserLogout">[注销]</a>        		
       				<a class="bar-btn-login menu-list"><%=session.getAttribute("uname")%></a>        		
        		</div>
        	</div>
    	</div> 
	</div>
	
	<div id="main">
	<ul id="myTab" class="nav nav-tabs"> 
		<li class="active"><a href="#notice" data-toggle="tab">课程动态</a></li>
		<li class=""><a href="#profile" data-toggle="tab">个人动态</a></li>
		<li class=""><a href="#upload" data-toggle="tab">上传作业</a></li>
	</ul>            

	<div id="myTabContent" class="tab-content insetPane">

		<div id="notice" class="tab-pane active">
					<% 		
							List<Course> clist = DaoFactory.getICourseDaoInstance().getAllCourses();
							Iterator<Course> citer = clist.iterator();
							Course c = null;
					%>
					<table>
						<%
							while (citer.hasNext()) {
								c = citer.next();
						 %>
						<tr>
							<td><%=c.getCtime()%></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td><%=c.getCthing()%></td>
						</tr>
						<%
							}
						 %>
					</table>
		</div>
		<div id="profile" class="tab-pane">
			<div class="left">
				<div id="userInfo">
					<% 		
						User u = DaoFactory.getIUserDaoInstance().searchUserByUno((String)session.getAttribute("uno"));			
					%>
				
					<p>学号：<%=session.getAttribute("uno")%></p>
					<p>姓名：<%=u.getUname()%></p>
					<p>邮箱：<%=u.getUmail()%></p>
					<div class="btn-group">
						<button id="modPwdBtn" class="btn">修改密码</button>
						<button id="modMailBtn" class="btn">修改邮箱</button>
					</div>
				</div><br/>
				<div id="modProfile">
					<form id="modPwdForm" style="display:none" action="servlet/UserModify" method="post">
						新密码：<input type="password" name="npass" id="npass"/>
						<input class="btn btn-success" type="submit" value="确定"/>
						<input type="reset" id="cancelModPwd" class="btn" value="取消"/>
					</form>
					<form id="modMailForm" style="display:none" action="servlet/UserModifyUmail" method="post">
						新邮箱：<input type="text" name="nmail" id="nmail"/>
						<input class="btn btn-success" type="submit" value="确定"/>
						<input type="reset" id="cancelModMail" class="btn" value="取消"/>
					</form>	
				</div>
				<div id="dongtai">
					<% 
						String uno = (String)session.getAttribute("uno");
						if (uno != null) {			
							List<Userwork> worklist = DaoFactory.getIUserworkDaoInstance().searchUserworkByUno(uno);
							Iterator<Userwork> workiter = worklist.iterator();
							Userwork work = null;
					%>
					<table>
						<%
							while (workiter.hasNext()) {
								work = workiter.next();
						 %>
						<tr>
							<td><%=work.getWtime()%></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>上传了<%=work.getWwork()%></td>
						</tr>
						<%
							}
						}
						 %>
					</table>
				</div><br/>
			</div>
		</div>
		
		<div id="upload" class="tab-pane">
		<div class="cen">
			
			<form name="upload" action="servlet/FileUpload" method="post" enctype="multipart/form-data">
				<div id="uboxstyle" align="center">
					<h3 style="font-size:18px;">选择作业:</h3>
						<select name="num" id="num">
							<option value="1"  selected="selected">第1次课后作业
</option>
							<option value="2">第2次课后作业</option>
							<option value="3">第3次课后作业</option>
							<option value="4">第1次上机实验</option>
							<option value="5">第2次上机实验</option>
							<option value="6">第3次上机实验</option>
						</select>
				</div><br/>
				
				<div id="infile" align="center" class="offset1">			
					文件1:
					<input type="file" name="file1" size="50"/><br/>
					文件2:
					<input type="file" name="file2" size="50"/><br/>
					文件3:
					<input type="file" name="file3" size="50"/><br/>
					文件4:
					<input type="file" name="file4" size="50"/><br/>
					文件5:
					<input type="file" name="file5" size="50"/><br/>
				</div><br/>
				<div align="center">
					<input class="btn btn-success" type="submit" value="上传"/>
					<input class="btn" type="reset" value="清空"/>
				</div>
				<div align="center">
				<strong style="color:red">
				<% 
					String info = "";
					if(request.getSession().getAttribute("info") != null)
						info = (String)(request.getSession().getAttribute("info"));
				%>
				<%=info%>
				</strong>
				</div>
			</form>
			<hr>
			<p>说明：只能上传以下格式的文件：doc/docx/pdf/txt/sql/rar/zip，附件大小上限为50MB。</p>
		</div>
		</div>
		
	</div>
	
	</div>
	<div id="footer">
		© Copyright 2012 by the <a href="http://ws.nju.edu.cn">Websoft Research Group</a>, NJU. All rights reserved.
	</div>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
  </body>
</html>
