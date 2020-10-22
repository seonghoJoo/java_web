<%@page import="com.bmj.mms.dao.GenresDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.bmj.mms.vo.Genre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Genre> genres = GenresDAO.selectList();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장르 리스트</title>
<style>
	table{
		border-collapse: collapse;
	}
	td,th{
		border : 1px solid #424242;
		padding : 8px 12px;
	}
</style>
</head>
<body>
	<h1><a href="/">멋진 영화관리 서비스</a></h1>
	<h2>장르 목록</h2>
	<table>
		<thead>
			<tr>
				<th>번호</th>	
				<th>장르명</th>	
				<th>수정</th>	
				<th>삭제</th>	
		</thead>
		<tbody>
			<% for(Genre genre : genres){ %>
				<tr>
					<td><%=genre.getNo() %></td>
					<th><%=genre.getName() %></th>
					<td>
					<a href="/genreUpdateForm.jsp?no=<%=genre.getNo() %>">수정</a>
					</td>
					<td>
					<!-- 논뷰라 jsp로 만들 필요가 없어 즉 servlet으로 만들거라 .do 로 끝남 -->
					<a href="/genreRemove.mms?no=<%=genre.getNo()%>">삭제</a>
					</td>
				</tr>
			<%} %>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">
					<a href="/genreRegisterForm.jsp">등록</a>
					<a href="/">인덱스로</a>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>