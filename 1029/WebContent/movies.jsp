<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>영화목록</title>
<style>
	#loader{
		position : fixed;
		width : 100%;
		height : 100%;
		left : 0;
		top : 0;
		background : #f8f8f8;
		background-image:url(/img/loader.gif);
		background-repeat: no-repeat;
		background-position : center;
		opacity:0.75;
		display : none;
	}
	table{
		border-collapse : collapse;
	}
	td, th{
		border : 1px solid #424242;
		padding : 8px 12px;	
	}
	
</style>
</head>
<body>
	<h1>영화 목록</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>감독</th>
				<th>개봉일</th>
				<th>관객수</th>
				<th>장르 번호</th>
			</tr>
		</thead>
		<tbody>
		<%-- 
		<%if(movies.isEmpty()){ %>--%>
		<tr>
			<td colspan="6">아직 안불러옴</td>
		</tr>
		</tbody>
	</table>

	<div id="loader"></div>
	<button id="btn">불러오기</button>
	<script src="/js/moment-with-locales.js"></script>
	<script src="/js/jquery.js"></script>
	<script>
		const $loader = $('#loader');
		function getMovies(){
			
			$loader.show();

			$.ajax({
				url: "/getMovies.mms",
				dataType: "json",
				type: "GET",
				success:function(json){
					console.log(json);
					$('tbody').empty();
					$(json).each(function(){
						// 브라우저 객체가 요청을 한다. 응답이 온다. ajax javascript 코드로 넘어와서
						// 연산을 하기 때문에 경량적임 JSP보단
					
						
						const $th1 = $('<th>').text(this.no);
						const $th2 = $('<th>').text(this.name);
						const $th3 = $('<th>').text(this.director);
						//unix time 1970년 1월 1일로 해서 몇초 흘렀는지
						const $th4 = $('<th>').text(moment(this.releaseDate).format("YYYY년 M월 D일"));
						const $th5 = $('<th>').text(numberWithCommas(this.audienceNum) + "명");
						const $th6 = $('<th>').text(this.genre);
						
						$("<tr>").append($th1,$th2,$th3,$th4,$th5,$th6).appendTo("tbody");
					});
			
					$loader.hide();
				},
				error : function(){
					alert("서버 점검중!");
				}
			});//ajax() end
		}//getMovies() end
		getMovies();
		
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	</script>
</body>
</html>