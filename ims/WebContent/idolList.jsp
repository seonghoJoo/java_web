<%@page import="org.bmj.ims.util.PaginateUtil"%>
<%@page import="org.bmj.ims.vo.PageVO"%>
<%@page import="org.bmj.ims.dao.IdolsDAO"%>
<%@page import="org.bmj.ims.vo.Idol"%>
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
	List<Idol> idols = IdolsDAO.selectList(pageVO); 
	
	int total = IdolsDAO.selectTotal(); // 전체 게시물 수
	int numBlock = 5; // 블록 개수
	
	String url = "/idolList.jsp"; // 페이지 주소
	String param = "page=";
	
	String pagiNate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이돌 목록 | ims</title>
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
	/*0 1 0 0 */
	#idolList {
		overflow:hidden;
		margin : 0;
		list-style : none;
		padding : 10px;
		width : 642px;
	}
	/*0 1 0 1*/
	#idolList li{
		width : 204px;
		height : 64px;
		float : left;
		margin : 5px;
	}
	/*0 1 0 2*/
	#idolList>li>a{
		width : 200px;
		height : 60px;
		display : block;
		border : 2px solid #424242;
		font-weight : 700;
		text-align : center;
		line-height : 60px;
		text-decoration : none;
		transition : .2s ease;
		position : relative;
	}
	/*0 1 1 2*/
	#idolList>li>a:hover{
		box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		color : #424242;
	}
	/*0 0 1 0*/
	.ribbon{
		width : 30px;
		height : 30px;
		background : #ff1744;
		position : absolute;
		font-size : 16px;
		color : #fff;
		line-height : 30px;
		left : 8px;
		top : -6px;
	}
	/*0 0 2 0*/
	.ribbon::before{
		content: "";
		position: absolute;
		border-top : 10px solid #ff1744;
		border-right : 15px solid transparent;
		left : 0;
		bottom: -10px;
	}
	/*0 0 2 0*/
	.ribbon::after{
		content : "";
		position : absolute;
		border-top : 10px solid #ff1744;
		border-left : 15px solid transparent;
		right : 0;
		bottom : -10px
	}
</style>
</head>
<body>
	<h1><a href="/"><i class="far fa-address-book"></i>  Awesome Idol Management Service</a></h1>
	<h2><i class="fas fa-user-friends"></i> 아이돌 목록</h2>
	<ul id="idolList">
	<%for(Idol idol : idols) { %>
	<li><a href="/idolDetail.jsp?idolId=<%=idol.getIdolId() %>">
		<span class="ribbon"><%=idol.getIdolId()%></span>
		<%= idol.getName() %>
		
	</a></li><%} %>
	</ul>
	<%= pagiNate %>
	<a class="btn" href="/idolRegisterForm.jsp"><i class="fas fa-edit"></i> 아이돌 등록 </a>
	<a class="btn" href="/index.jsp"><i class="fas fa-home"></i> 홈으로 </a>
</body>
</html>