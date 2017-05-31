<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>商城</title>
<link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${ctx}/static/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/js2.0/layer/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"  src="${ctx}/static/js/ajaxfileupload/ajaxfileupload.js"></script>
<script type="text/javascript">
$(function(){
	getHotHouses();
});

function getHotHouses(){
	$.post(
		"${ctx}/getHotHouses",function(data){
			var houses=data.rows;
			var htm="";
			if(houses.length>0){
				for(var i=0;i<houses.length;i++){
					htm+='<li>'+
						 '	<a href="${ctx}/'+houses[i].photo+'" target="blank"><img src="${ctx}/'+houses[i].photo+'"   style="display: block;"/></a>'+
						 '</li>';
				}
			}
			$("#tabContent").empty();
			$("#tabContent").append(htm);
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
				style="display: list-item;"><a href="${ pageContext.request.contextPath }/user/registPage.do">注册</a>|
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
		<li><a href="${ pageContext.request.contextPath }/user/findByCid.do?cid=${c.cid}&page=1">单人间预订</a> |</li>
		<li><a href="${ pageContext.request.contextPath }/user/findByCid.do?cid=${c.cid}&page=1">双人间预订</a> |</li>
		<li><a href="${ pageContext.request.contextPath }/user/findByCid.do?cid=${c.cid}&page=1">商务间预订</a> |</li>
		<li><a href="${ pageContext.request.contextPath }/user/findByCid.do?cid=${c.cid}&page=1">留言板</a> |</li>
			<c:forEach items="${cList}" var="c">
				<li><a href="${ pageContext.request.contextPath }/user/findByCid.do?cid=${c.cid}&page=1">${c.cname}</a> |</li>
			</c:forEach>

	</ul>
</div>



</div>	

<div class="container index" id="content">
		

		<div class="span24">
			<div id="hotProduct" class="hotProduct clearfix">
					<div class="title">
						<strong>热门房间</strong>
						<!-- <a  target="_blank"></a> -->
					</div>
					
					<ul class="tab">
							<li class="current">
								<a href="./蔬菜分类.htm?tagIds=1" target="_blank"></a>
							</li>
							<li>
								<a  target="_blank"></a>
							</li>
							<li>
								<a target="_blank"></a>
							</li>
					</ul>
					
					
						<ul class="tabContent" style="display: block;" id="tabContent">
								
						</ul>
			</div>
		</div>
		<div class="span24">
			<div class="friendLink">
				<dl>
					<dt>新手指南</dt>
							<dd>
								<a  target="_blank">支付方式</a>
								|
							</dd>
							<dd>
								<a  target="_blank">配送方式</a>
								|
							</dd>
							<dd>
								<a  target="_blank">售后服务</a>
								|
							</dd>
							<dd>
								<a  target="_blank">购物帮助</a>
								|
							</dd>
							<dd>
								<a  target="_blank">蔬菜卡</a>
								|
							</dd>
							<dd>
								<a  target="_blank">礼品卡</a>
								|
							</dd>
							<dd>
								<a target="_blank">银联卡</a>
								|
							</dd>
							<dd>
								<a  target="_blank">亿家卡</a>
								|
							</dd>
							
					<dd class="more">
						<a >更多</a>
					</dd>
				</dl>
			</div>
		</div>
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="${pageContext.request.contextPath}/images/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势">
</div>	</div>
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a>关于我们</a>
						|
					</li>
					<li>
						<a>联系我们</a>
						|
					</li>
					<li>
						<a>招贤纳士</a>
						|
					</li>
					<li>
						<a>法律声明</a>
						|
					</li>
					<li>
						<a>友情链接</a>
						|
					</li>
					<li>
						<a target="_blank">支付方式</a>
						|
					</li>
					<li>
						<a target="_blank">配送方式</a>
						|
					</li>
					<li>
						<a>服务声明</a>
						|
					</li>
					<li>
						<a>广告声明</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2005-2017 酒店管理系统 版权所有</div>
	</div>
</div>
</body>
</html>