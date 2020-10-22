<%@page import="com.bmj.mms.vo.Movie"%>
<%@page import="com.bmj.mms.dao.MoviesDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Movie> movies = MoviesDAO.selectList();
	
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>영화 목록</title>
</head>
<body>
	<h1><a href="/">멋진 영화관리 서비스</a></h1>
	<h2>영화 목록</h2>
	
	<ul>
		<%for(Movie movie:movies){ %>
		<li><a href="/movie.jsp?no=<%=movie.getNo() %>"><%=movie.getName() %></a></li>
		<%} %>
	</ul>
	<a href="/movieRegisterForm.jsp">영화등록</a>
	<a href="/">인덱스로</a>
</body>
</html>