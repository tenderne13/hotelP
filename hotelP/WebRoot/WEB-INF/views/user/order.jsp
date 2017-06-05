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


<div class="container cart">

		<div class="span24">
		
			<div class="step step1">
				<blockquote class="layui-elem-quote">订单生成中<i class="layui-icon" style="font-size: 30px; color:green;">&#xe63e;</i></blockquote>
			</div>
	
		
				<table class="layui-table">
					<tbody>
					<tr>
						<th colspan="5">订单编号:<font color="green">${order.orderCodes }</font></th>
					</tr>
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
			<form class="layui-form" action="">
			  <input type="hidden" name="category" id="category" value="${category }"/>
			  <div class="layui-inline">
			    <label class="layui-form-label">联系人</label>
			    <div class="layui-input-block">
			      <input type="text" style="width:300px" name="username" id="username" lay-verify="title" autocomplete="off" placeholder="请输入联系人" value="${sessionScope.user.nickName}" class="layui-input">
			    </div>
			  </div>
			  
		   	  </div>
		   	  
		   	  <div class="layui-form-item">
			    <div class="layui-inline">
			      <label class="layui-form-label">联系方式</label>
			      <div class="layui-inline">
			      <input type="text" style="width:300px" name="mobile" id="mobile" lay-verify="title" autocomplete="off" placeholder="请输入联系方式" class="layui-input">
			    </div>
			  </div>
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
			    	<a href="javascript:;">
						<img src="${pageContext.request.contextPath}/images/finalbutton.gif" width="204" height="51" border="0" />
					</a>
			    </div>
			  </div>
			  
			</form>
			
		</div>
		
	</div>
<script type="text/javascript">
form.render();
element.init();
</script>
</body>
</html>