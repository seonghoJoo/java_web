<%@page import="vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//HttpSession 객체 셋팅하는 이름들은 서로 공유해야함 coding convention
	Member loginMember = (Member)session.getAttribute("loginMember");
	// setAttribute , invalidate() 초기화 , removeAttribute(); 세가지가 있음.
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/template/link.jsp" %>
<link rel="stylesheet" href="/css/main.css"/>
</head>
<body>
	<h1>아주 멋진 웹서비스</h1>
	<% if(loginMember==null){ //로그인이 안된상태%>
	<h2>로그인</h2>
	<form action="/login.do" method="post">
		<fieldset>
			<legend>로그인 폼</legend>
			<p>
			<input name="id" placeholder="아이디"/>
			</p>
			<p>
			<input type="password" name="password" placeholder="비밀번호"/>
			</p>
			<button>로그인</button>
		</fieldset>
	</form>
	<%}else{ %>
	<h2><%=loginMember.getNickname() %>님 환영합니다!</h2>
	<a href="/logout.do">로그아웃</a>
	<%} %>
</body>
</html>