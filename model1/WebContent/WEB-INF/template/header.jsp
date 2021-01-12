<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="header">
    <h1><a href="/"><img src="img/logo.png" width="40"/><strong>ODEL1</strong> <span>Board</span></a></h1>

    <div id="logoutBox">
        <h2 class="screen_out">로그인</h2>
        <form action="/login.bmj" method="post">
            <fieldset>
                <legend class="screen_out">로그인 폼</legend>
                <label for="id" class="screen_out">아이디</label>
                <input type="text" placeholder="아이디" id="id" name="id">
                <label for="pwd" class="screen_out">비밀번호</label>
                <input type="password" placeholder="비밀번호" id="pwd" name="password">
                <button class="btn"><i class="fas fa-sign-in-alt"></i> 로그인</button>
                <a href="/join.jsp" class="join">회원가입</a>
            </fieldset>
        </form>
    </div>

    <div id="loginBox">
        <h2 class="screen_out">유저정보</h2>
        <img src="/profile/IMG_1136.JPG"
             class="profile_on"  width="60" height="60"
             alt="화염병"
             title="화염병"/>
        <div id="profilePopup" class="profile_on">
            <ul id="profileList">
                <li class="profile"><a href="/user.jsp?no=1"><span class="open_door" >문</span> 마이페이지</a></li>
                <li class="profile"><a href="/logout.bmj"><span class="close_door" >문</span> 로그아웃</a></li>
            </ul><!--//profileList-->
        </div><!--//#profilePopup-->
    </div><!--// loginBox-->
    <script>
        const $profile = $("#loginBox img");
        const $profileTarget = $("#profilePopup");

        $profile.click(function () {
            $profileTarget.toggle();
        });// profileBox click end

        $("html").click(function(e){
            if(!$(e.target).hasClass("profile_on")){
                $profileTarget.hide();
            }
        });//
    </script>


</div><!-- //header -->
<div id="content">
    <div class="aux"><!-- aux : 보조의 -->