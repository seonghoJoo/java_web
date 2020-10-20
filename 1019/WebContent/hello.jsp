<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>HELLO JSP</title>
</head>
<!-- html 코드에 java 코드가 삽입됬네? mvc 때는 절대 안이럴 예정 -->
<!-- member field 변수 -->
<%! int a = 5;  // hello_jsp 클래스 멤버필드 %>
<!-- service 지역 변수 -->
<% int a = 10; // _jspService 메서드 지역변수 %>
<body>
	<h1>Hello JSP <% out.println(a); %></h1>
	<%out.println(this.a); 
		String name = "RM";
		
	%>
	<h2>이름: <% out.println(name); %></h2>
	<h2>이름: <%= name %></h2><!-- 얘가 출력은 더 편함 -->
</body>
</html>
<!-- HTML 주석 -->
<%-- JSP 주석 --%>
<%-- 
		JSP란?
		- Java Server Page의 줄임말
		- HTML 코드에 자바코드를 삽입
		- 맵핑이 필요없음(파일명.jsp가 주소)
		- jsp도 사실 서블릿
		- hello.jsp는 hello_jsp.java 파일로 변경
		- hello.jsp.class 파일로 컴파일
		- 객체 생성
		<%@ %> : 지시어
		<%! %> : 선언문
		<%  %> : 스크립트릿
		<%= %> : 표현식	

		JSP 문법
		1) 지시어 : <%@ %> : 중요도 5
			- page, include, taglib
			- 중요도 5(우리가 직접 작성보단 자동완성 등 활용)
			- 자바파일로 변경시 이곳저곳으로 
			
		2) 선언문 : <%! %> : 중요도 1
			- 클래스 영역(멤버 자리)
			
		3) 스크립트릿 : <% %> 중요도 100
			- _jspService 메서드 안에 선언
			
		 	
		4) 표현식 : <%= %> 중요도 100
			- _jspService 메서드 안에 out.print()메서드
			- 출력이 빈번하기 때문에 편리함
		
--%>