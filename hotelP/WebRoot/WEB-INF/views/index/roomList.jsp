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
		var currPage;
		var pageSize=5;
		$(function(){
			if(currPage==undefined||!currPage){
				currPage=1;
			}
			//getHotHouses();
			getDate();
			doSearch(currPage);
		});

		//获取今天的日期
		function getDate(){
			var date=new Date();
			var year=date.getFullYear();
			var month=(date.getMonth()+1)<10?"0"+(date.getMonth()+1):date.getMonth()+1;
			var day=date.getDate()<10?"0"+date.getDate():date.getDate();
			var time=year+"-"+month+"-"+day;
			$("#reserveTime").val(time);
		}
		//查询列表方法
		function doSearch(pageNo){
			$.post(
				"${ctx}/getHousesByCategory",{
					pageNo:pageNo,
					pageSize:pageSize,
					reserveTime:$("#reserveTime").val(),
					name:$("#name").val(),
					category:$("#category").val()
				},function(data){
					var rows=data.rows;
	        		laypage({
			  		     cont: 'page',
			  		     pages: Math.ceil(data.total/pageSize), //得到总页数
			  		     groups: pageSize,
			  		     skin:'#c2c2c2',
			  		     //first:true,
			  		     //last:true,
			  		     curr:data.pageNo,
			  		     jump: function(obj,first){
			  		    	 $("#bodyContent").empty();
			  		    	 $("#bodyContent").append(createRender(obj.curr,rows));
			  		    	 if(!first){ //点击跳页触发函数自身，并传递当前页：obj.curr
			  		    		//$("#pager").val(obj.curr);
			                	doSearch(obj.curr);
			                 }
			  		    }
			  		  });					
				}
			);
		}
		
		//创建列表渲染器
		function createRender(curr,data){
			var arr=[];
			var str='';
			layui.each(data,function(index,item){
				str=    '<tr>'+
						'<td><img src="${ctx}/'+item.photo+'" id="image" height="80" width="80"></td>'+
						'<td>'+item.name+'</td>'+
						'<td>'+item.category+'</td>'+
						'<td>'+item.price+'</td>';
				if(item.status==1){
					str+='<td><button class="layui-btn layui-btn-warm" onclick="openMiddle(\'${ctx}/initRoomDetail?roomId='+item.roomId+'\')"><i class="layui-icon">&#xe615;</i></button>'+
						 '<button class="layui-btn layui-btn-disabled">已预订</button></td>'+
					 	 '</tr>';
				}else{
					str+='<td><button class="layui-btn layui-btn-warm" onclick="openMiddle(\'${ctx}/initRoomDetail?roomId='+item.roomId+'\')"><i class="layui-icon">&#xe615;</i></button>'+
						     '<button class="layui-btn">预订</button></td></tr>';
				}
				
				arr.push(str);
						
			});
			return arr.join('');
		}
</script>
</head>
<body>


<div class="container index">
		
		
		<div id="search">
			<form class="layui-form" action="">
			  <input type="hidden" name="category" id="category" value="${category }"/>
			  <div class="layui-inline">
			    <label class="layui-form-label">房间号</label>
			    <div class="layui-input-block">
			      <input type="text" name="name" id="name" lay-verify="title" autocomplete="off" placeholder="请输入房间号" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-inline">
			      <label class="layui-form-label">预订日期</label>
			      <div class="layui-input-inline">
			        <input type="text" name="reserveTime" id="reserveTime" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this,min: laydate.now(0)})">
			      </div>
		   	  </div>
			  <div class="layui-inline">
			        <div class="layui-input-block">
				      <button type="button" class="layui-btn" onclick="doSearch(currPage)">查询</button>
				    </div>
		   	  </div>
			</form>
		</div>
		<div class="content" id="content">
			<table class="layui-table"  lay-skin="row">
			  <colgroup>
			    <col width="100">
			    <col>
			    <col>
			    <col>
			    <col width="200">
			  </colgroup>
			  <thead>
			    <tr>
				    <th>照片</th>
					<th>房间编号</th>
					<th>房间类别</th>
					<th>价格</th>
					<th>操作</th>
			    </tr> 
			  </thead>
			  <tbody id="bodyContent">
			  
			  
			  </tbody>
			</table>
		</div>
		<div class="loading-more" id="page"></div>
		
</div>
<script type="text/javascript">
form.render();
element.init();
</script>
</body>
</html>