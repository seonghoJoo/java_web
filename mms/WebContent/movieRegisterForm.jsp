<%@page import="java.util.Calendar"%>
<%@page import="com.bmj.mms.vo.Genre"%>
<%@page import="java.util.List"%>
<%@page import="com.bmj.mms.dao.GenresDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Genre> genres = GenresDAO.selectList();
	Calendar now = Calendar.getInstance();
	int year = now.get(Calendar.YEAR);
	int month = now.get(Calendar.MONTH)+1;
	int date = now.get(Calendar.DATE);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>영화 등록 페이지</title>
<link rel="stylesheet" href="/css/datepicker.css" />
</head>
<body>
	<h1><a href="/">멋진 영화관리 서비스</a></h1>
	<h2>영화 입력</h2>
	<form action="/movieRegister.mms" method="post">
		<fieldset>
			<legend>영화입력폼</legend>
			<h3>제목</h3>		
			<input placeholder="제목" name="name">
			<h3>감독</h3>		
			<input placeholder="감독" name="director">
			<h3>관객수</h3>		
			<input placeholder="관객수" name="audienceNum">
			<h3>장르</h3>
			<select name="genre">
					<%for(Genre genre : genres){ %>
					<option value="<%= genre.getNo()%>">
						<%=genre.getName() %>
					</option>
					<%} %>
			</select>
			<h3>개봉일</h3>
			<div>
				<select name="year">
					<%for(int i=year;i>=1895;i--) {%>
					<option>
					<%=i %>
					</option>
					<%} %>
				</select>년
				
				<select name="month">
					<%for(int i=1;i<=12;i++) {%>
					<option <%if(i == month){ %> selected <%} %>>
					<%=i %>
					</option>
					<%} %>
				</select>월
				
				<select name="date">
					<%for(int i=1;i<=31;i++) {%>
					<option>
					<%=i %>
					</option>
					<%} %>
				</select>일
			</div>
			<div>
				<h3>종료일</h3>
				<input name="endDate" id="endDate" />
				<button type="button" id="changeBtn">종료일 없음</button>
			</div>
			<p>
				<button type="reset">리셋</button>
				<button type="submit">입력</button>
			</p>
		</fieldset>
	</form>		
	<a href="/movies.jsp">목록으로</a>
	<a href="/">메인으로</a>
<script src="/js/jquery.js"></script>
<script src="/js/datepicker.min.js"></script>
<script src="/js/datepicker.ko-KR.js"></script>
<script>
	const $endDate = $('#endDate');
	const $changeBtn = $('#changeBtn');
	$changeBtn.click(function(){
		
		// prop : true or false 값이 true냐 false냐? (개발자용)
		// attr : undefiend or disabled 속성이 있냐 없냐? 
		//<input disabled="disabled" />
		//<input /> <-- undefined
		console.log($endDate.prop("disabled"));
		if(!$endDate.attr("disabled")){
			$endDate.attr("disabled",true);
		}else{
			$endDate.attr("disabled",false);
		}
	});

	$('#endDate').datepicker({
		autoPick : true,  	
		autoHide:true,		//클릭하면 자동 숨김
	  	format: 'yyyy-mm-dd',	//자바 맞춤형 포맷
	  	language: 'ko-KR',	//한국어 설정 (i18n)
	  	date:new Date()
	});
</script>
</body>
</html>