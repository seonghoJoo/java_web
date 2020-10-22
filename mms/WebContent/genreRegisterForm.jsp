<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><a href="/">멋진 영화관리 서비스</a></h1>
	<h2>장르 입력</h2>
	<form action="/genreRegister.mms" method="post">
		<fieldset>
			<legend>장르입력폼</legend>
			<div>
				<!-- <label for="name">장르명</label>
				<input placeholder="장르 이름 입력하세요" name="name" id="name"/>-->
				<label>
					장르명
					<input placeholder="장르 이름 입력하세요" name="name">
				</label>
			</div>
			
			<div>
				<button type="submit">입력</button>
				<a href="/genres.jsp">목록으로</a>
			</div>
		</fieldset>
	</form>		
</body>
</html>