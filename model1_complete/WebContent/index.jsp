<%@page import="com.bmj.model1.util.PaginateUtil"%>
<%@page import="com.bmj.model1.vo.PageVO"%>
<%@page import="com.bmj.model1.vo.Article"%>
<%@page import="java.util.List"%>
<%@page import="com.bmj.model1.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//현재 페이지 번호
	int pageNo = 1;

	String pageNoStr = 
			request.getParameter("page");
	try {
		pageNo = Integer.parseInt(pageNoStr);
	}catch(Exception e) {
		response.sendRedirect("/index.jsp?page=1");
		return;
	}
	
	//한 페이지에 보여지는 게시물수
	int numPage = 3;

	PageVO pageVO = 
			new PageVO(pageNo,numPage);	

    List<Article> list
    = BoardDAO.selectList(pageVO);
    
    if(pageNo!=1 && list.isEmpty()) {
    	response.sendRedirect("/index.jsp?page=1");
    	return;
    }//if end
    
    int total = BoardDAO.selectTotal();
    
    String paginate = 
    PaginateUtil.getPaginate(
    		pageNo, //현재 페이지번호
    		total,//전체게시물수 
    		numPage,//한페이지에보여지는게시물수
    		3,//페이지네이트의 블록갯수
    		"/index.jsp",//서버주소
    		"page="//파라미터명
    		);
    
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MODEL1 게시판</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
<link rel="stylesheet" href="/css/index.css" />
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<h2 class="title"><i class="far fa-list-alt"></i> 게시글 목록</h2>
<% if(list.isEmpty()) { %>
<p class="no_article">
    <i class="fas fa-skull-crossbones"></i> 아직 게시글이 없습니다.
</p>
<%} %>
<ul id="articleList">
<% for (Article  article : list) { %>
<li class="article">
    <a href="/article.jsp?no=<%=article.getNo()%>">
        <div class="card_user">
            <img src="/profile/<%=article.getProfile() %>" width="100" />
            <strong><%=article.getNickname() %></strong>
        </div>
        <h3 class="title"><%=article.getTitle() %></h3>
        <time><%=article.getRegdate() %></time>
        <strong class="comment"><i class="fa fa-comment"></i> <%=article.getReplyCount() %></strong>
        <span class="hit"><i class="fa fa-eye"></i> <%=article.getHit() %></span>
        <div class="btn_like">
            <i class="fas fa-heart"></i>
            <i class="far fa-heart"></i>
            <span class="screen_out">좋아요</span>
            <strong class="num_like"><%=article.getLikeCount() %></strong>
        </div>
    </a>
</li>
<%} %>
</ul>
<%=paginate %>

<% if(loginMember!=null) { %>
<div class="box_btn">
    <a href="/write.jsp" class="btn"><i class="fas fa-pen-nib"></i> 글쓰기</a>
</div><!-- //.box_btn -->
<%} %>
<%@ include file="/WEB-INF/template/footer.jsp" %>
</body>
</html>



    