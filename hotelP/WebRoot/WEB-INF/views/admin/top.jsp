<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<style type="text/css">
	.layui-nav
	.layui-nav-item 
	a:hover, .layui-nav .layui-this a{
		color:#808080
	}
	
	
</style>
</head>
<body>
	<div class="topbox">
		<div  style="width:445px;float:right;">
			<!-- <ul class="list">
				<li class="new"><a href="#">新诉求</a></li>
				<li class="feedback"><a href="#">未反馈</a></li>
				<li class="remind"><a href="#"><i class="icon i-remind"></i>提
						醒（6）</a>
					<div class="select">
						<a href="#">老年人 (3) </a> <a href="#">志愿者 (1) </a>
					</div>
				</li>
				<li class="username"><a href="#"><img
						src="${ctx}/static/images/userphoto.png" height="34"
						width="34" alt="">${sessionScope.adminUser.name }</a></li>
				<li class="quit"><a id="user_logout" href="#" onclick="logout()"><i
						class="icon i-quit"></i>注销</a>
				</li>
			</ul> -->
			
			<ul class="layui-nav" style="background-color:#fff;border-bottom:1px solid #d5d8db;height:56px;line-height:56px;">
			  <li class="layui-nav-item layui-this">
			    <a href="#"><img
						src="${ctx}/static/images/userphoto.png" height="34"
						width="34" alt="">${sessionScope.adminUser.name }</a>
			    <dl class="layui-nav-child">
			      <dd><a href="">选项1</a></dd>
			      <dd><a href="">选项2</a></dd>
			      <dd><a href="">选项3</a></dd>
			    </dl>
			  </li>
			  <li class="layui-nav-item"><a href="#" onclick="logout()">注销</a></li>
			</ul>
		</div>
		<div class="sq-name">
			<h1 class="title" style="font-size:100%">酒店管理系统</h1>
		</div>
	</div>
	<script type="text/javascript">
		function logout(){
			window.location.href = "${ctx}/admin/logout";
		}
	</script>
</body>
</html>
