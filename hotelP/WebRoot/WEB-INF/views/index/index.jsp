<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>酒店</title>
<link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/static/layui/css/layui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${ctx}/static/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/layui/lay/dest/layui.all.js"></script>
<script type="text/javascript" src="${ctx}/static/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"  src="${ctx}/static/js/ajaxfileupload/ajaxfileupload.js"></script>
<style type="text/css">
	#middle{
		margin-top:10px;
	}
	#bottom{
		margin-top:10px;
	}
</style>
<script type="text/javascript">
var laypage;  
var layer;  
var form;  
var element;  
var laydate;
var navbar;
layui.use(['form','element'], function(){
		  form = layui.form(); //只有执行了这一步，部分表单元素才会修饰成功
		  element = layui.element();
  	}); 
$(function(){
	
	$("#top").load("${ctx}/position?meth=menu");
	$("#middle").load("${ctx}/position?meth=hotHouses");
	$("#bottom").load("${ctx}/position?meth=footer");
});


function openMiddle(src) {
	$('#middle').load(src);
}

</script>
</head>
<body>

	<div id="top">
	
	</div>	


	<div id="middle">
			
	</div>
	
	<div id="bottom" >
	
	</div>
</body>
</html>