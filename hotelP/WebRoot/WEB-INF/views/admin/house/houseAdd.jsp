<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>房间添加</title>
<meta name="description" content="">
<meta name="keywords" content="">

</head>
<body>
	    
			<!-- 主要内容 -->
			<div class="fy-main">
				<div class="items">
					<!-- 默认状态 -->
					<div class="tabuser">
						<div class="username">
							<h2 class="t">新增房间</h2>
						</div>
					</div>
					<div class="item info-edit">
						<div class="info">
							<form action="#" method="post" id="fireplugForm">
								<input type="hidden" name="type" value="6">
								<ul class="list module-item clearfix">
									<li class="posrl"><span>房间编号</span><input class="input" type="text" id="name" name="name" placeholder="房间编号" value=""  /><em class="stress" id="locaEm">*</em></li>
									<li class="select"><span>房间类别</span> 
										<select class="input" id="category" name="category" >
												<option></option>
												<option value="单人间">单人间</option>
												<option value="双人间">双人间</option>
												<option value="商务间">商务间</option>
										</select>
									</li>
									<li><span>价格</span><input class="input" type="text" id="price" name="price" placeholder="价格" /></li>
									<li></li>
									
									
								</ul>
								<div class="dashed"></div>
								
								<div class="btn-box">
									<a href="#" class="save button" id="saveBtn" onclick="fireplugSave()">保 存</a>
									<a href="#" class="cancel button" id="cancleBtn" onclick="cancleSave()">取 消</a>
								</div>
							</form>
						</div>

					</div>

				</div>
			</div>
		<script type="text/javascript">
			function fireplugSave(){
				if(locationCheck()&&cateCheck()&&priceCheck()){
					var fireplugForm=$("#fireplugForm").serialize();
					$.post(
						"${ctx}/admin/houseAdd?"+fireplugForm,function(result){
							if(result=="success"){
								layer.msg("保存成功!");
								$("#right").load("${ctx}/admin/houseList");
							}else{
								layer.alert("服务器异常请重试~");
							}
						}
								
					);
				}
				
				
			}
			
			function cancleSave(){
				$("#right").load("${ctx}/admin/houseList");
			}
		
		//位置框校验
		function locationCheck(){
			var location=$("#name").val();
			if(location.trim()==''){
				$("#locaEm").html("不能为空");
				$("#name").focus();
				return false;
			}else{
				$("#locaEm").html("*");
				return true;
			}
		}
		
		function cateCheck(){
			var category=$("#category").find("option:selected").text(); 
			if(category.trim()==''){
				layer.msg("请选择房间类别");
				return false;
			}else{
				return true;
			}
		}
		
		function priceCheck(){
			var price =$("#price").val();
			if(price.trim()==''){
				layer.msg("请填写价格");
				return false;
			}else{
				return true;
			}
		}
		</script>
</body>
</html>
