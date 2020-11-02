<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		attribute(속성) : 명과 값으로 이루어진...
			
	*/	

	//HttpSession 객체
	Object loginUser = session.getAttribute("loginUser");
	// setAttribute , invalidate() 초기화 , removeAttribute(); 세가지가 있음.
%>
    
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>아주 멋진 웹서비스</h1>
	<% if(loginUser==null){ //로그인이 안된상태%>
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
	<h2><%=loginUser %>님 환영합니다!</h2>
	<a href="/logout.do">로그아웃</a>
	<%} %>
</body>
</html>