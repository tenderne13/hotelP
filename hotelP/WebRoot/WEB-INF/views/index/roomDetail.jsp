<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="container productContent">
		
		<div class="span18 last">
			
			<div class="productImage">
					<a title="" style="outline-style: none; text-decoration: none;" id="zoom" href="" rel="gallery">
						<div class="zoomPad">
							<img style="opacity: 1;" title="" class="medium" src="${ctx}/${hotel.photo}">
						</div>
					</a>
				
			</div>
			<div class="name">房间编号: <strong style="color:green;">${hotel.name }</strong></div>
			<div class="info">
				<dl>
					<dt>价格:</dt>
					<dd>
						<strong>￥：${hotel.price }元/天</strong>
					</dd>
				</dl>
					<dl>
						<dt>    </dt>
						<dd>
							<span>    </span>
						</dd>
					</dl>
			</div>
			<form id="cartForm" action="${ pageContext.request.contextPath }/cart_addCart.action" method="post" >
				<input type="hidden" name="pid" />
				<div class="action">
						<dl class="quantity">
							<dt>购买数量:</dt>
							<dd>
								<input id="count" name="count" value="1" maxlength="4" onpaste="return false;" type="text"/>
							</dd>
							<dd>
								件
							</dd>
						</dl>
						
					<div class="buy">
							<input id="addCart" class="addCart" value="加入购物车" type="button" onclick="saveCart()"/>
					</div>
				</div>
			</form>
			<div id="bar" class="bar">
				<ul>
						<li id="introductionTab">
							<a href="#introduction">商品介绍</a>
						</li>
						
				</ul>
			</div>
				
				<div id="introduction" name="introduction" class="introduction">
					<div class="title">
						<strong></strong>
					</div>
					<div>
						<img src="${ctx}/${hotel.photo}">
					</div>
				</div>
				
				
				
		</div>
	</div>
</body>
</html>