<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
</head>
<body>
	<div class="topbox">
		<div class="usermenu fr">
			<ul class="list">
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
						width="34" alt="">管理员</a></li>
				<li class="quit"><a id="user_logout" href="javascript:void(0)"><i
						class="icon i-quit"></i>注销</a>
				</li>
			</ul>
		</div>
		<div class="sq-name">
			<h1 class="title">酒店管理系统</h1>
		</div>
	</div>
	<script type="text/javascript">
		$("#user_logout").click( function() {
			window.location.href = "${ctx}/system/login/logout";
		});
	</script>
</body>
</html>
