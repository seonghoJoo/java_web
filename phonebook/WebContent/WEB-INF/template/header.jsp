<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String uri = request.getRequestURI();
	
	System.out.println(uri);
%>
<div id="header">
	<h1>
		<a href="/index.jsp">
			<img src="/img/슈가.jpg" class="profile"/>
			<span>성호님의 전화번호부</span></a>
	</h1>
	<div id="nav">
		<h2 class="screen_out">주요메뉴</h2>
		<ul>
			<li><a href="/hello.bmj"><i class="far fa-hand-paper"></i> hello.bmj</a></li><!--
		 --><li <%if(uri.equals("/increase.jsp")) {%>class="on"<%} %>><a href="/increase.jsp"><i class="fas fa-chart-line"></i> increase.jsp</a></li><!--
		 --><li <%if(uri.equals("/index.jsp") || uri.equals("/") || uri.equals("/updateForm.jsp")){ %>class="on"<%} %>><a href="/index.jsp"><i class="fas fa-mobile"></i> 전화번호부</a></li><!--
		 --><li <%if(uri.equals("/registerForm.jsp")){ %>class="on"<%} %>><a href="/registerForm.jsp"><i class="fas fa-pencil-alt"></i> 전화번호 작성</a></li>
		</ul>
	</div><!-- //nav -->
</div><!-- //header -->
<div id="content">