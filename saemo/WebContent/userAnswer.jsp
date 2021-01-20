<%@page import="com.doogwal.coffee.dao.MtpQuestsDAO"%>
<%@page import="com.doogwal.coffee.vo.MtpQuest"%>
<%@page import="com.doogwal.coffee.vo.Question"%>
<%@page import="com.doogwal.coffee.dao.QuestionsDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//크루 번호 받기
	String crewNoStr = request.getParameter("crewNo");
	int crewNo = Integer.parseInt(crewNoStr);

	// 크루 질문 가져오기
	List<Question> questions = QuestionsDAO.selectQuestionList(crewNo);
	
	// 크루 객관식 질문 가져오기
	List<MtpQuest> mtpQuestions = MtpQuestsDAO.selectUserAnswersMtpQuestsList(crewNo);
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>가입조건</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/default.css" />
    <link rel="stylesheet" href="css/all.min.css"/>
    <style>
        #container{
            padding-top: 30px;
        }
        #container h2{
            font-size: 20px;
            font-weight: 700;
            margin: 20px 0;
        }
        #form{

        }
        #form dd{
            margin:5px;
        }
        #form dl,dt{
            margin:10px 0;
        }
        .multiple_choice_question dd,label,input{
            display: inline-block;

        }
        input[type="text"]{
            width: 300px;
            padding:8px 10px;
            margin:5px 0;
        }
        .basic_info{
            margin:40px 0;
            position: relative;
        }
        .profile_image_upload img,input,textarea {
            display: inline-block;
            vertical-align: middle;
            margin: 5px 10px 5px 0;
        }
        .basic_info h3{
            margin:10px 0;
            font-size: 18px;
            font-weight: 600;
        }

        .crew_create_btn_box{
            text-align: center;
            position:relative;
            height: 50px;
            padding:25px 0;
        }
        .prev_btn{
            width: 200px;
            height: 50px;
            background-color: #eeeeee;
            outline: none;
            border: none;
        }
        .next_btn{
            width: 200px;
            height: 50px;
            background-color: #eeeeee;
            outline: none;
            border: none;
        }
        .introduce{
            width: 500px;
            height: 100px;
            vertical-align: middle;
            resize: none;
            margin-right: 10px;
            font-size: 20px;
        }
        .counting_characters{/*글자 수 카운티 글*/
            font-size: 10px;
            position: absolute;
            bottom:10px;
            left: 450px;
        }
        .profile_introduce_upload{
            position: relative;
        }
        .profile_image_upload{
            position: relative;
        }
        textarea,input:focus{
            outline-color: #ff6333;
        }
    </style>
</head>
<body>
<div id="header"><!--header start-->
    <div class="inner">
        <div class="header_logo_search"><!--header_left start-->
            <img src="img/logo.png" alt="saemo logo" title="saemo logo" />
            <form class="header_search"><!--header_search-->
                <fieldset><!--fieldset-->
                    <legend class="screen_out">검색</legend>
                    <input placeholder="검색어를 입력하세요." maxlength="10" />
                    <button type="submit"><i class="fas fa-search"></i></button>
                </fieldset><!--//header_search-->
            </form><!--//#form -->
        </div><!--//header_left end-->
        <div class="header_crew_list_meeting_status"><!--header_right start-->
            <div class="header_crew_list"><!--header_crew_list-->
                <ul>
                    <li><a href="/"><img class="header_crew_list_on" src="img/category1.jpg" width="40" height="40" /></a></li>
                    <li><a href="/"><img src="img/category2.jpg" width="40" height="40" /></a></li>
                    <li><a href="/"><img src="img/category3.jpg" width="40" height="40" /></a></li>
                </ul>
            </div><!--//header_crew_list -->
            <div class="header_meeting_home"><a href=""><i class="far fa-handshake"></i></a></div>
            <div class="header_status"><a href=""><i class="fas fa-user-circle"></i></a></div>
            <div class="header_status_dropbox">
                <h3 class="screen_out">내메뉴</h3>
                <ul>
                    <li><a href="">마이페이지</a></li>
                    <li><a href="">로그아웃</a></li>
                </ul>
            </div>
        </div><!--//header_right end-->
    </div><!--// inner end-->
    <div class="progressbar_container">
        <div class="step_progressbar"></div>
    </div>
