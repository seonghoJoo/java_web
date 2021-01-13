<%@page import="com.bmj.model1.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// loginMember 세션 얻기
	Object loginMember = session.getAttribute(Member.LOGIN);
	
	System.out.println(loginMember);
	
	// 만약 세션 충족 못할시 /로 보냄
	if(loginMember!=null) response.sendRedirect("/");
%>    
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
    <%-- 
	프로필 사진은 벌써 업로드 되어있기 때문에 
	multipart/form-data가 아니라
	application/x-www-form-urlencoded 입니다. --%>
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
<script src="js/jquery.js"></script>
<script src="js/fix-footer.js"></script>  
<script src="js/moment-with-locales.js"></script>
<script>

//form
const $joinForm = $("#joinBox>form");

/* 정규 표현식 */

//아이디가  첫글자는 영어로, 영어와 숫자로 4~20글자까지라면

//비밀번호가 4~32자로 영어, 숫자
const pwdReg = /^[\w]{4,32}$/;
//image인지 확인하는 정규표현식
const profileReg = /^image/;
//닉네임 정규표현식
const nicknameReg = /^[ㄱ-힣|0-9]{1,5}$/;

//id
const $id = $("#id");
//id msg
const $idMsg = $(".msg.id");

//nickname
const $nickname = $("#nickname");
//nickname msg
const $nicknameMsg = $(".msg.nickname");

//pwd
const $pwd = $("#pwd");
//pwd msg
const $pwdMsg = $(".msg.pwd");

//confirm 
const $confirm = $("#confirm");
//confirm msg
const $confirmMsg = $(".msg.confirm");

//year
const $year = $("#year");
//month
const $month = $("#month");
//date
const $date = $("#date");
//birth msg
const $birthMsg = $(".msg.birth");

//profile input요소(type file)
const $profile = $("#profile");
//profile msg 
const $profileMsg = $(".msg.profile");
//profileName
const $profileName = $("#profileName");
//profileImg
const $profileImg = $("#profileImg");
//profileBox
const $profileBox = $("#profileBox");

const $submitBtn = $(".submit");

//유효성검사가 되었는지 확인하는 배열
//id,nickname,password,birthDate,profile
const validArr = [false,false,false,false,false];

//기존의 글자를 저장하는 변수
let oldId = "";
let oldNickname = "";

/*유효성검사 함수들 */

//아이디 유효성검사용 함수
function checkId() {
	
	console.log("checkID!!");
	
    //유저가 입력한 값을 얻어옴
   let value = $id.val();
    
    //이전 글자와 현재 글자가 같지 않을때만
   if(oldId!=value) { 
	   //현재 글자를 이전글자로 업데이트
	   oldId = value;
	   
	 //체크를 다시 시작하니까 무조건 false로
		validArr[0] = false;
   
	   if(idReg.test(value)) {
		   
		   //ajax작동시작
		   $idMsg.removeClass("ok")
		         .text("확인중...");
		   
		   //application/x-www-form-urlencoded
		   $.ajax({
			   url:"/ajax/checkId.json",
			   dataType:"json",
			   data:{"id":value},
			   error:function() {
				   
				  alert("서버 점검중!");
				  
			   },
			   success:function(json) {
				   
				   if(json.cnt==0) {
					   $idMsg.addClass("ok").text("아주 좋은 아이디입니다.");
					   validArr[0] = true;
				   }else {
					   validArr[0] = false;
					   $idMsg.removeClass("ok").text("이미 사용중이거나 탈퇴한 아이디입니다.");
				   }//if~else end
				   
				   checkValid();
				   
			   }//success end
		   });//$.ajax() end
	        
	   }else {
	        $idMsg.removeClass("ok").text("첫글자를 영어로, 영어,숫자 4~20글자로 입력해주세요.");
	        checkValid();
	   }//if~else end
   
   }//if end

}//checkId end

