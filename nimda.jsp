<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="student.vo.*"%>
<%@ page import="student.factory.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>数据库作业提交系统</title>
<link rel="icon" href="images/icon.png" type="image/x-icon" /> 
<link rel="shortcut icon" href="images/icon.png" type="image/x-icon" />
<link href="css/main.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
  
<body class="home">
	<%request.setCharacterEncoding("utf-8"); %>	
	<div id="publishbar">
    	<div class="barpanel">

        
        	<div class="tools">
        		<div class="station-hot"><a href="index.jsp" data-light="f">数据库作业提交系统</a></div>        		
        	</div>
    	</div> 
	</div>
	
	<div id="main">
	<ul id="myTab" class="nav nav-tabs"> 
		<li class="active"><a href="#notice" data-toggle="tab">课程动态</a></li>

	</ul>            

	<div id="myTabContent" class="tab-content">
	
					<div id="postNotice" >
				<form action="servlet/CourseAdd" method="post">
					发布新动态：<input type="text" size="50" name="npass" id="npass"/><input class="btn btn-success" type="submit" value="确认发布"/><br/>
				</form>	
			</div><br/>

		<div id="notice" class="tab-pane active">
			<div id="dongtai">
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
			</div><br/>
					
			

		</div>
		</div>
			
			
			
	</div>

		
	
	

	<div id="footer">
		© Copyright 2012 by the Websoft Research Group, NJU. All rights reserved.
	</div>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
  </body>
</html>

