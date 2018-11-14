<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>房产信息</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/info.css">
</head>
<body>
	<div class="realEstate">
		<div class="form">
		<form action="${pageContext.request.contextPath}/realEstate/query">
			<div class="title">房产信息查询</div>
			<div class="query">
				查询类别：<select name="condition">
							<option value="1"
							<c:if test="${condition==1}">selected</c:if>
							>用户名</option>
							<option value="2"
							<c:if test="${condition==2}">selected</c:if>
							>身份证</option>
						</select>
				<input name="index" 
				value="${index==''?'':index}"
				/> 
				<input  type="button" value="查找" onclick="query(1)">
			</div>
		</form>
		</div>
		<div class="table" >
		<table  style="margin:auto;">
			<tr bgcolor="lightblue">
				<th>序号</th>
				<th>项目名称</th>
				<th>产权人</th>
				<th>身份证号</th>
				<th>房屋类型</th>
				<th>使用面积</th>
				<th>建造时间</th>
			</tr>
			<c:forEach items="${estateInfo}" var="o" varStatus="i">
				<tr bgcolor="${i.index%2==0?'white':'lightgreen' }">
				<td>${o.id }</td>
				<td>${o.projectName }</td>
				<td>${o.name }</td>
				<td>${o.cardId }</td>
				<td>${o.houseType }</td>
				<td>${o.area }</td>
				<td>
					<fmt:formatDate value="${o.buildTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				</tr>
			</c:forEach>
		</table>
		</div>
		<div class="bottom">
			<a href="javascript:query(1);" >首页</a> |
			<a href="javascript:query(${pa.currPage-1});" >&lt;&lt;上一页</a> |
			<a href="javascript:query(${pa.currPage+1});">下一页&gt;&gt;</a>
			第${pa.currPage } 页/共${pa.totalPage==0?1:pa.totalPage} 页(${pa.count} 条)
		</div>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
function query(page){
	//alert("a");
	if(page>'${pa.totalPage}'){
		page=${pa.totalPage};
	}else if(page<1){
		page = 1;
	}
	/* alert("in"); */
	$.post(
		"/RealEstateInformationQuery/realEstate/query",
		{currPage:page,
		condition:$('[name="condition"]').val(),
		index:$('[name="index"]').val()
		},
		function(result){
			//alert(result);
	//alert(page);
			$('.right').html(result);
		},
		'html'
	);
}
</script>
</html>