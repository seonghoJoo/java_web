<%@page import="vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member member = new Member();
	member.setId("test");
	member.setPassword("1234");
	member.setNickname("테스터");
	/*
		Attribute의 Scope
		- page scope
		- request scope <= 스프링은 내부적으로 이걸 사용
		- session scope <= 우리는 이걸 사용
		- servletContext scope
	*/
	session.setAttribute("aaa",member);
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>el이란?</title>
</head>
<body>
<h1>아이디 : ${aaa.id}</h1>
<!--  내부적으로 gettter 호출 맞음 -->
<h2>패스워드 : ${aaa.getPassword()} </h2>
<%--
	EL은 expression language의 준말
	표현언어
	
	attribute를 표현할 때 사용
	${}
 --%>
</body>
</html>