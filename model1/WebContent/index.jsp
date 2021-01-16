<%@page import="com.doogwal.coffee.util.PaginateUtil"%>
<%@page import="com.doogwal.coffee.vo.Article"%>
<%@page import="com.doogwal.coffee.vo.PageVO"%>
<%@page import="com.doogwal.coffee.dao.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.doogwal.coffee.vo.Member"%>
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
<!-- index 에서만 쓰이는  -->
    <link rel="stylesheet" href="/css/index.css" />
</head>
<body>


<%-- 
	<%  %> : 스크립트릿 :지역변수
	<%= %> : 표현식 : out.print()
	<%! %> : 선언문 : 멤버 필드 멤버 메서드(하지만 안씀) 
	<%@ %> : 지시어 : 페이지 지시어  / include 지시어
--%>
<%@ include file="/WEB-INF/template/header.jsp" %>
        <h2 class="title"><i class="far fa-list-alt"></i> 게시글 목록</h2>
        <ul id="articleList">
        <%for(Article article : list){ %>
            <li class="article">
                <a href="/article.jsp?no=12">
                    <div class="card_user">
                        <img src="/profile/IMG_1136.JPG" width="100" />
                        <strong></strong>
                    </div>
                    <h3 class="title">안녕하세요?</h3>
                    <time>2021-01-05 08:14:15.408</time>
                    <strong class="comment"><i class="fa fa-comment"></i> 0</strong>
                    <span class="hit"><i class="fa fa-eye"></i> 1</span>
                    <div class="btn_like">
                        <i class="fas fa-heart"></i>
                        <i class="far fa-heart"></i>
                        <span class="screen_out">좋아요</span>
                        <strong class="num_like">0</strong>
                    </div>
                </a>
            </li>
            <%} %>
        </ul>
        <div class='paginate'><span title="이전 페이지 없음"><i class="fa fa-chevron-left"></i></span><strong title='현재 1페이지'>1</strong><span title='다음 페이지 없음'><i class='fa fa-chevron-right'></i></span></div>
		<%if(loginMember!=null){ %>
		<div class="box_btn">
			<a href="/write.jsp" class="btn"><i class="fas fa-pen-nib"></i> 글쓰기</a>
		</div><!-- //.box_btn -->
		<%} %>
<%@ include file="/WEB-INF/template/footer.jsp" %>
<script>
	
	
</script>
</body>
</html>