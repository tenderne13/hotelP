<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>酒店管理系统</title>
<link href="${ctx}/static/css/reset.css" type="text/css"
	rel="stylesheet">
<link href="${ctx}/static/css/index.css" type="text/css"
	rel="stylesheet">
<script type="text/javascript" src="${ctx}/static/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/js2.0/layer/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"  src="${ctx}/static/js/ajaxfileupload/ajaxfileupload.js"></script>
<style type="text/css">
html,body {
	height: 100%;
}
</style>
<script type="text/javascript">
	function openright(src) {
		$('#right').load(src);
	}
	$(function(){
		
		$('#left').load("${ctx}/admin/home?position=left",function(){
			$('#right').load("${ctx}/admin/houseList");
		});
		$('#top').load("${ctx}/admin/home?position=top");
	})
</script>
</head>
<body>
	<div class="wrapper">
		<!-- 左侧菜单区域 -->
		<div id="left">
		</div>
		<!-- 内容区域 -->
		<div class="contetbox">
			<div id="top">
			</div>
			<div id="right">
				<!-- 工作台 -->
			</div>
		</div>
	</div>
	
</body>
</html>










