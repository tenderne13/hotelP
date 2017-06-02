<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>会员登录</title>

<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css"/>

<style>
	#loginDiv{
		left:50%;
	}
</style>
<script type="text/javascript">
		function loginCheck(){
			var userName=$("#username").val();
			var password=$("#password").val();
			if(userName.trim()==''){
				layer.msg("用户名不能为空");
				return false;
			}
			if(password.trim()==''){
				layer.msg("密码不能为空");
				return false;
			}
			
			$.post(
				"${ctx}/user/login",{
					userName:userName,
					password:password
				},function(message){
					if(message=='success'){
						layer.msg("登录成功");
						$("#top").load("${ctx}/position?meth=menu");
						$("#middle").load("${ctx}/position?meth=hotHouses");
					}else{
						layer.msg("用户名或密码不存在");
					}
				}		
			);
			
		}
	
</script>
</head>
<body>

<div class="container login" id="loginDiv">
		
		<div class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong>会员登录</strong>USER LOGIN 
						
					</div>
					<div></div>
					<form id="loginForm" action="#"  method="post" >
						<table>
							<tbody><tr>
								<th>
										用户名:
								</th>
								<td>
									<input type="text" id="username" name="username" class="text" maxlength="20" />
									
								</td>
							</tr>
							<tr>
								<th>
									密&nbsp;&nbsp;码:
								</th>
								<td>
									<input type="password" id="password" name="password" class="text" maxlength="20" autocomplete="off" />
								</td>
							</tr>
								
							
							<tr>
								<th>&nbsp;
									
								</th>
								<td>
									<input type="button" class="submit" value="登 录" id="login" onclick="loginCheck()" />
								</td>
							</tr>
							<tr class="register">
								<th>&nbsp;
									
								</th>
								<td>
									<dl>
										<dt>还没有注册账号？</dt>
										<dd>
											立即注册即可体验在线预定！
											<a href="#" onclick="openMiddle('${ctx }/user/initRegist')">立即注册</a>
										</dd>
									</dl>
								</td>
							</tr>
						</tbody></table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body></html>