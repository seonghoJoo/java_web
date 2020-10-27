<%@page import="com.bmj.mms.util.PaginateUtil"%>
<%@page import="com.bmj.mms.vo.PageVO"%>
<%@page import="com.bmj.mms.vo.Movie"%>
<%@page import="com.bmj.mms.dao.MoviesDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String noStr = request.getParameter("page");	
	// 기본값을 1로
	
	int pageNo = 1; // 현재페이지
	// if문쓰지 않은 이유 / noStr이 sljdfhb 같은 문자열 받은 경우 numberFormatException을 띄워야 함
	try{
		pageNo = Integer.parseInt(noStr);
	}catch(Exception e){
	}// try~catch
	// 한 페이지당 보여질 게시물 수
	
	int numPage = 3; // 한페이지당 보여질 게시물 수
	PageVO pageVO = new PageVO(pageNo, numPage);
	List<Movie> movies = MoviesDAO.selectList(pageVO); 
	if(movies!=null){
		System.out.println(movies.size());
	}else{
		System.out.println("null");
	}
	int total = MoviesDAO.selectTotal(); // 전체 게시물 수
	System.out.println(total);
	int numBlock = 5; // 블록 개수
	
	String url = "/movies.jsp"; // 페이지 주소
	String param = "page=";
	
	String pagiNate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);	

	
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>영화 목록</title>
<link rel="stylesheet" href="/css/reset.css"/>
<link rel="stylesheet" href="/css/paginate.css"/>
<link rel="stylesheet" href="/css/all.min.css"/>
<link rel="stylesheet" href="/css/notosanskr.css"/>
<link rel="stylesheet" href="/css/default.css" />
<style>
h1{
		font-size:40px;
		margin : 20px;
		font-weight : 900
	}
	h2{
		font-size:36px;
		margin : 20px;
		font-weight : 700
	}
	.paginate{
		width : 642px;
	}
	.paginate strong{
		background-color : #ff1744;
		border-color : #ff1744;
	}
	.paginate a:hover{
		background-color:#424242;
		border-color : #424242;
	}

</style>
</head>
<body>
	<h1><a href="/">멋진 영화관리 서비스</a></h1>
	<h2>영화 목록</h2>
	
	<ul>
		<%for(Movie movie:movies){ %>
		<li>
		<img src="/poster/<%=movie.getPosterImage() %>"/>
		<a href="/movie.jsp?no=<%=movie.getNo() %>"><%=movie.getName() %></a></li>
		<%} %>
	</ul>
	<%=pagiNate %>
	<a href="/movieRegisterForm.jsp">영화등록</a>
	<a href="/">인덱스로</a>
</body>
</html>