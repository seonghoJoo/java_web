<%@page import="com.bmj.model1.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginMember = 
	(Member)session.getAttribute(Member.LOGIN);
%>    
<div id="header">
    <h1><a href="/"><img src="img/logo.png" width="40"/><strong>ODEL1</strong> <span>Board</span></a></h1>
<% if(loginMember==null) { %>    
    <div id="logoutBox">
        <h2 class="screen_out">로그인</h2>
        <form action="login.bmj" method="post">
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
<%} else { %>    
    <div id="loginBox">
        <h2 class="screen_out">유저정보</h2>
        <img src="/profile/<%=loginMember.getProfile() %>"
             class="profile_on"  width="60" height="60"
             alt="<%=loginMember.getNickname() %>"
             title="<%=loginMember.getNickname() %>"/>
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
<%} %>
</div><!-- //header -->
<div id="content">
<div class="aux">
<% 
	String msg = 
	(String)session.getAttribute("msg");

	//msg는 한번쓰고 삭제를 해야 합니다.
	session.removeAttribute("msg");

	
if(msg!=null) {
%>
<script>
	alert("<%=msg%>");
</script>
<%}//if end %>













