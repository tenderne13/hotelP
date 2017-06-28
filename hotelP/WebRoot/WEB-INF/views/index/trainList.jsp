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
			//doSearch(currPage);
			getNews();
		});

		//获取今日头条消息
		function getNews(){
			var attr=getParam();
			attr=JSON.parse(attr);
			$.get(
				"${ctx}/news",attr,function(data){
					data=JSON.parse(data).data;
					var htm="";
					if(data!=undefined && data.length>0){
						for(var i=0;i<data.length;i++){
							if(data[i].is_feed_ad==false){
								htm+=    '<tr>'+
								'<td><img src="'+data[i].image_url+'" id="image" height="80" width="80"></td>'+
								'<td>'+data[i].title+'</td>'+
								'<td>'+data[i].chinese_tag+'</td>'+
								'<td>'+data[i].source+'</td>'+
								'<td>'+
							     '<button class="layui-btn" onclick="initNews(\''+data[i].source_url+'\')">查看</button>'+
							     '</td>'+
							     '</tr>';
							}
							
						}
					}
					$("#bodyContent").append(htm);
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
		
		//打开今日头条新闻
		function initNews(sourceUrl){
			var baseurl="http://www.toutiao.com/";
			window.open(baseurl+sourceUrl);
		}
		
		
		function initPay(roomId){
			var reserveTime=$("#reserveTime").val();
			openMiddle("${ctx}/user/initPay?roomId="+roomId+"&reserveTime="+reserveTime);
		}
</script>
</head>
<body>


<div class="container index">
		
		
		<!-- <div id="search">
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
		</div> -->
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
					<th>标题</th>
					<th>类别</th>
					<th>来源</th>
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