$id.keyup(checkId)
   .blur(checkId)
   .focus();//id에 포커스 지정
   
   function checkNickname() {
		
	    //유저가 입력한 값을 얻어옴
	   let value = $nickname.val();
	    
	    //이전 글자와 현재 글자가 같지 않을때만
	   if(oldNickname!=value) { 
		   //현재 글자를 이전글자로 업데이트
		   oldNickname = value;

		 	//체크를 다시 시작하니까 무조건 false로
			validArr[1] = false;
		   	console.log(value);
	   
		   //if(nicknameReg.test(value)) {
			   
			   //ajax작동시작
			   $nicknameMsg.removeClass("ok")
			         .text("확인중...");
			   
			   //application/x-www-form-urlencoded
			   $.ajax({
				   url:"/ajax/checkNickname.json",
				   dataType:"json",
				   data:{"nickname":value},
				   error:function() {
					   
					  alert("서버 점검중!");
					  
				   },
				   success:function(json) {
					   
					   if(json.count==0) {
						   validArr[1]  = true;
						   $nicknameMsg.addClass("ok").text("아주 좋은 별명입니다.");
					   }else {
						   validArr[1]  = false;
						   $nicknameMsg.removeClass("ok").text("이미 사용중이거나 탈퇴한 별명입니다.");
					   }//if~else end
					   
					   checkValid();
					   
				   }//success end
			   });//$.ajax() end
		        
		  //}else {
		   //     $nicknameMsg.removeClass("ok").text("한글로 1~5글자로 입력해주세요.");
		   //     checkValid();
		   //}//if~else end
	   
	   }//if end
		
	}//checkNickname() end

	   
	$nickname.keyup(checkNickname)
	         .blur(checkNickname);
	

	//비밀번호 유효성검사하는 함수
	function checkPwd() {
		
		if(pwdReg.test($pwd.val())) {
			$pwdMsg.addClass("ok").text("좋은 비밀번호입니다.");
		}else {
			$pwdMsg.removeClass("ok").text("영어,숫자 4~32글자로 입력해주세요.");
		}//if~else end
		
		checkConfirmPwd();
		
	}//checkPwd() end

	function checkConfirmPwd() {
		
		const value = $confirm.val();
		
		if(value.length!=0 && value==$pwd.val()) {
			validArr[2] = true;
			$confirmMsg.addClass("ok")
			           .text("비밀번호와 일치합니다.");
		}else {
			validArr[2] = false;
			$confirmMsg.removeClass("ok")
	        .text("비밀번호와 동일하게 입력해주세요.");
			
		}//if else end
		
		checkValid();
		
	}//checkConfirmPwd() end
	   
	$pwd.keyup(checkPwd);
	$confirm.keyup(checkConfirmPwd);  


//년월일이 제대로 되었는지 확인하는 함수
function checkBirthDate() {
	
	const year = $year.val();
	const month = $month.val();
	const date = $date.val();
	
	const birth = moment([year,month-1,date]);
	
	
	
	if(year>0 && birth<=moment() && birth.isValid()) {
		validArr[3] = true;
		$birthMsg.addClass("ok")
		         .text("아주 좋은 생년월일입니다.");
	}else {
		validArr[3] = false;
		$birthMsg.removeClass("ok")
                 .text("제대로 된 생년월일을 입력해주세요.");
		
	}//if~else end
	
	checkValid();
	
}//checkBirthDate() end

$year.keyup(checkBirthDate);
$month.keyup(checkBirthDate);
$date.keyup(checkBirthDate);

//프로필 사진 유효성검사
function checkProfile() {
	
	validArr[4] = false;
	
	//jquery객체에서 순수자바스크립트요소객체 얻기
	const profile = $profile.get(0);
	
	//input type=file요소(순수자바스크립트)는 무조건
	//files배열을 가지고 있습니다.
	
	//한 개의 파일
	const file = profile.files[0];
		
	//File 객체의 속성
	//- type : MIME( image/jpeg, audio/mp3, video/mp4...)
	//- name : 파일명
	//- lastModified : 최종수정일
	//- size : 파일 크기
	
	if(file==null||file.size<=0) {
		
		$profileMsg.removeClass("ok")
		           .text("제대로 된 파일을 선택해주세요.");
		
		return;
	}//if end
	
	//이미지인지 확인!!
	if(!profileReg.test(file.type)) {
		
		$profileMsg.removeClass("ok")
        .text("이미지 파일을 선택해주세요.");
		
		return;
	}else {
		
		$profileMsg.text("");
		
	}//if~else end
	
	
	//여기에 넘어왔다는 뜻은 유저가 선택한 파일이
	//1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.
	
	//ajax로 넘길 폼을 생성하고
	const form = new FormData();
	
	//우리가 선택한 파일을 붙임
	form.append("type","P");//일반적인 데이터
	
	//1)파라미터명, 2) 파일 3) 파일명
	form.append("uploadImage",file,file.name);
	
	//multipart/form-data로 ajax처리
	$.ajax({
		url:"/ajax/uploadImage.json",
		dataType:"json",
		type:"POST",//multipart/form-data
		processData:false,//multipart/form-data
		contentType:false,//multipart/form-data
		data:form,
		error:function() {
			alert("사진 서버 점검중!");
		},
		success:function(json) {
			
			validArr[4] = true;
			
			$profile.val("");
			$profileImg.attr("src","/profile/"+json.imageName);
			$profileName.val(json.imageName);
			$profileBox.removeClass("no_image");
			
			checkValid();
			
		}//success end
		
	});//ajax() end
	

	
}//checkProfile() end

   
//profile사진이 변경되면
$profile.change(checkProfile);//change() end

//사진 x버튼 눌렀을때 사진 초기화
$(".delete").click(function() {
	$profile.val("");
	$profileName.val("");
	$profileBox.addClass("no_image");
	validArr[4] = false;
	checkValid();
});//click() end



function checkValid() {
	
	let cnt = 0;
	
	for(let i = 0 ; i < validArr.length ; i++) {
		
		if(validArr[i]) cnt++;
		
	}//for end
	
	console.log(cnt);
	
	if(cnt==validArr.length-1) {
		$submitBtn.prop("disabled",false);
	}else {
		$submitBtn.prop("disabled",true);
	}//if~else end
	
}//checkValid() end


</script>
</body>
</html>