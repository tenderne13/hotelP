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
				"${ctx}/admin/getOrderList",{
					pageNo:pageNo,
					pageSize:pageSize,
					reserveTime:$("#reserveTime").val(),
					name:$("#name").val(),
					orderCodes:$("#orderCodes").val()
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
						'<td>'+item.orderCodes+'</td>'+
						'<td>'+item.roomName+'</td>'+
						'<td>'+item.reserveTime+'</td>'+
						'<td>'+item.contactPerson+'</td>'+
						'<td>'+item.mobilePhone+'</td>'+
						'<td>'+item.totalPrice+'</td>';
				if(item.orderStatus==1){
					str+='<td>已支付</td>'+
						'<td><button class="layui-btn" style="width:80px;text-align:center;">入住登记</button></td>'+
				 	 	'</tr>';
				}else{
					str+='<td>未支付</td>'+
						'<td><button class="layui-btn layui-btn-disabled" style="width:80px;text-align:center;">入住登记</button></td>'+
				 	 	'</tr>';
				}
						
				
				arr.push(str);
						
			});
			return arr.join('');
		}
		
		
		function initPay(roomId){
			var reserveTime=$("#reserveTime").val();
			openMiddle("${ctx}/user/initPay?roomId="+roomId+"&reserveTime="+reserveTime);
		}
</script>
</head>
<body>


<div class="container index" style="padding-top:75px;">
		
		
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
			    <label class="layui-form-label">订单编号</label>
			    <div class="layui-input-block">
			      <input type="text" name="orderCodes" id="orderCodes" lay-verify="title" autocomplete="off" placeholder="请输入订单编号" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-inline">
			      <label class="layui-form-label">预订日期</label>
			      <div class="layui-input-inline">
			        <input type="text" name="reserveTime" id="reserveTime" readonly="readonly" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
			      </div>
		   	  </div>
			  <div class="layui-inline">
			        <div class="layui-input-block">
				      <button type="button" class="layui-btn" onclick="doSearch(currPage)">查询</button>
				    </div>
		   	  </div>
			</form>
		</div>
		<div class="content" id="content" style="padding:15px 5px 0px 0px">
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
				    <th>订单编号</th>
					<th>房间编号</th>
					<th>预定日期</th>
					<th>联系人</th>
					<th>联系电话</th>
					<th>总金额</th>
					<th>订单状态</th>
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