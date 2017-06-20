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
	<div class="span5"  style="">
		<div class="logo" style="height:20px;">
			
		</div>
	</div>
	<div class="span9">
<div class="headerAd" style="height:20px">
	
</div>	
</div>
	

<div class="span10 last">
	
	<div class="topNav clearfix">
		<span class="layui-breadcrumb" lay-separator="|" style="margin-left:90px">
		  <c:if test="${sessionScope.user ==null}">
		  	<a href="javaScript:;" onclick="openMiddle('${ctx }/user/initLogin')">登录</a>
		    <a href="javaScript:;" onclick="openMiddle('${ctx }/user/initRegist')">注册</a>
		  </c:if>
		  
		  <c:if test="${sessionScope.user !=null}">
		  	<a href="javaScript:;" >${sessionScope.user.nickName}</a>
		    <a href="javaScript:;" onclick="openMiddle('${ctx }/user/orderList')">我的订单</a>
		    <a href="javaScript:;" onclick="logout()">注销</a>
		  </c:if>
		  
		  
		  <a href="javaScript:;"  onclick="openMiddle('${ctx }/vuePage')">会员中心</a>
		</span>
	</div>
</div>
<div class="span24">
	<ul class="layui-nav" lay-filter="menu">
	  <li class="layui-nav-item layui-this"><a href="#" onclick="openMiddle('${ctx }/position?meth=hotHouses')">首页</a></li>
	  <li class="layui-nav-item "><a href="#" onclick="openMiddle('${ctx }/roomList?category=单人间')">单人间预订</a></li>
	  <li class="layui-nav-item"><a href="#" onclick="openMiddle('${ctx }/roomList?category=双人间')">双人间预订</a></li>
	  <li class="layui-nav-item"><a href="#" onclick="openMiddle('${ctx }/roomList?category=商务间')">商务间预订</a></li>
	  <li class="layui-nav-item"><a href="#" onclick="openMiddle('${ctx }/roomList')">留言板</a></li>
	</ul>	
	
		
</div>



</div>	


</body>
</html>