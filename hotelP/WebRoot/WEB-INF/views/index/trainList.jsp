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
<style type="text/css">
	.side{
		bottom:0;
		right:0;
		overflow-x:hidden;
		position:fixed;
		top:0;
		z-index:999;
	}
</style>
<script type="text/javascript">
		var loading;
		$(function(){
			getData();
		});

		function getNews(category){
			$("#category").val(category);
			$("#nextTime").val("0");
			$("#bodyContent").empty();
			getData();
		}
		
		
		//获取今日头条消息
		function getData(){
			loading=layer.load(1,{shadeClose:true,shade:0.4});;
			var attr=getParam();
			attr=JSON.parse(attr);
			attr.category=$("#category").val();
			attr.max_behot_time=$("#nextTime").val();
			$.get(
				"${ctx}/news",attr,function(data){
					var hasMore=JSON.parse(data).has_more;
					if(hasMore){
						$("#nextTime").val(JSON.parse(data).next.max_behot_time);
						$("#more").html("点击加载更多<i class='layui-icon'>&#x1002;</i>");
						$("#more").attr("onclick","getData()");
					}else{
						$("#more").html("没有更多了。。。");
						$("#more").attr("onclick","");
					}
					data=JSON.parse(data).data;
					var htm="";
					if(data!=undefined && data.length>0){
						for(var i=0;i<data.length;i++){
							if(data[i].is_feed_ad==false){
								if(data[i].image_url!=undefined){
									htm+=    '<tr>'+
									'<td><a href="javaScript:;" onclick="initNews(\''+data[i].source_url+'\')"><img src="'+data[i].image_url+'" id="image" height="80" width="80"></a></td>'+
									'<td><a href="javaScript:;" onclick="initNews(\''+data[i].source_url+'\')">'+data[i].title+'</a></td>'+
									'<td>'+data[i].source+'</td>'+
									'<td>'+
								     '<button class="layui-btn layui-btn-primary" onclick="initNews(\''+data[i].source_url+'\')"><i class="layui-icon">&#xe64c;</i></button>'+
								     '</td>'+
								     '</tr>';
								}else{
									htm+=    '<tr>'+
									'<td><a href="javaScript:;" onclick="initNews(\''+data[i].source_url+'\')"><img src="${ctx}/static/images/logo.png" id="image" height="80" width="80"></a></td>'+
									'<td><a href="javaScript:;" onclick="initNews(\''+data[i].source_url+'\')">'+data[i].title+'</a></td>'+
									'<td>'+data[i].source+'</td>'+
									'<td>'+
								     '<button class="layui-btn layui-btn-primary" onclick="initNews(\''+data[i].source_url+'\')"><i class="layui-icon">&#xe64c;</i></button>'+
								     '</td>'+
								     '</tr>';
								}
								
							}
						}
					}
					$("#bodyContent").append(htm);
					layer.close(loading);
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
		
</script>
</head>
<body>


<div class="container index">
		<div id="type">
			<!-- <ul class="layui-nav layui-nav-tree" lay-filter="test">-->
			<ul class="layui-nav layui-nav-tree side" id="side"> 
			  <li class="layui-nav-item layui-this">
			  	  <a href="javascript:;" onclick="getNews('')">推荐</a>
			  </li>
			  <li class="layui-nav-item">
			  	  <a href="javascript:;" onclick="getNews('news_hot')">热点</a>
			  </li>
			  <li class="layui-nav-item">
			  	  <a href="javascript:;" onclick="getNews('news_story')">故事</a>
			  </li>
			  <li class="layui-nav-item">
			  	  <a href="javascript:;" onclick="getNews('news_sports')">体育</a>
			  </li>
			  <li class="layui-nav-item">
			  	  <a href="javascript:;" onclick="getNews('funny')">搞笑</a>
			  </li>
			</ul>			
		</div>
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
			<input type="hidden" id="category">
			<input type="hidden" id="nextTime">
			<table class="layui-table"  lay-even lay-skin="nob">
			  <colgroup>
			    <col width="100">
			    <col>
			    <col>
			    <col>
			  </colgroup>
			  <thead>
			    <tr>
				    <!-- <th>照片</th>
					<th>标题</th>
					<th>来源</th>
					<th>操作</th> -->
			    </tr> 
			  </thead>
			  <tbody id="bodyContent">
			  
			  
			  </tbody>
			</table>
			<div class="laypage_next" id="page"><a href="javaScript:;" id="more"></a></div>
		</div>
		
		
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