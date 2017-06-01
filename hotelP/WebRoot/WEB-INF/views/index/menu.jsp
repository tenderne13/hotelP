<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>酒店</title>
</head>
<body>

<div class="container header">
	<div class="span5">
		<div class="logo">
			
		</div>
	</div>
	<div class="span9">
<div class="headerAd">
	<img src="${ctx}/images/header.jpg" width="320" height="50" alt="正品保障" title="正品保障"/>
</div>	
</div>
	

<div class="span10 last">
	
	<div class="topNav clearfix">
		<ul>
			
			<c:if test="${sessionScope.userList ==null}">
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/user/loginPage.do">登录</a>|</li>
			<li id="headerRegister" class="headerRegister"
				style="display: list-item;"><a href="#" onclick="openMiddle('${ pageContext.request.contextPath }/user/initRegist')">注册</a>|
			</li>
			</c:if>
			<c:if test="${sessionScope.userList !=null}">
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<c:forEach items="${sessionScope.userList}" var="u">
					${u.name}
				
				
			|</li>
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/order/findByUid.do?page=1">我的订单</a>
			|</li>
			<li id="headerRegister" class="headerRegister"
				style="display: list-item;"><a href="${ pageContext.request.contextPath }/user/quit.do">退出</a>|
			</li>
			</c:forEach>
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
	<ul class="mainNav">
		<li><a href="${ pageContext.request.contextPath }/index" >首页</a> |</li>
		<li><a href="#">单人间预订</a> |</li>
		<li><a href="#">双人间预订</a> |</li>
		<li><a href="#">商务间预订</a> |</li>
		<li><a href="#">留言板</a> |</li>

	</ul>
</div>



</div>	


</body>
</html>