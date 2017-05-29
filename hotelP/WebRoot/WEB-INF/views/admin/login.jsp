<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>酒店管理系统管理中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="${ctx}/static/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/js2.0/layer/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/js/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
body {
  color: white;
}
</style>
</head>
<body style="background: #278296">
<center></center>
<form method="post" action="" target="_parent" name='theForm' id="loginForm" >
  <table cellspacing="0" cellpadding="0" style="margin-top: 100px" align="center">
  <tr>
    <td style="padding-left: 50px">
      <table>
      <tr>
        <td>管理员姓名：</td>
        <td><input type="text" name="userName"  id="userName" value=""/></td>
      </tr>
      <tr>
        <td>管理员密码：</td>
        <td><input type="password" name="password" id="password" value=""/></td>
      </tr>
      <tr><td>&nbsp;</td><td><input type="button" onclick="login()" value="进入管理中心" class="button" /></td></tr>
      </table>
    </td>
  </tr>
  </table>
  <input type="hidden" name="act" value="signin" />
</form>
<script language="JavaScript">
	function login(){
		if(checkEmpty()){
			$.post(
				"${ctx}/admin/login",{
					userName:$("#userName").val(),
					password:$("#password").val()
				},function(result){
					if(result=="success"){
						window.location.href = "${ctx}/admin/home";
					}else{
						layer.msg("密码错误请重新登录");
					}
				}
			);
		}
	}
	
	function checkEmpty(){
		var userName=$("#userName").val();
		if(userName.trim()==''){
			layer.msg("请填写用户名");
			return false;
		}
		
		var password=$("#password").val();
		if(password.trim()==''){
			layer.msg("请填写密码");
			return false;
		}
		
		return true;
	}
</script>
</body>