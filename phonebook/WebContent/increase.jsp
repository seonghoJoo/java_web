<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! int a = 1; %>    
<!-- 
	
	멤버필드와 지역변수
	
	// increase_jsp
	지역변수로 선언한거임
	< % int a = 10;% >
	
	멤버필드에 값을 저장해놓으면 객체가 사라지기 전까지 값이 유지가 됨	
	< %! int a = 10;% >
 -->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>방문자수 조사 페이지</title>
<%@ include file="/WEB-INF/template/link.jsp"%>
<style>
	/*구체성을 동일하게 맞춤*/
	#content h2{
		font-size:60px;
		font-weight : 900;
		line-height : 400px;
	}
</style>
</head>
<body>

<%@ include file="/WEB-INF/template/header.jsp"%>
<div>
	<h2>
	<%= a++ %>번째 방문입니다.
	</h2>
</div>
<%@ include file="/WEB-INF/template/footer.jsp"%>

</body>
</html>