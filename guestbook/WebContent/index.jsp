<%@page import="org.bmj.guestbook.util.PaginateUtil"%>
<%@page import="org.bmj.guestbook.vo.PageVO"%>
<%@page import="org.bmj.guestbook.dao.GuestbookDAO"%>
<%@page import="org.bmj.guestbook.vo.Guest"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int pageNo = 1;
	String pageStr = request.getParameter("pageNo");
	try{
		pageNo = Integer.parseInt(pageStr);
	}catch(Exception e){
		
	}

	int total = GuestbookDAO.selectTotal(); 
	int numPage = 2;	
	int numBlock = 2; // 블록 개수
	
	String url = "/index.jsp"; // 페이지 주소
	String param = "pageNo=";
	String paginate = PaginateUtil.getPaginate(pageNo,
            total,
            numPage,
             numBlock,
             url,
             param);
	
	PageVO pageVO = new PageVO(pageNo,numPage);
	List<Guest> guests = GuestbookDAO.selectList(pageVO);	
	// 1페이지가 아니고 만약 글이 없으면 1페이지로 이동
	if(pageNo!= 1 && guests.isEmpty()){
		response.sendRedirect("/index.jsp?pageNo=1");
	}//if end
	
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>멋진 방명록</title>
		<!-- index.html, writeForm.html의 공통된 CSS를 default.css에 -->
		<%@ include file="/WEB-INF/template/link.jsp" %>
	 	<link rel="stylesheet" href="/css/index.css" /> 
	</head>
	<body>
		<%@ include file="/WEB-INF/template/header.jsp" %>
		    <h2><i class="fas fa-book"></i> 방명록 리스트</h2>
<ul>
			<%if(guests.size() == 0){ %>
				<li class="no"><i class="far fa-sad-tear"></i> 방명록 글이 없네요.</li>
				<%
				}else{
					
				for(Guest guest : guests){
				%>
				<li>
					<h3>
						<strong>
						<a href="http://<%=guest.getIp()%>">
							<i class="far fa-grin-stars"></i>
							<%= guest.getWriter()%></a>
						</strong>
						<time><i class="far fa-clock"></i>
						<%= guest.getRegdate() %></time>
						<a href="/delete.guest?no=<%=guest.getNo() %>" class="delete btn"><i class="far fa-trash-alt"></i> 삭제</a>
						<a href="/writeForm.jsp?no=<%=guest.getNo() %>" class="update btn"><i class="far fa-edit"></i> 수정</a>
					</h3>
					<p><%= guest.getContents() %></p>
				</li>
			<%} }%>
				</ul><!-- #// ul end -->
				<div class="btn_box">
					<a class="btn" href="/writeForm.jsp"><i class="fas fa-pencil-alt"></i> 글쓰기</a>
				</div>
				<%= paginate%>
		<%@ include file="/WEB-INF/template/footer.jsp" %>
	</body>
</html>
    