<%@page import="vo.Comment"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//서버 연결
	URL url = new URL("https://comment.daum.net/apis/v1/posts/149655001/comments?parentId=0&offset=0&limit=100&sort=RECOMMEND&isInitial=true&hasNext=true");
	
	//스트림 연결
	InputStream in = url.openStream();
	
	// 우리한테 필요한것이 무엇일까? -> 전처리
	ObjectMapper om = new ObjectMapper();

	Comment[] comments = om.readValue(in, Comment[].class);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원더 우먼 1984 평점</title>
<style>
 	.box{
        height: 16px;
        background-image: url("img/ico_newsview_200522.png");
    }
    .grade_star{
        width: 88px;
        background-position: 0 -300px;
    }
    .inner_star{
        /*width:auto block level 부모의 width 그대로 받음*/
        width: 0;
        background-position: 0 -320px;
    }
</style>

</head>
<body>
	<h1>원더 우먼 1984 평점</h1>

	<table border="1">
		<thead>
			<tr>
				<th>평점</th>
				<th>코멘트</th>
				<th>좋아요</th>
				<th>싫어요</th>
			</tr>
		</thead>
		<tbody>
			<%for(Comment comment : comments){ %>
			<tr>
				<td>
					<div class="grade_star box">
				        <div class="inner_star box" style="width: <%=comment.getRating()*10 %>%"></div>
				    </div>
				</td>	
				<td>
					<%=comment.getContent() %>
				</td>	
				<td>
					<%=comment.getLikeCount() %>
				</td>
				<td>
					<%=comment.getDislikeCount() %>
				</td>
			</tr>
			<%} %>	
		</tbody>
	</table>
</body>
</html>