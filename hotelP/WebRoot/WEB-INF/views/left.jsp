<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

</head>
<body>
	<div class="sidebox fl">
		<div class="logo">
			<a href="#" title=""><img
				src="${ctx}/static/images/logo.png" alt="社会服务管理综合服务平台"
				width="193" height="134" /> </a>
		</div>
		<div class="menubox scroll-pane" id="sidebar">
			<div class="menu">
				<ul class="nav">
					<li class="first"><a href="#"><i class="icon fr"></i>用户管理</a>
						<ul class="list">
								<li class="second"><a href="#"
									onclick="openright('${ctx }/')" title=""><b
										class="decor"></b>用户管理</a>
								</li>
								<li class="second"><a href="#"
									onclick="openright('${ctx }/')" title=""><b
										class="decor"></b>入住管理</a>
								</li>
						</ul>
					</li>
					<li class="first"><a href="#"><i class="icon fr"></i>订单管理</a>
						<ul class="list">
								<li class="second"><a href="#"
									onclick="openright('${ctx }/')" title=""><b
										class="decor"></b>订单管理</a>
								</li>
						</ul>
					</li>
					<li class="first"><a href="#"><i class="icon fr"></i>房间管理</a>
						<ul class="list">
								<li class="second"><a href="#"
									onclick="openright('${ctx }/admin/houseList')" title=""><b
										class="decor"></b>房间管理</a>
								</li>
						</ul>
					</li>
					<li class="first"><a href="#"><i class="icon fr"></i>留言管理</a>
						<ul class="list">
								<li class="second"><a href="#"
									onclick="openright('${ctx }/')" title=""><b
										class="decor"></b>留言管理</a>
								</li>
						</ul>
					</li>
					
					<c:forEach items="${menu}" var="m">
						<c:if test="${m.parentId == 0}">
							<li class="first"><a href="#"><i class="icon fr"></i><img
									class="sign" src="${ctx }${m.iconPath}" alt="${m.resName}" width="27"
									height="29" />${m.resName}</a>
								<ul class="list">
									<c:forEach items="${menu}" var="mm">
										<c:if test="${m.id == mm.parentId}">
											<li class="second"><a href="#"
												onclick="openright('${ctx }${mm.resUrl}')" title="${mm.resName}"><b
													class="decor"></b>${mm.resName}</a>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="switch">
			<a href="javascript:;" class="h-icon on" title="展开菜单"></a> <a
				href="javascript:;" class="h-icon off" title="关闭菜单"></a>
		</div>
	</div>
	<script type="text/javascript"
		src="${ctx}/static/js/js2.0/jquery.mousewheel.js"></script>
	<script type="text/javascript"
		src="${ctx}/static/js/js2.0/jScrollPane.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/js2.0/common.js">
	</script>
</body>
</html>
