<%@page import="org.bmj.ims.vo.IdolGroup"%>
<%@page import="org.bmj.ims.dao.IdolsDAO"%>
<%@page import="org.bmj.ims.vo.Idol"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idolIdStr = request.getParameter("idolId");
	int idolId = Integer.parseInt(idolIdStr);
	Idol idolGroup = IdolsDAO.selectOne(idolId);
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>idolGroup.getName()의 상세페이지 | IMS</title>
<link rel="stylesheet" href="/css/notosanskr.css" />
<link rel="stylesheet" href="/css/all.min.css" />
<link rel="stylesheet" href="/css/default.css" />
<style>
	dt,dd{
		float:left;
	}
	dt {
		clear:both;
	}
	dl{
		/*dl이 공간을 차지하도록 */
		overflow : hidden;
	}
</style>
</head>
<body>
	<h1><a href="/"><i class="fas fa-address-book"></i>  Awesome Idol Management Service</a></h1>
	<h2><%=idolGroup.getName() %></h2>	
	<dl>
		<dt>이름</dt>
		<dd><%=idolGroup.getName() %></dd>
		<dt>키</dt>
		<dd><%=idolGroup.getHeight() %></dd>
		<dt>몸무게</dt>
		<dd><%=idolGroup.getWeight() %></dd>
		<dt>성별</dt>
		<dd><%=idolGroup.getGender() %></dd>
		<dt>생일</dt>
		<dd><%=idolGroup.getBirthDate() %></dd>
		<dt>그룹명</dt>
		<dd><a href="/groupDetail.jsp?groupId=<%=idolGroup.getGroupId() %>"><%=idolGroup.getGroupName() %></a></dd>
	</dl>

	<a class="btn" href="/idolDelete.jsp?idolId=<%=idolGroup.getIdolId() %>"><i class="fas fa-user-friends"></i> 삭제하기</a>
	<a class="btn" href="/idolList.jsp"><i class="fas fa-user-friends"></i> 목록으로</a>
</body>
</html>