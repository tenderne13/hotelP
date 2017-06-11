<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">

	$(function(){
		getDate();
		getRoomState();
		
	});
	
	
	function getRoomState(){
		var reserTime=$("#reserveTime").val();
		if(reserTime.trim()==''){
			layer.tips('请选择预定日期','#reserveTime');
			return false;
		}
		$.post(
			"${ctx}/checkRoomStatus",{
				roomId:${hotel.roomId},
				reserveTime:reserTime
			},function(data){
				var htm="";
				if(data=='empty'){
					htm+='<div class="layui-form-item">'+
							       ' <div class="layui-input-block">'+
							     ' <button type="button" class="layui-btn"  style="width:140px;height:40px;" onclick="initPay(${hotel.roomId})">预定</button>'+
							    '</div>'+
					   	  '</div>';
				}else{
					htm+='<div class="layui-form-item">'+
							       ' <div class="layui-input-block">'+
							     ' <button type="button" class="layui-btn layui-btn-disabled"  style="width:140px;height:40px;">已预定</button>'+
							    '</div>'+
					   	  '</div>';
				}
				
				$("#buy").empty();
				$("#buy").append(htm);
			}
		);
	}
	
	//获取今天的日期
	function getDate(){
		var date=new Date();
		var year=date.getFullYear();
		var month=(date.getMonth()+1)<10?"0"+(date.getMonth()+1):date.getMonth()+1;
		var day=date.getDate()<10?"0"+date.getDate():date.getDate();
		var time=year+"-"+month+"-"+day;
		$("#reserveTime").val(time);
	}
	
	//确认订单页面
	function initPay(roomId){
		var reserveTime=$("#reserveTime").val();
		openMiddle("${ctx}/user/initPay?roomId="+roomId+"&reserveTime="+reserveTime);
	}
	
</script>
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
						<form class="layui-form" id="orderForm" action="">
							<div class="layui-form-item">
							  <div class="layui-inline">
							      <label class="layui-form-label">预订日期</label>
							      <div class="layui-input-inline">
							        <input type="text" name="reserveTime" id="reserveTime"  readonly="readonly" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this,min: laydate.now(0)})">
							      </div>
						   	  </div>
						   	  <div class="layui-inline">
							        <div class="layui-input-inline">
								      <button type="button" class="layui-btn" onclick="getRoomState();">查询</button>
								    </div>
						   	  </div>
						    </div> 
						   	  <hr>
						   	  
						   	  <div id="buy">
						   	  
						   	  </div>
							
						</form>
						
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