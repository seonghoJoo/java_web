<%@page import="org.bmj.ims.dao.IdolsDAO"%>
<%@page import="org.bmj.ims.vo.Idol"%>
<%@page import="java.util.List"%>
<%@page import="org.bmj.ims.vo.Group"%>
<%@page import="org.bmj.ims.dao.GroupsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	String groupIdStr = request.getParameter("groupId");
	int groupId = Integer.parseInt(groupIdStr);
	Group group = GroupsDAO.selectOne(groupId);
	
	List<Idol> idols = IdolsDAO.selectListByGroupId(groupId);
%>   
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%=group.getName() %>의 상세페이지 | IMS</title>
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
	<h2><%=group.getName() %></h2>	
	<dl>
		<dt>번호</dt>
		<dd><%=group.getGroupId() %></dd>
		<dt>그룹명</dt>
		<dd><%=group.getName() %></dd>
		<dt>데뷔일</dt>
		<dd><%=group.getDebutDate() %></dd>
	</dl>
	<%if(idols.isEmpty()){ %>
		<h2>아이돌 없음</h2>
		<a class="btn" href="/groupDelete.jsp?groupId=<%=groupId%>"><i class="far fa-trash-alt"></i> 삭제</a>
	<%}else{ %>
		<h2>아이돌 목록</h2>
	<ul>
		<%for(Idol i : idols){ %>
		<li><a href="/idolDetail.jsp?idolId=<%=i.getIdolId() %>"><%=i.getName() %></a></li>
		<%} %>
	</ul>
	<%} %>

	<a class="btn" href="/groupList.jsp"><i class="fas fa-user-friends"></i> 목록으로</a>
</body>
</html>