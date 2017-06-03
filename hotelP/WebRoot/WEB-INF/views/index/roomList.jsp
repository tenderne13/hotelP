<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>酒店</title>
<script type="text/javascript">
$(function(){
	//getHotHouses();
	getDate();
});


		function getDate(){
			var date=new Date();
			var year=date.getFullYear();
			var month=(date.getMonth()+1)<10?"0"+(date.getMonth()+1):date.getMonth()+1;
			var day=date.getDate()<10?"0"+date.getDate():date.getDate();
			var time=year+"-"+month+"-"+day;
			$("#reserveTime").val(time);
		}
</script>
</head>
<body>


<div class="container index">
		
		
		<div id="search">
			<form class="layui-form" action="">
			  <input type="hidden" name="category" id="category" value=""/>
			  <div class="layui-inline">
			    <label class="layui-form-label">房间号</label>
			    <div class="layui-input-block">
			      <input type="text" name="name" lay-verify="title" autocomplete="off" placeholder="请输入房间号" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-inline">
			      <label class="layui-form-label">预订日期</label>
			      <div class="layui-input-inline">
			        <input type="text" name="reserveTime" id="reserveTime" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
			      </div>
		   	  </div>
			  <div class="layui-inline">
			        <div class="layui-input-block">
				      <button type="button" class="layui-btn">查询</button>
				    </div>
		   	  </div>
			</form>
		</div>
		<div class="content" id="content">
			<table class="layui-table"  lay-skin="row">
			  <colgroup>
			    <col width="150">
			    <col width="200">
			    <col>
			  </colgroup>
			  <thead>
			    <tr>
				    <th>照片</th>
					<th>房间编号</th>
					<th>价格</th>
					<th>类别</th>
					<th>房间状态</th>
					<th>操作</th>
			    </tr> 
			  </thead>
			  <tbody>
			    <tr>
			      <td><img src="/hotelP//image//fe24d39f-d96a-4f5f-9fdd-96682f9fba05.jpg" id="image" height="80" width="80"></td>
			      <td>2016-11-29</td>
			      <td>人生就像是一场修行</td>
			      <td>人生就像是一场修行</td>
			      <td>人生就像是一场修行</td>
			      <td>人生就像是一场修行</td>
			    </tr>
			    <tr>
			      <td>贤心</td>
			      <td>2016-11-29</td>
			      <td>人生就像是一场修行</td>
			      <td>人生就像是一场修行</td>
			      <td>人生就像是一场修行</td>
			      <td>人生就像是一场修行</td>
			    </tr>
			  </tbody>
			</table>
		</div>
		<div class="loading-more" id="page">加载更多</div>
		
</div>
<script type="text/javascript">
form.render();
element.init();
</script>
</body>
</html>