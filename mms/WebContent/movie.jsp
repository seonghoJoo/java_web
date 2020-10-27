<%@page import="com.bmj.mms.dao.MoviesDAO"%>
<%@page import="com.bmj.mms.vo.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	Movie movie = MoviesDAO.selectOne(no);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>영화 상세</title>
</head>
<body>
	<h1><a href="/">멋진 영화관리 서비스</a></h1>
	<h2><%=movie.getName() %></h2>
	<img src="/poster/<%=movie.getPosterImage() %>"/>
	<dl>
		<dt>번호</dt>
		<dd><%= movie.getNo()%></dd>
		<dt>감독</dt>
		<dd><%= movie.getDirector()%></dd>
		<dt>개봉일</dt>
		<dd><%= movie.getReleaseDate() %></dd>
		<dt>종료일</dt>
		<dd><%= movie.getEndDate() %></dd>
		<dt>관객수</dt>
		<dd><%= movie.getAudienceNum() %></dd>
		<dt>장르</dt>
		<dd><%= movie.getGenreName() %></dd>
	</dl>
	
	<a href="/movieUpdateForm.jsp?no=<%=no %>">수정</a>
	<a href="/movieRemove.mms?no=<%=no %>">삭제</a>
	<a href="/movies.jsp">목록으로</a>
</body>
</html>