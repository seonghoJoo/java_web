<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html lang="ko">
<html>
<head>
<meta charset="UTF-8">
<title>웹에서 이미지 다운로드</title>
</head>
<body>
	<h1>웹에서 이미지 다운로드</h1>
	<form action="/download.jsp" method="post">
		<fieldset>
			<legend>이미지 다운로드</legend>
			<input name="url"/>
			<button>다운로드</button>
		</fieldset>
	</form>
</body>
</html>