<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.bmj.phonebook.util.LetterLengthCheck"%>
<%@page import="com.bmj.phonebook.dao.PhonebookDAO"%>
<%@page import="com.bmj.phonebook.vo.Phone"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Date today = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	int day = cal.get(Calendar.DATE);
	int maxDay = cal.getActualMaximum(cal.DATE);
	System.out.println(maxDay);

%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>성호의 전화번호 입력페이지</title>
	<%@include file="/WEB-INF/template/link.jsp" %>
	<link rel="stylesheet" href="/css/form.css"/>

</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
</div><!-- //header -->
<div id="content">
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
						<%for(int i=2021;i>1906;i--){ %>
						<option <%if(year==i){%> selected<%} %> value="<%=i %>"><%=i %></option>
					<%} %>
					</select><em>년</em>
					<select id="month" name="month">
						<%for(int i=1;i<13;i++){ %>
						<option <%if(month==i){%> selected<%} %> value="<%=i %>"><%=i %></option>
						<%} %>
					</select><em>월</em>
					<select id="date" name="date">
						<%for(int i=1;i<=maxDay;i++){ %>
						<option <%if(day==i){%> selected<%} %> value="<%=i %>"><%=i %></option>
						<%} %>
					</select><em>일</em></span>
				</div>
				<div class="row">
					<label for="gender">성 별</label>
					<span id="gender">
				<input type="radio" id="female" name="gender" value="F" checked/>
				<label for="female"><i class="fa fa-female"></i> 여 자</label>
				<input type="radio" id="male" name="gender" value="M"/>
				<label for="male"><i class="fa fa-male"></i> 남 자</label>
				</span>
				</div>
				<div class="box_btn">
					<button type="submit" class="btn" id="submitBtn">
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
</div><!-- //content  -->

<%@include file="/WEB-INF/template/footer.jsp" %><!-- //footer -->
<script src="/js/jquery.js"></script>
<script>
	$('#name').val('').focus();
	
	$('#nav li').removeClass("on");
	$('#nav #register').addClass("on");

	$('#form').submit(function (e) {
		let flag=1;
        // 1) 유저가 입력한 값을 얻어옴
        const _name = $('#name').val();
		const _p1 = $('#phone1').val();
		const _p2 = $('#phone2').val();
		const _p3 = $('#phone3').val();
		console.log(_name + " " + _p1+_p2+_p3);
		console.log(_name.length + _p2.length + _p3.length);
		if(_p1 == "010"){
			if(_p2.length==4){
				console.log("전화번호는 010");
			}else{
				flag=2;
			}
		}else{
			if(_p2.length==3){
				console.log("전화번호 010 아님");
			}else{
				flag=2
			}
		}
		if(_p3.length==4) {
		}else{
			flag=3;
		}
		if(flag!=1){
			e.preventDefault();
			alert("전화번호 "+flag+"번째 자리를 제대로 입력해 주세요");
		}
	
		if(_name.length >= 2 &&_name.length <=6){
	        const _action = $('#form').attr("action");
	        $('#joinForm').attr("action",_action);
		}else{
			e.preventDefault();
			alert("이름을 2~6글자 한글과 숫자로만 입력하세요");
		}
    });

   
   	
</script>
</body>
</html>