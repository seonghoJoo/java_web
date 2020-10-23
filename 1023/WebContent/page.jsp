<%@page import="dao.BooksDAO"%>
<%@page import="vo.Book"%>
<%@page import="java.util.List"%>
<%@page import="vo.PageVO"%>
<%@page import="util.PaginateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pageNo = 1; // 현재페이지
	int total = 100; // 전체 게시물 수
	int numPage = 5; // 한페이지당 보여질 게시물 수
	int numBlock = 3; // 블록 개수
	String url = "/page.jsp"; // 페이지 주소
	String param = "page=";
	
	String pageStr = request.getParameter("page");
	try{
		pageNo = Integer.parseInt(pageStr);
	}catch(Exception e){
		
	}
	
	String pageNate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);	
	
	PageVO pageVO = new PageVO(pageNo, numPage);
	List<Book> books = BooksDAO.selectList(pageVO); 

%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>PagenateUtil 사용법</title>
<link rel="stylesheet" href="/css/reset.css"/>
<link rel="stylesheet" href="/css/all.min.css"/>
<link rel="stylesheet" href="/css/paginate.css"/>
<style>
	
	
	li{
		position : relative;
		border : 1px solid #424242;
		margin : 10px;
		width : 600px;
		height : 40px;
		padding : 8px 12px;
		transition: .2s ease;
		text-align : center;
		line-height : 40px;
		overflow : hidden;
	}
	li:hover{
		background-color: #123421;
		box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		color : #fff;
	}
</style>
</head>
<body>
<h1>책 목록</h1>
	<ul>
		<% for(Book book : books) { %>
		<li><%=book.getNo() %>) <%=book.getTitle() %></li>
		<% } %>
	</ul>
<%=pageNate%>
</body>
</html>