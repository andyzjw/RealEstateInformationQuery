<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册页面</title>
<link href="${pageContext.request.contextPath}/css/register.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div class="register">
		<form action="${pageContext.request.contextPath}/register" method="post">
			<table align="center">
				<caption>账号注册</caption>
				<tr>
					<td>身份证号a：</td>
					<td><input name="cardId" ></td>
					<td></td>
				</tr>
				<tr>
					<td>用&nbsp;&nbsp;户&nbsp;&nbsp;名：</td>
					<td><input name="userName" maxlength="25"></td>
					<td></td>
				</tr>
				<tr>
					<td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
					<td><input type="password" name="password"></td>
					<td></td>
				</tr>
				<tr>
					<td>确认密码：</td>
					<td><input type="password" class="checkAgain"></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="注册">&nbsp;
					 <input type="button" value="返回" onclick="history.back()">
					</td>
					<td></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/register.js"></script>
<script type="text/javascript">
	if("${registerMsg}"){
		var flag = confirm("注册成功，现在去登录吗！");
		if(flag){
			window.location="/RealEstateInformationQuery/login.jsp"
		}else{
			window.location="register.jsp"
		}
	}
</script>
<c:remove var="registerMsg" scope="session"/>
</html>