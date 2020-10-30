<%@page import="org.bmj.guestbook.dao.GuestbookDAO"%>
<%@page import="org.bmj.guestbook.vo.Guest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	
	Guest guest = GuestbookDAO.selectOne(no);	
	char[] emotions = {'G','F','L','S','A'};
	String[] emotionIcons = {"grin-stars", "laugh-squint", "smile" , "sad-cry" , "angry" };
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>방명록 수정</title>
	<%@ include file="/WEB-INF/template/link.jsp" %>
	<link href="/css/form.css" rel="stylesheet"/>

</head>
<body>
	<%@ include file="/WEB-INF/template/header.jsp" %>
	<h2><i class="fas fa-pencil-alt"></i> 방명록 글수정</h2>
	<form method="post" action="/edit.guest?no=<%=no%>">
		<fieldset>
			<legend class="screen_out">글 수정 수정폼</legend>
			<div>
				<strong class="title middle">표정짓기</strong>
				<%for(int i=0;i<emotions.length;i++){ %>
				<label class="emotion">
				<input type="radio" name="emotion" <%if(guest.getEmotion()==emotions[i]){ %> checked <%} %> value="<%=emotions[i]%>">
					<i class="far fa-<%=emotionIcons[i]%>"></i>
				</label>
				<%} %>
			</div>
			<div>
				<label class="title" for="writer">작성자</label>
				<input type="text" id="writer" value="<%=guest.getWriter() %>"  name="writer"
				 placeholder="작성자를 입력"/>
			</div>
			<div>
				<label class="title"  for="contents" >내 용</label>
				<textarea id="contents" name="contents"
				placeholder="내용 입력"
				 cols="50" rows="5"><%=guest.getContents() %></textarea>
			</div>
			<div class="btn_box">
				<button class="btn" type="reset"><i class="fas fa-retweet"></i> 리 셋</button>
				<button class="btn" type="submit"><i class="fas fa-pencil-alt"></i> 수정하기</button>
				<a class="btn" href="/"><i class="fa fa-arrow-left "></i> 방명록으로</a>
			</div>
		</fieldset>					
	</form>
	<%@ include file="/WEB-INF/template/footer.jsp" %>
</body>
</html>