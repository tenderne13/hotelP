<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>订单页面</title>
<style type="text/css">
	.layui-form-label{
		text-align:left
	}
</style>
</head>
<body>

<script type="text/javascript">
	//继续预定
	function reserve(){
		$("#middle").load("${ctx}/position?meth=hotHouses");
	}
</script>
<div class="container cart">

		<div class="span24">
		
			<div class="step step1">
				<blockquote class="layui-elem-quote">订单生成成功<i class="layui-icon" style="font-size: 39px; color: green;">&#xe618;</i>  </blockquote>
				<blockquote class="layui-elem-quote">订单编号:<strong ><font color="green" size="6px">${orderCodes }</font></strong></blockquote>
			</div>
	
			<hr>
			  
			  
			  <div class="layui-form-item" style="text-align:center">
			    <div class="layui-inline">
			    	<button class="layui-btn layui-btn-warm layui-btn-big" onclick="" style="width:200px"><i class="layui-icon">&#xe63c;</i>&nbsp;&nbsp;支付订单</button>
			    </div>
			    <div class="layui-inline">
			    	<button class="layui-btn  layui-btn-big" onclick="reserve();" style="width:200px"><i class="layui-icon">&#xe63c;</i>&nbsp;&nbsp;继续预定</button>
			    </div>
			  </div>
			  
			
			
		</div>
		
	</div>
<script type="text/javascript">
form.render();
element.init();
</script>
</body>
</html>