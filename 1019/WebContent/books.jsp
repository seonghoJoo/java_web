<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 스크립트릿 방식 중복된 코드 개 않좋음
	Class.forName("oracle.jdbc.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection con = DriverManager.getConnection(url,"test","1111");
	Statement stmt = con.createStatement();
	String sql = "SELECT no, title, page_num, author, publication_date FROM books ORDER BY 1";
	ResultSet rs = stmt.executeQuery(sql);
	
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
		<% while(rs.next()){ %>
			<tr>
				<td><%= rs.getInt(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(4) %></td>
				<td><%= rs.getInt(3) %></td>
				<td><%= rs.getDate(5) %></td>
			</tr>
		<%} %>
		</tbody>
	</table>
</body>
</html>