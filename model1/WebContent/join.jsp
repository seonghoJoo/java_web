<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입</title>
<%@ include file="/WEB-INF/template/link.jsp" %>

    <link rel="stylesheet" href="/css/join.css" />
</head>
<body>
<div id="header">
    <h1><a href="/index.jsp"><img src="/img/logo.png" width="40"/><strong>ODEL1</strong> <span>Board</span></a></h1>
</div>
<div id="content">
    <div class="aux">
        <h2 class="title"><i class="fas fa-hat-wizard"></i> 회원가입</h2>
        <div id="joinBox">

            <form  method="post" action="/join.bmj">
                <input type="hidden" id="profileName" name="profile" />
                <fieldset>
                    <legend class="screen_out">회원가입폼</legend>
                    <div class="row">
                        <label class="label" for="id">아이디</label>
                        <input id="id" name="id"
                               autocomplete="off"
                               placeholder="영어,숫자로 4~20자 입력"
                               title="영어,숫자로 4~20자 입력"/>
                        <div class="msg id"></div>
                    </div><!--//row-->
                    <div class="row">
                        <label class="label" for="nickname">별 명</label>
                        <input id="nickname"
                               autocomplete="off"
                               placeholder="5자 내로 한글,숫자 입력"
                               title="5자 내로 한글,숫자 입력"
                               name="nickname"/>
                        <div class="msg nickname"></div>
                    </div><!--//row-->
                    <div class="row">
                        <label class="label" for="pwd">비밀번호</label>
                        <input type="password" id="pwd"
                               placeholder="4~32자로 입력"
                               title="4~32자로 입력"
                               name="pwd"/>
                        <div class="msg pwd"></div>
                    </div><!--//row-->
                    <div class="row">
                        <label class="label" for="confirm">비밀번호 확인</label>
                        <input type="password" id="confirm"
                               placeholder="위와 동일하게 입력"
                               title="위와 동일하게 입력"/>
                        <div class="msg confirm"></div>
                    </div><!--//row-->
                    <div class="row">
                        <span class="label">생년월일</span>
                        <p id="birthDate">
                            <label>
                                <input type="text" id="year" name="year"
                                       maxlength="4"
                                       autocomplete="off"
                                       title="태어난 년도를 입력"
                                       placeholder="년(4자리)"/></label>
                            <label>
                                <input type="text" id="month" name="month"
                                       maxlength="2"
                                       autocomplete="off"
                                       title="태어난 월을 입력"
                                       placeholder="월"/>
                            </label>
                            <label>
                                <input type="text" id="date"
                                       name="date"
                                       autocomplete="off"
                                       title="태어난 일을 입력"
                                       maxlength="2"
                                       placeholder="일"/>
                            </label>
                        </p>
                        <div class="msg birth"></div>
                    </div><!--//row-->
                    <div class="row" id="profileRow">
                        <span class="label">프로필사진</span>
                        <div id="profileBox" class="fas fa-user-circle no_image">
                            <img src="" width="140" height="140" id="profileImg"/>
                            <label class="fas fa-camera">
                                <input type="file" id="profile"/>
                            </label>
                            <button type="button" class="delete fas fa-times"><span class="screen_out">삭제</span></button>
                        </div><!-- //profileBox -->
                        <div class="msg profile"></div>
                    </div><!--//profileRow -->
                    <div class="box_btn">
                        <button class="btn submit" disabled type="submit"><i class="fas fa-sign-in-alt"></i> 회원가입</button>
                        <a class="btn" href="/index.jsp"><i class="far fa-list-alt"></i> index으로</a>
                    </div><!--//box_btn -->
                </fieldset>
            </form>
        </div><!--// joinBox -->
<%@ include file="/WEB-INF/template/footer.jsp" %>

<script>
	
</script>
</body>
</html>