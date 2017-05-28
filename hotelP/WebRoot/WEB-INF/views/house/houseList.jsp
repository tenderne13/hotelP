<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>消防栓台账</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<script type="text/javascript" src="${ctx}/static/js/js2.0/util.js"></script>
<script type="text/javascript">
	var firstLoading;
	$(function() {
		getDate();
		//获取列表数据
		getInstallationData($("#pageNo").val());
	});
	
	function getDate(){
		var date=new Date();
		var year=date.getFullYear();
		var month=(date.getMonth()+1)<10?"0"+(date.getMonth()+1):date.getMonth()+1;
		var day=date.getDate()<10?"0"+date.getDate():date.getDate();
		var time=year+"-"+month+"-"+day;
		$("#time").val(time);
	}
	
	
	
	//获取列表数据
	function getInstallationData(pageNo) {
		var search = $("#search").serialize();
		$.post(
				"${ctx}/admin/getHouseData?" + search,
				{
					pageNo : pageNo,
				},
				function(dataList) {
					var dataTable = $('#dataList');
					var listDataJson = dataList.rows;
					dataTable.empty();
					var str="";
					if(listDataJson!=null){
						for ( var i = 0; i < listDataJson.length; i++) {
							str+="<tr class='tr-td'>"
									+ "<td>"
									+ listDataJson[i].photo
									+ "</td>"
									+ "<td>"
									+ listDataJson[i].name
									+ "</td>"
									+ "<td>"
									+ listDataJson[i].price
									+ "</td>"
									+ "<td>"
									+ listDataJson[i].category
									+ "</td>";
							if(listDataJson[i].status==0){
								str+="<td>未预定</td>";
							}else{
								str+="<td>已预定</td>";
							}
								str+= "<td>"
									+ "<div class='operate'>"
									+ "<a href='#' title='编辑' onclick='updateHotel(\""+listDataJson[i].roomId+"\")'  class='h-icon i-edits'></a>"
									+ "<a href='#' title='删除' onclick='delIns(\""+listDataJson[i].roomId+"\")' class='h-icon i-delete'></a>"
									+ "</div>"
									+ "</td>"
									+ "</tr>";
						}
						dataTable.append(str);
						//清空分页条
						$('#pageBtn').empty();
						//添加分页条，需要引入${ctx}/static/jquery/util.js 具体方法注释在util.js内
						$('#pageBtn')
								.append(
										getfenyetiao(dataList.total,
												dataList.pageSize,
												dataList.pageNo,
												"getInstallationData"));
						$('#pageNo').val(pageNo);
						layer.close(firstLoading);
					}else {
						$('#dataList').empty();
						$('#pageBtn').empty();
						$('#pageBtn').append(
						getfenyetiao(0, 10, 1, "getInstallationData"));
						$('#pageNo').val(pageNo);
					}
				});
	}
</script>
</head>
<body>
	<!-- 主要内容 -->
	<div class="fy-main">
		<div class="items">
			<div class="item info-edit">
				<div class="title">
					<div class="text">
						<h2 class="t">房间列表</h2>
					</div>
				</div>
				<div class="info">
					<input type="hidden" name="pageNo" id="pageNo" value="${pageNo }">
					<form id="search" action="#" method="post">
						<ul class="list clearfix">
							<li class="select"><span>房间号</span> <input id="deviceName"
								name="name" class="input" type="text" value="" /></li>
							<li class="select"><span>房间类别</span> 
								<select class="input" id="category" name="category">
										<option></option>
										<option value="单人间">单人间</option>
										<option value="双人间">双人间</option>
										<option value="商务间">商务间</option>
								</select>
							</li>
							
							<li class="posrl"><span>日期</span><input class="input" type="text"  id="time" name="reserveTime" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'%y-%M-%d'})" />
							</li>
						</ul>
						<div class="btn-box btnbox">
							<a href="#"  class="confirm button" id="chaxun">查 询</a> <a
								href="#" onclick="clean();" class="cancel button">重 置</a>
						</div>
					</form>
				</div>
			</div>

			<!-- 默认状态 -->
			<div class="item info-default">
				<div class="sq-cyxx clearfix">
					<div class="edit fr mb10"></div>
				</div>
				<div class="sq-cyxx clearfix">
							<div class="edit fr mb10">
								<%--<a class="btn plsc" href="#">批量删除</a>--%>
								<a class="btn add" href="#" id="add">新增房间</a>
							</div>
				</div>
				<div class="info tables">
					<table class="table" width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<colgroup>
							<col width="150">
							<col width="150">
							<col width="150">
							<col width="150">
							<col width="150">
							<col width="150">
						</colgroup>
						<thead>
							<tr class="tr-th">
								<th>照片</th>
								<th>房间编号</th>
								<th>价格</th>
								<th>类别</th>
								<th>房间状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="dataList">
						</tbody>
					</table>
					<div id="pageBtn" class="plus-page page"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
		function clean() {
			$("#deviceName").val("");
			$("#category").val("");
		}
		
		$("#chaxun").click(function(){
			getInstallationData($("#pageNo").val());
		});
		
		//新增页面跳转
		$("#add").click(function(){
			$("#right").load("${ctx}/admin/initHouseAdd");
		});
		
		//查看单个设备页面跳转
		function checkIns(id,objectId){
			var type=$("#type").val();
			var pageNo=$("#pageNo").val();
			$("#right").load("${ctx}/communityResources/installation/initDetail?type="+type+"&id="+id+"&pageNo="+pageNo);
		}
		//更新单个设备页面跳转
		function updateHotel(roomId){
			$("#right").load("${ctx}/admin/initHouseEdit?roomId="+roomId);
		}
		
		//删除单个设备,同时删除gis服务器数据
		function delIns(roomId){
			layer.confirm('确定要删除吗？',{btn:['确定','取消']},function(index, layero){
				layer.close(index);
				$.post(
					"${ctx}/admin/houseDel",{
						roomId:roomId
					},function(result){
						if(result=="success"){
							layer.msg("删除成功");
							getInstallationData($("#pageNo").val());
						}else{
							layer.msg("服务器异常其重试");
						}
					}						
				);
			},function(index, layero){
				layer.close(index);
			});
		}
	  
	</script>
</body>
</html>
