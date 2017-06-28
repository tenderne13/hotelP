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
			$.get(
				"http://www.toutiao.com/api/pc/feed/?min_behot_time=0&category=__all__&utm_source=toutiao&widen=1&tadrequire=true&as=A12599F553877CD&cp=5953A7473C8D5E1",
						function(data){
					console.log(data);
					alert(data);
				}
			);
			//doSearch(currPage);
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
				"${ctx}/queryLeftTicket",{
					pageNo:pageNo,
					pageSize:pageSize,
					reserveTime:$("#reserveTime").val(),
					name:$("#name").val(),
					category:$("#category").val()
				},function(data){
					data = JSON.parse(data);
					var result=data.data.result;
					var list=b2(result);
					console.log(list[0]);
					alert(list[0].queryLeftNewDTO.arrive_time);
	        		/*laypage({
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
			  		  });	*/				
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
						     '<button class="layui-btn" onclick="initPay(\''+item.roomId+'\')">预订</button></td></tr>';
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
			        <input type="text" name="reserveTime" id="reserveTime" readonly="readonly" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this,min: laydate.now(0)})">
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
function b2(cp) {
	var co = [];
	for (var cn = 0; cn < cp.length; cn++) {
		var cs = [];
		var cm = cp[cn].split("|");
		cs.secretStr = cm[0];
		cs.buttonTextInfo = cm[1];
		var cq = [];
		cq.train_no = cm[2];
		cq.station_train_code = cm[3];
		cq.start_station_telecode = cm[4];
		cq.end_station_telecode = cm[5];
		cq.from_station_telecode = cm[6];
		cq.to_station_telecode = cm[7];
		cq.start_time = cm[8];
		cq.arrive_time = cm[9];
		cq.lishi = cm[10];
		cq.canWebBuy = cm[11];
		cq.yp_info = cm[12];
		cq.start_train_date = cm[13];
		cq.train_seat_feature = cm[14];
		cq.location_code = cm[15];
		cq.from_station_no = cm[16];
		cq.to_station_no = cm[17];
		cq.is_support_card = cm[18];
		cq.controlled_train_flag = cm[19];
		cq.gg_num = cm[20] ? cm[20] : "--";
		cq.gr_num = cm[21] ? cm[21] : "--";
		cq.qt_num = cm[22] ? cm[22] : "--";
		cq.rw_num = cm[23] ? cm[23] : "--";
		cq.rz_num = cm[24] ? cm[24] : "--";
		cq.tz_num = cm[25] ? cm[25] : "--";
		cq.wz_num = cm[26] ? cm[26] : "--";
		cq.yb_num = cm[27] ? cm[27] : "--";
		cq.yw_num = cm[28] ? cm[28] : "--";
		cq.yz_num = cm[29] ? cm[29] : "--";
		cq.ze_num = cm[30] ? cm[30] : "--";
		cq.zy_num = cm[31] ? cm[31] : "--";
		cq.swz_num = cm[32] ? cm[32] : "--";
		cq.srrb_num = cm[33] ? cm[33] : "--";
		cq.yp_ex = cm[34];
		cq.seat_types = cm[35];
		cq.from_station_name = cm[6];
		cq.to_station_name = cm[7];
		cs.queryLeftNewDTO = cq;
		delete cs.queryLeftNewDTO.wrappedJSObject;
		co.push(cs)
	}
	return co
}
form.render();
element.init();
</script>
</body>
</html>