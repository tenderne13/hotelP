<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>酒店</title>
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
						 '	<a href="#" onclick="openMiddle(\'${ctx}/initRoomDetail?roomId='+houses[i].roomId+'\')"><img src="${ctx}/'+houses[i].photo+'"   style="display: block;"/></a>'+
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

</body>
</html>