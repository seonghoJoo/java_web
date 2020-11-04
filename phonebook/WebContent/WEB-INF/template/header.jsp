<%@page import="com.bmj.phonebook.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String uri = request.getRequestURI();
%>
<div id="header">
	<h1>
		<a href="/index.jsp">
			<img src="/profile/${loginMember.profileImage}" class="profile" title="${loginMember.profileImage}"/>
			<span>${loginMember.nickName}님의 전화번호부</span></a>
	</h1>
	<div id="nav">
		<h2 class="screen_out">주요메뉴</h2>
		<ul>
			<li><a href="/hello.bmj"><i class="far fa-hand-paper"></i> hello.bmj</a></li><!--
		 --><li <%if(uri.equals("/increase.jsp")) {%>class="on"<%} %>><a href="/increase.jsp"><i class="fas fa-chart-line"></i> increase.jsp</a></li><!--
		 --><li <%if(uri.equals("/main.jsp") || uri.equals("/") || uri.equals("/updateForm.jsp")){ %>class="on"<%} %>><a href="/index.jsp"><i class="fas fa-mobile"></i> 전화번호부</a></li><!--
		 --><li <%if(uri.equals("/registerForm.jsp")){ %>class="on"<%} %>><a href="/registerForm.jsp"><i class="fas fa-pencil-alt"></i> 전화번호 작성</a></li>
		</ul>
	</div><!-- //nav -->
	
	<a href="/logout.bmj" class="btn logout"><i class="fas fa-sign-out-alt"></i>로그아웃</a>
	
</div><!-- //header -->
<div id="content">