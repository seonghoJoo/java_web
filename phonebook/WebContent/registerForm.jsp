<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>전화번호 입력페이지</title>
	<%@include file="/WEB-INF/template/link.jsp" %>
	<link rel="stylesheet" href="css/form.css"/>
</head>
<body>
	<%@ include file="/WEB-INF/template/header.jsp" %>
	<!-- contents 시작 -->
	<h2><i class="fas fa-mobile-alt"></i> 전화번호 입력</h2>
	<div id="formBox">
		<form id="form" action="/register.bmj" method="post">
			<fieldset>
				<legend class="screen_out">전화번호 입력폼</legend>
				<div class="row">
					<label for="name">이 름</label>
					<input id="name" name="name"
						   title="2~6글자 한글과 숫자로만 입력해주세요."
						   placeholder="이름입력" />
				</div>
				<div class="row">
					<label for="phone">전화번호</label>
					<span id="phone">
				<select id="phone1" name="phone1"
						title="반드시 선택해주세요.">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>019</option>
				</select>
				-
				<input id="phone2" name="phone2"
					   title="3~4글자 숫자만 입력해주세요." class="digit4"
					   placeholder="숫자입력" size="4" maxlength="4" />
				-
				<input id="phone3" name="phone3"
					   title="4글자 숫자만 입력해주세요." class="digit4"
					   placeholder="숫자입력" size="4"	maxlength="4" />
				</span>
				</div>
				<div class="row">
					<label for="age">생년월일</label><span id="age">
				<select id="year" name="year">
				</select><em>년</em>
				<select id="month" name="month">
				</select><em>월</em>
				<select id="date" name="date">
				</select><em>일</em>
				</span>
				</div>
				<div class="row">
					<label for="gender">성 별</label>
					<span id="gender">
				<!-- name="gender"로 묶이기 때문에 한개밖에 선택못함 프론트 딴에서 -->
				<input type="radio" id="female" name="gender" value="F" checked/>
				<label for="female"><i class="fa fa-female"></i> 여 자</label>
				<input type="radio" id="male" name="gender" value="M"/>
				<label for="male"><i class="fa fa-male"></i> 남 자</label>
				</span>
				</div>
				<div class="box_btn">
					<button type="submit" class="btn">
						<i class="fas fa-pencil-alt"></i> 전화번호 등록
					</button>
					<button type="reset" class="btn">
						<i class="fas fa-redo-alt"></i> 리 셋
					</button>
					<a href="/index.jsp" class="btn"><i class="fa fa-arrow-left"></i> 전화번호부로</a>
				</div>
			</fieldset>
		</form>
	</div><!-- //formBox  -->
<!-- //#contents end -->
<%@ include file="/WEB-INF/template/footer.jsp" %>
<script src="/js/create-date.js"></script>
<script>
	// 모바일 
	// Thin client / Fat Server
	// 기기의 발전
	// Thin Server / Fat Client -> 우리가 자바스크립트로 유효성 검사를 하겠다. 
	const now1 = moment();
	createYearMonth(now1.year(),now1.month()+1,now1.date());
	
	// 이름 정규표현식 객체
	const nameExp = /^[가-힣]{1}[가-힣|\d]{1,5}$/;
	
	// 2번째 전화번호 정규표현식 객체
	const phone_3_4Exp = /^[\d]{3,4}$/;
	// 3번째 전화번호 정규표현식 객체
	const phone_4Exp = /^[\d]{4}$/;
	
	const $name = $('#name');
	const $phone1 = $('#phone1');
	const $phone2 = $('#phone2');
	const $phone3 = $('#phone3');
	
	$('#form').on("submit",function(e){
		
		e.preventDefault();
		
		// 입력한 이름
		const name = $name.val();
		if(!nameExp.test(name)){
			alert("이름을 2~6글자 첫글자는 한글 이고 나머지는 한글 및 숫자 입력");
			$name.val("").focus();
			return false;
		}// if end
		
		
		
		// 입력한 phone
		const phone1 = $phone1.val();
		const phone2 = $phone2.val();
		const phone3 = $phone3.val();
		
		if(!(phone_3_4Exp.test(phone2))){
			alert("2번째 숫자 3~4 자리 제대로");
			$phone2.val("").focus();
			return false;
		}
		
		if(!phone_4Exp.test(phone3)){
			alert("3번째 숫자 입력 제대로");
			$phone3.val("").focus();
			return false;
		}
		
		
		
		
	});//submit() end

	// index.jsp -> index_jsp.java -> index_jsp.class
	// 로그인 사람에 따라 다르게 처리
	// 찜질방 httpsession (신발장 키 도망못가게) httpSession pool이 있음 (브라우저 기준임)
 	// jsession ID (번호키)
	
	/*
		요청 오기 전
		httpSession 객체 없음
		
		첫 요청 
		JSessionID 없음 -> HttpSession 객체 만듦
		JSessionID(해쉬코드) 일단 3번이라고 하고 클라이언트에게 응답줌 
		은행은 10분 기본값은 30분 마지막으로 간 이후에 30분 다시 들어가면 30분으로 갱신됨
		
		두번째 요청
		JSessionID 없음 -> HttpSession 객체 만듦
		JSessionID 부여 11번 부여  클라이언트에게 응답 줌
		
		첫요청 한 애가 다시 요청
		JSessionID 3 -> HttpSession 객체 만들필요 없음 상태유지
		클라이언트에게 3 응답을 해줌
		
		이러한 것을 톰캣이 다 자동으로 함
		개발자가 할일은 1도 없음
	*/
	
</script>
</body>
</html>