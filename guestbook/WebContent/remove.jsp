<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>방명록 쓰기</title>
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/all.min.css" />
	<link rel="stylesheet" href="css/notosanskr.css" />
	<link rel="stylesheet" href="css/default.css" />
	<link rel="icon" href="favicon.png"/>
	<style>
		#content h2 {
			font-size:32px;
			color:#2196f3;
			margin:20px 0;
			font-weight:700;
		}

		#content .title {
			width:90px;
			display: inline-block;
			height:40px;
			font-size:21px;
			line-height:40px;
			text-align: right;
			vertical-align: middle;
			color:#424242;
			font-weight: 200;
		}

		#writer,#contents {
			vertical-align: top;
			font-family:"Noto Sans KR",sans-serif;
			font-size:25px;
			width:575px;
			padding:10px;
			border:1px solid #2196f3;;
			/*
			 * textarea크기 변경 못하게
			 */
			resize: none;
			margin-left:5px;
			vertical-align: middle;
		}

		#writer:focus,#contents:focus {
			border-color:#2196f3;;
			background:#efefef;
			outline:2px solid #2196f3;
		}

		#content div {
			margin:10px 0;
		}

		#content .emotion {
			font-size:40px;
			color:#2196f3;
			vertical-align: middle;
			cursor: pointer;
		}
		#content .emotion:hover {
			color:#1976D2;
			text-shadow: 0 8px 17px rgba(0, 0, 0, 0.2);
		}
		.emotion * {
			vertical-align: middle;
		}
		#content .middle {
			vertical-align: middle;
		}
		:checked+i {
			color:#283593;
		}

	</style>
</head>
<body>
<div id="wrap">
<div id="header">
	<h1><a href=""><i class="far fa-comment-dots"></i> BMJ 방명록</a></h1>
</div><!--  //#header -->
<div id="content">
	<h2><i class="fas fa-pencil-alt"></i> 방명록 글쓰기</h2>
	<form method="get" action="">
		<fieldset>
			<legend class="screen_out">글쓰기폼</legend>
			<div>
				<strong class="title middle">표정짓기</strong>
				<label class="emotion">
				<input type="radio" name="emotion" value="G">
					<i class="far fa-grin-stars"></i>
				</label>
				<label class="emotion">
				<input type="radio" name="emotion" value="F">
					<i class="far fa-laugh-squint"></i>
				</label>
				<label class="emotion">
					<input type="radio" name="emotion" value="L">
					<i class="far fa-smile"></i>
				</label>
				<label class="emotion">
					<input type="radio" name="emotion" value="S">
					<i class="far fa-sad-cry"></i>
				</label>
				<label class="emotion">
					<input type="radio" name="emotion" value="A">
					<i class="far fa-angry"></i>
				</label>
			</div>
			<div>
				<label class="title" for="writer">작성자</label>
				<input type="text" id="writer"
				 placeholder="작성자를 입력"/>
			</div>
			<div>
				<label class="title"  for="contents">내 용</label>
				<textarea id="contents" 
				placeholder="내용 입력"
				 cols="50" rows="5"></textarea>
			</div>
			<div class="btn_box">
				<button class="btn" type="reset"><i class="fas fa-retweet"></i> 리 셋</button>
				<button class="btn" type="submit"><i class="fas fa-pencil-alt"></i> 글쓰기</button>
				<a class="btn" href="index.html"><i class="fa fa-arrow-left "></i> 방명록으로</a>
			</div>
		</fieldset>					
	</form>
</div><!--  //#content -->
<div id="footer">
	&copy;2020 BMJ.org
</div><!--  //#footer -->
</div><!-- //#wrap -->
</body>
</html>