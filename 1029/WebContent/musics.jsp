<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ajax | s </title>
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
	<h1>음악목록</h1>
	<table>
		<thead>
			<tr>
				<th>제목</th>
				<th>아티스트</th>
				<th>장르</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="3">아직 안불러옴</td>
			</tr>
			 
		</tbody>
	</table>

	<div id="loader"></div>
	<button id="btn">불러오기</button>
	<script src="/js/underscore-min.js"></script>
	<script src="/js/jquery.js"></script>
	<script>
		//로딩 이미지
		const $loader = $('#loader');
		console.log("hi");
		//ajax로 음악목록(json)을 불러오는 함수
		function getMusics(){

			//로딩 이미지 보여줌
			$loader.show();
			$.ajax({
				url:"/ajax/musics.json",
				dataType : "json",	//html,json,text,xml...
				type : "GET",//GET,POST,PUT,DELETE
				success: function(json){
					$("tbody").empty();
					console.log(json);
					
					//_.each(musicList,function(music,idx){
					_.each(json,function(music,idx){
						const $tr = $('<tr>');
						const $th = $('<th>').text(music.title);
						const $td1 = $('<td>').text(music.artist);
						const $td2 = $('<td>').text(music.genre);
						$tr.append($th,$td1,$td2).appendTo("tbody");
					});// each() end
					$loader.hide();
				},
				error: function(){
					alert("서버 점검중");
				}
			});//ajax() end
			
		}//getMusics() end
		$('#btn').click(function(e){
			getMusics();
		});
	
	</script>
</body>
</html>