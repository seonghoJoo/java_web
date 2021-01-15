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
            <form method="post" action="/join.bmj">
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
                        <button class="btn submit" type="submit"><i class="fas fa-sign-in-alt"></i> 회원가입</button>
                        <a class="btn" href="/index.jsp"><i class="far fa-list-alt"></i> index으로</a>
                    </div><!--//box_btn -->
                </fieldset>
            </form>
        </div><!--// joinBox -->
<%@ include file="/WEB-INF/template/footer.jsp" %>

<script>
	//id 입력 필드
	const $id = $('#id');
	// id에 대한 메세지
	const $idMsg =$('.msg.id');
	//$id.val('크크크크크');
	//$idMsg.text('크크크크크');
	
	//id 입력 필드
	const $nickname = $('#nickname');
	// id에 대한 메세지
	const $nicknameMsg =$('.msg.nickname');
	
	// 정규표현식
	// ^:시작 $:끝 
	// 첫글자는 영어 쓸수 있다. 
	// \w : 숫자 아님 영어 
	const idRegExp = /^[a-z|A-Z]{1}[\w]{3,19}$/;
	const nicknameRegExp = /^[가-힣|\d]{1,5}$/;
	//console.log(idRegExp.test("111"));
	//console.log(idRegExp.test("a1"));
	//console.log(idRegExp.test("aa111"));
	//console.log(idRegExp.test("aaa111"));
	//console.log(idRegExp.test("asdasdasdasd"));
	//$id.on("blur",function(){}) : focus가 맞았다가 떨어질때
	
	// 아이디 입력필드에 글자를 썼을 때
	$id.on("keyup",function(e){
		
		// 유저가 입력한 id값을 얻어옴
		let id = $id.val();
		
		id = id.substr(0,20);
		$id.val(id);
		
		// 우선 검사중으로
		$idMsg.removeClass("ok").text('검사중...');	
		//우선 정규표현식으로 test
		if(idRegExp.test(id)){
			//이때 ajax를 실행하여 데이터베이스에 이 아이디가 존재하는지 확인
			$.ajax({
				url:"/ajax/checkId.json",
				type:"GET",//방식 
				data:{"id":id},//파라미터 data:{id:id} "문자열 생략가능"
				dataType:"json", // 응답의자료형 xml/html/text
				error:function(xhr,error){
					// 콜백 함수
					// 문앞에 피자오길 대기타는 고양이 : xhr xmlHttpRequest 객체 
					console.log(error);
					alert("서버 점검중!");
				},
				// json -> 피자
				success:function(json){
					// 콜백 함수
					//중복됨
					console.log(json.result);
					if(json.result==0){					
						$idMsg.addClass("ok").text("좋은 아이디군요 ^_^");
					}
					// 중복 안됨
					else{
						$idMsg.removeClass("ok").text("아이디가 중복됐습니다.");
					}//if~else end
				}
			});//ajax end
		
		}else{
			$idMsg.removeClass("ok").text('영어,숫자로 4~20자 입력해주세요');
		}
		
		
	});//keyup end
	// nickname에 글자를 쓸 때
	$nickname.on("blur",function(e){
		// 유저가 입력한 id값을 얻어옴
		let nickname = $nickname.val();
		
		nickname = nickname.substr(0,20);
		$nickname.val(nickname);
		//우선 정규표현식으로 test
		if(nicknameRegExp.test(nickname)){
			//이때 ajax를 실행하여 데이터베이스에 이 아이디가 존재하는지 확인
			$.ajax({
				url:"/ajax/checkNickname.json",
				type:"GET",//방식 
				data:{"nickname":nickname},//파라미터 data:{id:id} "문자열 생략가능"
				dataType:"json", // 응답의자료형 xml/html/text
				error:function(xhr,error){
					// 콜백 함수
					// 문앞에 피자오길 대기타는 고양이 : xhr xmlHttpRequest 객체 
					console.log(error);
					alert("서버 점검중!");
				},
				// json -> 피자
				success:function(json){
					// 콜백 함수
					//중복됨
					console.log(json.result);
					if(json.result==0){					
						$nicknameMsg.addClass("ok").text("좋은 닉넴~ ^_^");
					}
					// 중복 안됨
					else{
						$nicknameMsg.removeClass("ok").text("닉네임이 중복됐습니다.");
					}//if~else end
				}
			});//ajax end
		
		}else{
			$idMsg.removeClass("ok").text('영어,숫자로 4~20자 입력해주세요');
		}
		
	});
	
	// profile(파일) input 요소  21번째 hidden 
	const $profile = $('#profile');
	const $profileMsg = $('.msg.profile');
	
	// 프로필 박스
	const $profileBox = $('#profileBox');
	
	// 프로필 이미지
	const $profileImg = $("#profileImg");
	
	// 프로필 이름 input hidden
	const $profileName = $('#profileName');
	
	
	
	// 파일이 변경되었을 때
	$profile.on("change",function(){
		// 자바는 윗줄에서 에러가 나면 밑에서 안먹히게됨
		// input type = file 요소에는 (file API 순수 자바스크립트)
		// files 라는 배열이 존재함.
		// $profile.file -> undefined
		// this.files = 파일객체
		// type 
		// image : image/jpeg  // mp3 : audio/mp3
		
		const file = this.files[0];
		
		// 1) 파일의 크기가 0이상
		if(file.size==0){
			$profileMsg.text("제대로 된 파일을 선택하시오. -_-;");
			return; // 밑에 것이 작동이 안됨
		}// if end
		
		//const imageRegExp = /^image/\$/;

		// 2) 파일의 종류가 image
		if(!file.type.includes("image/")){
			$profileMsg.text("이미지 파일을 선택하시오. -_-;");
			console.log("없음");
			return;
		}
		
		$profileMsg.text("파일 업로드 중");
		// 3) 파일 업로드 FormData 객체 생성
		const formData = new FormData();
		
		// 4) formdata에 파라미터를 추가
		
		// ?type=P 파라미터를 넘김
		formData.append("type","P");
		
		// 파일을 append 
		// file: 13.6KB 파일 
		// file.name: ryan.jpg
		formData.append("profile",file,file.name);
		
		// enctype : 한글이 %ED%95%9C....
		// $.ajax의 enctype의 기본값은 enctype="application/x-www-form-urlencoded"
		// multipart/form-data로 넘겨야 함 (필수 얘네 하나라도 실수하면 file upload 불가)
		// 1) post 방식(무조건) : get 방식의 쿼리스트링은 3MB 제한
		// 2) processData : false
		// 3) contentType : false
		
		$.ajax({
			url:"/ajax/UploadProfile.json",
			type : "post",
			processData : false,
			contentType : false,
			data: formData,//진짜 file을 업로드함
			dataaType:"json",
			error:function(){
				// json이 응답하질 않기 때문에 error
				alert("서버 점검중!");
			},
			success:function(json){
				console.log(json.profileName);
				// img 요소의 src 속성
				$profileImg.attr("src","/profile/"+json.profileName);
				
				// profile Box의 no_image 클래스를 제거
				$profileBox.removeClass("no_image");
				
				// 메세지 제거
				$profileMsg.text("");
				
				// input hidden에 이름을 value로 
				$profileName.val(json.profileName);
				
			}
		});// ajax() end
		
		
		// 프레임워크라면 다른데서 뭘 만들었을때 file은 자바스크립트 자체에 포함되어있어서 APi라고 함
		// 자바스크립트 자체에 포함되어 있는 것이라 
		/*
			웹의 역사
			fileupload를 multipart form data를 넘김
			
			HTML5
			FLASH <- adobe 블랙박스 못풀어 ㅜㅜ
			File API
			Form Data API
			
			ECMA script - 누가 주도하질 않지만 표준임 2021년 버전에는 private가 들어감.... java 는 Oracle이 주도
			
			WHATWG
		*/
	});//change() end
	
	//이미지 삭제 버튼
	const $deleteBtn  =$('.delete');
	// 이미지 삭제 버튼을 클릭했을 때
	$deleteBtn.on("click",function(){
		
		alert("기본띠");
		
		// no_image 클래스를 add
		$profileBox.addClass("no_image");
		
		// $profile의 값을 비워야함
		$profile.val('');
	});
	
</script>
</body>
</html>