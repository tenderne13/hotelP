<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>订单页面</title>
<style type="text/css">
	.layui-form-label{
		text-align:left
	}
</style>
</head>
<body>

<script type="text/javascript">
	function pay(){
		var contactPerson=$("#contactPerson").val();
		var mobilePhone=$("#mobilePhone").val();
		if(contactPerson.trim()==''){
			layer.tips('请填写联系人','#contactPerson');
			$("#contactPerson").focus();
			return false;
		}
		if(mobilePhone.trim()==''){
			layer.tips('请填写联系方式','#mobilePhone');
			$("#mobilePhone").focus();
			return false;
		}
		
		$.post(
			"${ctx}/user/confirmOrder?"+$("#orderForm").serialize(),function(data){
				if(data=='success'){
					layer.msg("订单已生成",{icon:1});
					var orderCodes=$("#orderCodes").val();
					openMiddle('${ctx }/user/confirmSuccess?orderCodes='+orderCodes);
				}
			}
		);
		
	}
</script>
<div class="container cart">

		<div class="span24">
		
			<div class="step step1">
				<blockquote class="layui-elem-quote">订单生成中。。。</blockquote>
			</div>
	
		
				<table class="layui-table">
					<tbody>
					<tr>
						<th>图片</th>
						<th>房间号</th>
						<th>入住日期</th>
						<th>房间类别</th>
						<th>价格</th>
					</tr>
					
						<tr>
							<td width="80">
								<img src="${ctx}/${hotel.photo}"  height="80" width="80">
							</td>
							<td>
								${hotel.name }
							</td>
							<td>
								${order.reserveTime }
							</td>
							<td>
								${hotel.category }
							</td>
							<td width="140">
								<span class="subtotal">￥${hotel.price}</span>
							</td>
							
						</tr>
				</tbody>
			</table>
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
					<em id="promotion"></em>
					应付金额: <strong id="effectivePrice" >￥<font color="red">${hotel.price}</font>元</strong>
				</div>
			<hr>
			<form class="layui-form" id="orderForm" action="">
			  <input type="hidden" name="category" id="category" value="${hotel.category }"/>
			  <input type="hidden" name="roomId" id="roomId" value="${hotel.roomId }"/>
			  <input type="hidden" name="name" id="name" value="${hotel.name }"/>
			  <input type="hidden" name="reserveTime"  value="${order.reserveTime }"/>
			  <input type="hidden" name="orderCodes" id="orderCodes"  value="${order.orderCodes }"/>
			  <input type="hidden" name="price"  value="${hotel.price }"/>
			  <div class="layui-form-item">
			    <label class="layui-form-label">联系人</label>
			    <div class="layui-input-block">
			      <input type="text" style="width:300px" name="contactPerson" id="contactPerson" lay-verify="title" autocomplete="off" placeholder="请输入联系人" value="${sessionScope.user.nickName}" class="layui-input">
			    </div>
			  </div>
			  
			  <div class="layui-form-item">
			      <label class="layui-form-label">联系方式</label>
			      <div class="layui-input-block">
			      <input type="text" style="width:300px" name="mobilePhone" id="mobilePhone" lay-verify="title" autocomplete="off" placeholder="请输入联系方式" class="layui-input">
			   </div>
			  
		   	  </div>
		   	  
			    
			  </form>
			  <!-- <hr>
			  <div class="layui-form-item">
			    <div class="layui-inline">
			    	<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
			    	<img src="${ pageContext.request.contextPath }/bank_img/icbc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    	<input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
					<img src="${ pageContext.request.contextPath }/bank_img/bc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
					<img src="${ pageContext.request.contextPath }/bank_img/abc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<br/>
					<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
					<img src="${ pageContext.request.contextPath }/bank_img/bcc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>平安银行
					<img src="${ pageContext.request.contextPath }/bank_img/pingan.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
					<img src="${ pageContext.request.contextPath }/bank_img/ccb.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<br/>
					<input type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>光大银行
					<img src="${ pageContext.request.contextPath }/bank_img/guangda.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>招商银行
					<img src="${ pageContext.request.contextPath }/bank_img/cmb.bmp" align="middle"/>
			    </div>
			  </div> -->
			  
			  <hr>
			  
			  <div class="layui-form-item">
			    <div class="layui-inline">
			    	<button class="layui-btn layui-btn-warm layui-btn-big" onclick="pay()" style="width:200px"><i class="layui-icon">&#xe63c;</i>&nbsp;&nbsp;确认订单</button>
			    </div>
			  </div>
			  
			
			
		</div>
		
	</div>
<script type="text/javascript">
form.render();
element.init();
</script>
</body>
</html>