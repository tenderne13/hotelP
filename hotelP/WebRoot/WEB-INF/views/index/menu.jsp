<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>酒店</title>
<script type="text/javascript">
$(function(){
	element.init();
})
	function logout(){
		$.post(
			"${ctx}/user/logout",function(message){
				$("#top").load("${ctx}/position?meth=menu");
			}		
		);
		
	}
</script>
</head>
<body>

<div class="container header">
	<div class="span5">
		<div class="logo">
			
		</div>
	</div>
	<div class="span9">
<div class="headerAd">
	
</div>	
</div>
	

<div class="span10 last">
	
	<div class="topNav clearfix">
		<ul>
			
			<c:if test="${sessionScope.user ==null}">
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="#" onclick="openMiddle('${ctx }/user/initLogin')">登录</a>|</li>
			<li id="headerRegister" class="headerRegister"
				style="display: list-item;"><a href="#" onclick="openMiddle('${ctx }/user/initRegist')">注册</a>|
			</li>
			</c:if>
			<c:if test="${sessionScope.user !=null}">
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
					${sessionScope.user.nickName}
				
				
			|</li>
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/order/findByUid.do?page=1">我的订单</a>
			|</li>
			<li id="headerRegister" class="headerRegister"
				style="display: list-item;"><a href="#" onclick="logout()">退出</a>|
			</li>
			</c:if>
			
			<li><a>会员中心</a> |</li>
			<li><a>购物指南</a> |</li>
			<li><a>关于我们</a></li>
		</ul>
	</div>
	<div class="cart">
		<a href="${ pageContext.request.contextPath }/cart/myCart.do">购物车</a>
	</div>
	<div class="phone">
		客服热线: <strong>96008/53277764</strong>
	</div>
</div>
<div class="span24">
	<ul class="layui-nav" lay-filter="menu">
	  <li class="layui-nav-item layui-this"><a href="#" onclick="openMiddle('${ctx }/position?meth=hotHouses')">首页</a></li>
	  <li class="layui-nav-item "><a href="#" onclick="openMiddle('${ctx }/roomList?category=单人间')">单人间预订</a></li>
	  <li class="layui-nav-item"><a href="#" onclick="openMiddle('${ctx }/roomList')">双人间预订</a></li>
	  <li class="layui-nav-item"><a href="#" onclick="openMiddle('${ctx }/roomList')">商务间预订</a></li>
	  <li class="layui-nav-item"><a href="#" onclick="openMiddle('${ctx }/roomList')">留言板</a></li>
	</ul>		
</div>



</div>	


</body>
</html>