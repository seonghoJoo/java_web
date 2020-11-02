<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>정규표현식을 활용한 유효성 검사</title>
<style>
	#msg{
		color:#FF1744;
	}
	#msg.ok{
		color : #2979FF; 
	}
</style>
</head>
<body>
	<h1>회원가입</h1>
	<input id="nickname" placeholder="닉네임"/>
	<p id="msg">2~8자까지 한글 및 숫자로 입력해주세요.</p>
<script src="/js/jquery.js"></script>
<script>
	// 정규표현식 객체 생성 첫글자는 한글 
	const nicknameExp = /^[가-힣]{1}[가-힣|\d]{1,7}$/;

	//input 요소
	const $nickname = $('#nickname');
	// msg 출력하는 p요소
	const $msg = $('#msg');
	
	$('#nickname').keyup(function(){
		const val = $nickname.val();
		if(nicknameExp.test(val)){
			$msg.addClass("ok").text("아주 좋은 닉네임이에요");
		}else{
			$msg.removeClass("ok").text("2~8자까지 한글 및 숫자로 입력해주세요.");
		}// if ~ else end
	});//keyup() end
</script>
</body>
</html>