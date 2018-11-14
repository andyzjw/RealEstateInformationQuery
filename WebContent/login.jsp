<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录页面</title>
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div class="login">
		<form action="${pageContext.request.contextPath}/userData/login" method="post">
			<table align="center">
				<caption>房产信息查询系统</caption>
				<tr>
					<td align="right">请输入身份证号：</td>
					<td><input name="cardId"></td>
				</tr>
				<tr>
					<td align="right">请输入密码：</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td></td>
					<td align="right"><input type="submit" value="登录">&nbsp;
					 <a href="${pageContext.request.contextPath}/pages/user/register.jsp">注册</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
if("${loginMsg}"!=""){
	alert("${loginMsg}");
}
</script>
<c:remove var="loginMsg" scope="session"/>
</html>