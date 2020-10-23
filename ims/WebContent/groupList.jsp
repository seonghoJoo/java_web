<%@page import="org.bmj.ims.util.PaginateUtil"%>
<%@page import="org.bmj.ims.vo.PageVO"%>
<%@page import="org.bmj.ims.dao.GroupsDAO"%>
<%@page import="org.bmj.ims.vo.Group"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("page");	
	// 기본값을 1로
	int pageNo = 1; // 현재페이지
	// if문쓰지 않은 이유 / noStr이 sljdfhb 같은 문자열 받은 경우 numberFormatException을 띄워야 함
	try{
		pageNo = Integer.parseInt(noStr);
	}catch(Exception e){
	}// try~catch
	// 한 페이지당 보여질 게시물 수
	
	int numPage = 3; // 한페이지당 보여질 게시물 수
	PageVO pageVO = new PageVO(pageNo, numPage);
	List<Group> groups = GroupsDAO.selectList(pageVO); 
	
	int total = GroupsDAO.selectTotal(); // 전체 게시물 수
	int numBlock = 5; // 블록 개수
	
	String url = "/groupList.jsp"; // 페이지 주소
	String param = "page=";
	
	String pagiNate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);	


	//List<Group> groups = GroupsDAO.selectList();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>그룹목록 | AIMS</title>
	
<link rel="stylesheet" href="/css/reset.css"/>
<link rel="stylesheet" href="/css/all.min.css"/>
<link rel="stylesheet" href="/css/notosanskr.css"/>
<link rel="stylesheet" href="/css/default.css" />
<link rel="stylesheet" href="/css/paginate.css" />
</head>
<body>
	<h1><a href="/"><i class="far fa-address-book"></i>  Awesome Idol Management Service</a></h1>
	<h2><i class="fas fa-user-friends"></i> 그룹목록</h2>
	<ul>
		<% for(Group group : groups) {%>
		<li><a href="/groupDetail.jsp?groupId=<%=group.getGroupId() %>"><%=group.getGroupId()+") " + group.getName()%></a></li>
		
		<% } %>
	</ul>
	<%=pagiNate %>
	<a class="btn" href="/groupRegisterForm.jsp"><i class="fas fa-edit"></i> 그룹 등록 </a>
	<a class="btn" href="/index.jsp"><i class="fas fa-home"></i> 홈으로 </a>
</body>
</html>