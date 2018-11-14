<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/main.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div class="main">
		<div class="top">
			<div class="title">房产信息查询系统</div>
			<div class="supbar">用户名：<span>${user.userName}</span>
			<a href="javascript:back()">退出</a></div>
		</div>
		<div class="middle">
			<div class="left">
				<ul>
					<li><a href="javascript:information()">房产信息查询</a></li>
				</ul>
			</div>
			<div class="right" id="right">
				<span>欢迎使用房产信息查询系统</span>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
<script type="text/javascript">
</script>
</html>