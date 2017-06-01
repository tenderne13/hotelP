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
<link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${ctx}/static/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/js2.0/layer/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"  src="${ctx}/static/js/ajaxfileupload/ajaxfileupload.js"></script>
<script type="text/javascript">
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
	
	<div id="bottom">
	
	</div>
</body>
</html>