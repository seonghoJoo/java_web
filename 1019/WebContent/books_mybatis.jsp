<%@page import="vo.Book"%>
<%@page import="java.util.List"%>
<%@page import="dao.BooksDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Book> books = BooksDAO.selectList();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>책 목록</title>
<style>
	table{
		border-collapse : collapse;
	}
	td,th {
		border : 1px solid #424242;
		padding: 8px 12px;
	}
</style>
</head>
<body>	
	<h1>책목록</h1>
	<table>
		<thead>                 
			<tr>
				<th>번호</td>
				<th>제목</td>
				<th>저자</td>
				<th>페이지</td>
				<th>출판일</td>
			</tr>
		</thead>
		<tbody>
		<% for(Book book : books){ %>
			<tr>
				<td><%=book.getNo()%></td>
				<td><%=book.getTitle() %></td>
				<td><%=book.getAuthor() %></td>
				<td><%=book.getPageNum() %></td>
				<td><%=book.getPublicationDate()%></td>
			</tr>
		<%}//for-each end %>
		</tbody>
	</table>
</body>
</html>