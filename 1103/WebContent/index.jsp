<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>멋진 전화번호부</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/all.min.css"/>
    <link rel="stylesheet" href="css/notosanskr.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="icon" href="favicon.png">
</head>
<body>
<div id="intro">
    <div id="loginBox">
        <h1><img id="logo" src="favicon.png" width="60"> <span>멋진 전화번호부</span></h1>
        <form method="post"
              action="">
            <fieldset>
                <legend class="screen_out">로그인폼</legend>
                <label for="id" class="screen_out">아이디</label>
                <input type="text" autofocus name="id"
                       id="id" placeholder="아이디" title="아이디를 입력해주세요."/>
                <label for="pwd" class="screen_out">비밀번호</label>
                <input type="password" name="password"
                       id="pwd" placeholder="비밀번호" title="비밀번호를 입력해주세요."/>
                <button id="loginBtn" title="로그인버튼"><i class="fas fa-sign-in-alt"></i> 로그인</button>
            </fieldset>
        </form>

        <a id="joinLink" href=""><i class="fas fa-user-plus"></i> 회원가입</a>
    </div>
    <div id="videoContainer">
        <video muted autoplay loop id="video">
            <source src="video/BandVideo.mp4"/>
        </video>
    </div>
</div>
</body>
</html>


    