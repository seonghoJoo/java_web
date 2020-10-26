<%@page import="java.util.Calendar"%>
<%@page import="com.bmj.phonebook.dao.PhonebookDAO"%>
<%@page import="com.bmj.phonebook.vo.Phone"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	Phone phone = PhonebookDAO.selectOne(no);
	
	String phone1,phone2,phone3;
	if(phone.getPhone().length()==11){ 
		phone1 = phone.getPhone().substring(0,3);
		phone2 = phone.getPhone().substring(3,7);
		phone3 = phone.getPhone().substring(7,phone.getPhone().length());
	}
	else{
		phone1 = phone.getPhone().substring(0,3);
		phone2 = phone.getPhone().substring(3,6);
		phone3 = phone.getPhone().substring(6,phone.getPhone().length());
	}//if else end
	int year = phone.getBirthDate().getYear()+1900;
	int month = phone.getBirthDate().getMonth()+1;
	int day = phone.getBirthDate().getDate();
	char gender = phone.getGender();
	
	Calendar cal = Calendar.getInstance();
	int maxDay = cal.getActualMaximum(Calendar.DATE);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>성호의 전화번호 수정페이지</title>
	<%@include file="/WEB-INF/template/link.jsp" %>
	<link rel="stylesheet" href="/css/form.css"/>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
</div><!-- //header -->
<div id="content">
	<h2><i class="fas fa-mobile-alt"></i> 전화번호 입력</h2>
	<div id="formBox">
		<form id="form" method="post" action="/update.bmj">
			<fieldset>
				<legend class="screen_out">전화번호 입력폼</legend>
				<input type="hidden" name="no" value="<%=no %>"/>
				<div class="row">
					<label for="name">이 름</label>
					<input id="name" name="name" value="<%=phone.getName() %>"
						   title="2~6글자 한글과 숫자로만 입력해주세요."
						   placeholder="이름입력" readonly/>
				</div>
				<div class="row">
					<label for="phone" >전화번호</label>
					<span id="phone">
				<select id="phone1" name="phone1"
						title="반드시 선택해주세요.">
						<option <%if(phone1.equals("010")){%> selected<%} %>>010</option>
						<option <%if(phone1.equals("011")){%> selected<%} %>>011</option>
						<option <%if(phone1.equals("016")){%> selected<%} %>>016</option>
						<option <%if(phone1.equals("017")){%> selected<%} %>>017</option>
						<option <%if(phone1.equals("019")){%> selected<%} %>>019</option>
				</select>
				-
				<input id="phone2" name="phone2" value="<%=phone2%>"
					   title="3~4글자 숫자만 입력해주세요." class="digit4"
					   placeholder="숫자입력" size="4" maxlength="4" />
				-
				<input id="phone3" name="phone3" value="<%=phone3 %>"
					   title="4글자 숫자만 입력해주세요." class="digit4"
					   placeholder="숫자입력" size="4"	maxlength="4" />
				</span>
				</div>
				<div class="row">
					<label for="age">생년월일</label><span id="age">
						<select id="year" name="year">
							<%for(int i=2020;i>1930;i--){ %>
							<option <%if(year==i){%> selected<%} %> value="<%=i %>"><%=i %></option>
							<%} %>
						</select><em>년</em>
						<select id="month" name="month">
							<%for(int i=1;i<13;i++){ %>
							<option <%if(month==i){%> selected<%} %> value="<%=i %>"><%=i %></option>
							<%} %>
						</select><em>월</em>
						<select id="date" name="date">
							<%for(int i=1;i<32;i++){ %>
							<option <%if(day==i){%> selected<%} %> value="<%=i %>"><%=i %></option>
							<%} %>
						</select><em>일</em></span>
				</div>
				<div class="row">
					<label for="gender">성 별</label>
					<span id="gender">
				<input type="radio" id="female" name="gender" value="F" <%if(gender=='F'){%> checked <%} %> />
				<label for="female"><i class="fa fa-female"></i> 여 자</label>
				<input type="radio" id="male" name="gender" value="M" <%if(gender=='M'){%> checked <%} %> />
				<label for="male"><i class="fa fa-male"></i> 남 자</label>
				</span>
				</div>
				<div class="box_btn">
					<button type="submit" class="btn">
						<i class="fas fa-pencil-alt"></i> 전화번호 수정
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
	
	$('#nav li').removeClass("on");
	$('#nav #register').addClass("on");

</script>
</body>
</html>