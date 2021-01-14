<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html lang="ko">
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 폼</title>
</head>
<body>
<h1>파일 업로드</h1>

<form method="post" action="/uploadTest.bmj" enctype="multipart/form-data">
	<fieldset>
		<legend>회원가입 폼</legend>
		<input name="id"/>
		<input type="file" name="test"/>
		
		<button>회원가입</button>
	</fieldset>
</form>

</body>
</html>