</div><!--//header end-->
<div id="container">
    <h2>두괄 크루가 물어보고 싶은게 있대요!</h2>
    <div class="form_box">
        <form id="form">
            <fieldset>
                <dl>
                    <dt class="multiple_choice_question">1.연봉이 어떻게 되시나요?</dt>
                    <dd>
                        <label>
                            <input type="radio" id="multiple_choice_question1_1" name="multiple_choice_question1"/>
                            <span>4000 미만</span>
                        </label>
                    </dd>
                    <dd>
                        <label>
                            <input type="radio" id="multiple_choice_question1_2" name="multiple_choice_question1"/>
                            <span>4000 이상</span>
                        </label>
                    </dd>

                    <dt class="multiple_choice_question">2.성격은 어떤가요?</dt>
                    <dd>
                        <input type="radio" id="multiple_choice_question2_1" name="multiple_choice_question2"/>
                        <label for="multiple_choice_question2_1"><h4>내성적</h4></label>
                    </dd>
                    <dd>
                        <input type="radio" id="multiple_choice_question2_2" name="multiple_choice_question2"/>
                        <label for="multiple_choice_question2_2"><h4>외향적</h4></label>
                    </dd>
                    <dd>
                        <input type="radio" id="multiple_choice_question2_3" name="multiple_choice_question2"/>
                        <label for="multiple_choice_question2_3"><h4>중립</h4></label>
                    </dd>
                </dl>

                <dl>
                    <dt class="multiple_choice_question1">3. 직업이 되시나요?</dt>
                    <dd>
                        <label>
                            <input type="text" id="subjective_choice_question1_1" name="subjective_choice_question1"/>
                            <div class="extra_description">(공무원은 9급, 소방관, 경찰은 환영합니다.)</div>
                        </label>
                    </dd>
                </dl>

                <dl>
                    <dt class="file_attachment_question">4. 귀하의 사진을 올려주세요</dt>
                    <dd>
                        <label>
                            <input type="file" id="file_attachment_question1_1" name="file_attachment_question1"/>
                        </label>
                    </dd>
                </dl>
                <div class="basic_info">
                    <div class="profile_image_upload">
                        <label>
                            <h3>프로필 사진</h3>
                            <img src="img/default.jpg" width="60" height="60"/>
                            <input type="file" id="profile" name="profile"/>
                        </label>
                        </dd>
                    </div>
                    <div class="profile_introduce_upload">
                        <label>
                            <h3>간단한 자기소개</h3>
                            <textarea maxlength="100" class="introduce" placeholder="내용을 입력해 주세요"></textarea>
                            <span class="counting_characters">(0/100자)</span>
                        </label>
                    </div>
                </div>
                <div class="crew_create_btn_box">
                    <button type="button" class="prev_btn"><a>이전</a></button>
                    <button type="submit" class="next_btn">제출</button>
                </div><!--crew_create_btn_box end-->
            </fieldset>
        </form>
    </div>
</div>
<div id="footer"><!--//footer start-->
    <div class="inner"><!--//inner start-->
        <ul class="footer_container_help"><!--// footer_conatiner_left start-->
            <li><a href="">이용약관</a></li>
            <li><a href="">FAQ</a></li>
            <li><a href="">회사소개</a></li>
        </ul><!--// footer_conatiner_left end-->
        <div class="footer_container_company_name clear_fix">
            <span> &copy; 두괄</span>
        </div><!--// footer_conatiner_start end-->
        <dl>
            <dt>
                <address class="footer_address">주소 : 서울특별시 관악구 봉천로 72-6 7층</address>
            </dt>
            <dt>
                <div class="footer_phone_num">전화번호 : 02-123-1234</div>
            </dt>
        </dl>


    </div><!--//footer_container end-->
</div><!--//footer end-->


<script src="js/jquery.js"></script>
<script src="js/default.js"></script>
<script>
    const $addSubjectiveQuestion = $('.add_subjective_question');
    const $addFileAttachmentQuestion = $('.add_file_attachment_question');

    const $crewImageSelectedImg = $('.crew_image_selected img');

    const $crewImageItem = $('.crew_image_item input');

    $crewImageItem.change(function (e) {
        e.preventDefault();
        let src = $(this).next().children().data("src");
        console.log("crewImageItemChange: " + src);
        // $(this).children().attr("checked","checked");
        $crewImageSelectedImg.attr("src", src);
    });

    $("#profile").on("change",function() {

        const file = this.files[0];
        console.log("file: "+ file);

        //image/ 로 시작하는

        if (/^image\//.test(file.type)) {

            //alert("여기에 오면 파일이 있고 사진임");

            //multipart/form-data에 필요함
            const formData = new FormData();

            formData.append("uploadImg", file, file.name);
            formData.append("type", "B");//B는 board의 줄임말

            //여기서 ajax로 파일 업로드 수행
            $.ajax({
                url:"ajax/uploadImage.json",
                processData : false,//multipart/form-data
                contentType : false,//multipart/form-data
                data : formData,//multipart/form-data
                type : 'POST',//multipart/form-data
                dataType : "json",
                error : function(xhr, error, code) {
                    alert("에러:" + code);
                },
                success:function(json) {
                    console.log("ajax 실행:"+json.url);
                    $('.profile_image_upload img').attr("src",json.url);
                }
            });
        } else {
            alert("이미지를 선택해주세요!");
        }
    });



    $('.introduce').keyup(function (e){
        let val = $(this).val();
        val = val.substr(0,100);
        $('.counting_characters').text("("+val.length+" /100자)");    //글자수 실시간 카운팅
    });
</script>
</body>
</html>