<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<script type="text/javascript">
	var element;
	layui.use('element', function(){
		  element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
		  
		  /*监听导航点击
		  element.on('nav(demo)', function(elem){
		    //console.log(elem)
		  });*/
		});
</script>
</head>
<body>
	<div class="sidebox fl">
		<div class="logo">
			<a href="#" title=""><img
				src="${ctx}/static/images/logo.png" alt="社会服务管理综合服务平台"
				width="193" height="160" /> </a>
		</div>
		<div class="menubox scroll-pane" id="sidebar">
			<div class="menu">
				<!-- <ul class="nav">
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
					
				</ul> -->
				<ul class="layui-nav layui-nav-tree" lay-filter="demo">
				  <li class="layui-nav-item">
				    <a href="javascript:;">用户管理</a>
				    <dl class="layui-nav-child">
				      <dd><a href="javascript:;">用户管理</a></dd>
				      <dd><a href="javascript:;">入住管理</a></dd>
				    </dl>
				  </li>
				  <li class="layui-nav-item">
				    <a href="javascript:;">订单管理</a>
				    <dl class="layui-nav-child">
				      <dd><a href="javascript:;" onclick="openright('${ctx }/admin/orderList')">订单管理</a></dd>
				    </dl>
				  </li>
				  <li class="layui-nav-item">
				    <a href="javascript:;">房间管理</a>
				    <dl class="layui-nav-child">
				      <dd><a href="javascript:;" onclick="openright('${ctx }/admin/houseList')">房间管理</a></dd>
				    </dl>
				  </li>
				  <li class="layui-nav-item">
				    <a href="javascript:;">留言管理</a>
				    <dl class="layui-nav-child">
				      <dd><a href="javascript:;">留言管理</a></dd>
				    </dl>
				  </li>
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
	<script type="text/javascript">
		element.init();
	</script>
</body>
</html>
