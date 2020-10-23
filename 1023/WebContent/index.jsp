<%@page import="util.PaginateUtil"%>
<%@page import="vo.PageVO"%>
<%@page import="dao.BooksDAO"%>
<%@page import="vo.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String noStr = request.getParameter("page");	
	// 기본값을 1로

	int pageNo = 1; // 현재페이지
	try{
		pageNo = Integer.parseInt(noStr);
	}catch(Exception e){
	}// try~catch
	// 한 페이지당 보여질 게시물 수
	
	int numPage = 5; // 한페이지당 보여질 게시물 수
	PageVO pageVO = new PageVO(pageNo, numPage);
	List<Book> books = BooksDAO.selectList(pageVO); 

	int total = BooksDAO.selectTotal(); // 전체 게시물 수
	int numBlock = 5; // 블록 개수
	String url = "/index.jsp"; // 페이지 주소
	String param = "page=";

	String pageNate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);	
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>책 목록</title>
<link rel="stylesheet" href="/css/reset.css"/>
<link rel="stylesheet" href="/css/all.min.css"/>
<link rel="stylesheet" href="/css/paginate.css"/>
<style>
	.paginate{
		width : 300px;
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