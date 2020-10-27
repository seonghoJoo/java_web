<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="/css/all.min.css"/>
<style>
	div{
		margin:10px;
	}
	label .fas{
		font-size:60px;
	}
	input[type=file]{
		/*display:none;*/
	}
</style>
</head>
<body>
	<h1>회원가입</h1>
	<!-- 
	
		url encoding 방식
		enctype url은 영어와 특수문자만 가능
		x-www-form-urlencoded이 기본값 파라미터를 글자로 넘기는 방식
		(한글등 영어 제외한 언어들을 %XX로 표기)
		
		파일 업로드를 하려면
		1) POST 방식
		2) enctype을 'multipart/form-date'로
		enctype="multipart/form-data"

		IE11 은 url encoding 방식 그대로 보여주나 크롬은 변환 해서 보여줌
	  -->
	<form action="/upload.jsp" id="form" enctype="multipart/form-data" method="post">
		<fieldset>
		<legend>
		회원가입 폼	
		</legend>
		<div>
			<label>
			이름
				<input name="name">
			</label>
			<label>
			아이디
				<input name="id">
			</label>
		</div>
		<div>
		<!-- input을 display : none으로 숨기고 label에다가 icon을 줘 -->
			<label class="fas fa-paperclip">
				<input type="file" name="profile" id="profile">
			</label>
		</div>
		<div>
			<button>회원가입</button>
		</div>
		</fieldset>
	</form>
</body>
</html>