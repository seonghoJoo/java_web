<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
   	<%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="css/crewDetailPage.css" />
    <link rel="stylesheet" href="css/crewDetailPost.css" />
    <style>
    #header{
        position: fixed;
        z-index: 1;
    }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
	<div id="boardPlusContainer" class="board_plus_container"><!--boardPlusContainer-->
        <div class="board_plus_title_box"><!--board_plus_title_box-->
            <div class="board_plus_title"><!--board_plus_title-->
                <span>게시판 추가하기</span><span class="board_number"></span>
            </div><!--//board_plus_title-->
        </div><!--//board_plus_title_box-->
        <div class="board_plus_contents_box"><!--board_plus_contents_box-->
            <div class="board_plus_contents"><!--board_plus_contents-->
                <form action="" method="get">
                    <span>이름 :</span><input id="boardName" name="boardName" placeholder="최대 5자" maxlength="5"/>
                    <button>추가</button>
                </form>
            </div><!--//board_plus_contents-->
        </div><!--//board_plus_contents_box-->
    </div><!--//boardPlusContainer-->
    <div id="crewDetailHeader"><!-- crewDetailHeader -->
        <div class="crew_detail_header_box"><!--crew_detail_header_box-->
            <div class="crew_detail_board_box"><!-- crew_detail_box -->
                <ul class="crew_detail_board_list"><!-- crew_detail_list -->
                    <li class="crew_detail_board_item"><input id="board_item1" name="board_item" type="radio" checked/><label for="board_item1">전체글</label></li><!--
                    --><li class="crew_detail_board_item"><input id="board_item2" name="board_item" type="radio" /><label for="board_item2">일정</label></li><!--
                    --><li class="crew_detail_board_item new_board"><input id="board_item3" name="board_item" type="radio" /><label for="board_item3">ㅎㅎ</label></li><!--
                    --><li class="crew_detail_board_item board_adding">+</li>
                </ul><!-- //crew_detail_list -->
            </div><!-- //crew_detail_box -->
            <div class="crew_operator_function_box"><!-- crew_aram_box -->
                <ul class="crew_operator_function_list"><!-- crew_aram_list -->
                    <li class="crew_operator_function_item"><a href="">모임만들기</a></li><!--
                    --><li class="crew_operator_function_item"><a href="">밋팅만들기</a></li><!--
                    --><li class="crew_operator_function_item crew_applicant"><a href="">밋팅신청목록</a></li><!--
                    --><li class="crew_operator_function_item crew_applicant"><a href="">가입신청자목록</a> </li>
                </ul><!-- //crew_aram_list -->
            </div><!-- //crew_aram_box -->
        </div><!--//crew_detail_header_box-->
    </div><!-- //crewDetailHeader -->
    <div id="crewDetailContainerWrap"><!--crewDetailContainerWrap-->
        <div id="crewDetailContainer"><!--crewDetailContainer-->
            <div id="crewInformationSideBar"><!-- crew_information_side_bar -->
                <div class="crew_information_box"><!-- crew_information_box -->
                    <img src="img/crew_image.jpg" />
                    <div class="crew_name_box">
                        <span class="crew_name">크루명</span>
                        <span class="crew_member_number">(크루원 5명)</span>
                    </div>
                    <span class="crew_introduction">우리 크루는 정진하의 감시 감독 아래에서 행복한....</span>
                </div><!-- //crew_information_box -->
                <div class="meeting_information_box"><!-- meeting_information -->
                    <a href="" class="meeting_bring"><i class="far fa-grin-tongue-squint"></i>밋팅 데려오기</a>
                    <a href="" class="meeting_history"><i class="fas fa-history"></i>밋팅 히스토리</a>
                </div><!-- //meeting_information -->
                <div class="crew_sex_ratio_box"><!-- crew_sex_ratio_box -->
                    <div class="sex_ratio_male_image_box" data-male-number="8"><!--sex_ratio_male_image_box-->
                        <img src="img/sexRatioImgMale.png" width="260" height="260" />
                    </div><!--//sex_ratio_male_image_box-->
                    <div class="sex_ratio_female_image_box" data-female-number="2"><!--sex_ratio_female_image_box-->
                        <img src="img/sexRatioImgFemale.png" width="260" height="260" />
                    </div><!--//sex_ratio_female_image_box-->
                </div><!-- //crew_sex_ratio_box -->
                <div class="saemo_point_box"><!-- seamo_point_box -->
                    <img src="img/saemoPoint.png" width="40" height="40" />
                    <p class="saemo_point">2000</p>
                </div><!-- //seamo_point_box -->
            </div><!--//crewInformationSideBar-->




            <div id="crewPostContainer"><!--crewPostContainer-->
                <div id="fixedPostContainer"><!--fixedPostContainer-->
                    <div class="crew_upcomming_event_box"><!--crew_upcomming_event_box-->
                        <span class="upcomming_event_name">두괄 기획 끈난 기념 회식</span>
                        <span class="upcomming_event_spot">서울시 관악구 / 오후 7시</span>
                        <span class="upcomming_event_participants">3명 참여 중</span>
                        <!-- width: 4+33*n , height: 35*n 이와 같이 계산해서 .upcomming_event_participants_list_box 스타일에 적어주어야 한다. -->
                        <div class="upcomming_event_participants_list_box" style="width: 202px; height: 105px"><!--upcomming_event_participants_list_box-->
                            <ul class="upcomming_event_participants_list"><!--upcomming_event_participants_list-->
                                <li><img src="img/5.jpg" width="30px" height="30px"></li><!--
                                --><li><img src="img/5.jpg" width="30px" height="30px"></li><!--
                                --><li><img src="img/5.jpg" width="30px" height="30px"></li><!--
                                --><li><img src="img/5.jpg" width="30px" height="30px"></li><!--
                                --><li><img src="img/5.jpg" width="30px" height="30px"></li><!--
                                --><li><img src="img/5.jpg" width="30px" height="30px"></li><!--
                                --><li><img src="img/5.jpg" width="30px" height="30px"></li><!--
                                --><li><img src="img/5.jpg" width="30px" height="30px"></li><!--
                                --><li><img src="img/5.jpg" width="30px" height="30px"></li><!--
                                --><li><img src="img/5.jpg" width="30px" height="30px"></li><!--
                                --><li><img src="img/5.jpg" width="30px" height="30px"></li><!--
                                --><li><img src="img/5.jpg" width="30px" height="30px"></li><!--
                                --><li><img src="img/5.jpg" width="30px" height="30px"></li><!--
                                --><li><img src="img/5.jpg" width="30px" height="30px"></li>
                            </ul><!--//upcomming_event_participants_list-->
                        </div><!--//upcomming_event_participants_list_box-->
                    </div><!--//crew_upcomming_event_box-->
                    <div class="crew_qualification_condition_box"><!--crew_qualification_condition-->
                        <div class="crew_qualification_condition_title"><span>가입 조건</span></div>
                        <div class="condition_box"><!--condition_box-->
                            <ol class="condition_list"><!--condition_list-->
                                <li>1. 연봉 무엇?</li>
                                <li>2. 직업 무엇?</li>
                                <li>3. 연봉 무엇?</li>
                                <li>4. 이건 보이면 안돼</li>
                            </ol><!--//condition_list-->
                            <div class="view_more">...더 보기</div>
                            <div class="crew_join"><a href="">크루 가입하기</a></div>
                        </div><!--//condition_box-->
                    </div><!--crew_qualification_condition-->
                    <div class="precedence_fixing_post_box"><!--precedence_fixing_post_box-->
                        <ul class="precedence_fixing_post_list">
                            <li class="precedence_fixing_post_item">
                                <div class="precedence_fixing_post_before_icon"><i class="fas fa-grip-lines-vertical"></i></div>
                                <div class="precedence_fixing_post">sdfsdfsdfsdfsfsdfsdfsdsdfsdfsdfsdfssdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdf</div>
                                <div class="precedence_fixing_post_after_icon"><i class="fas fa-caret-right"></i></div>
                            </li>
                            <li class="precedence_fixing_post_item">
                                <div class="precedence_fixing_post_before_icon"><i class="fas fa-grip-lines-vertical"></i></div>
                                <div class="precedence_fixing_post">sdfsdfsdfsdfsfsdfsdfsdsdfsdfsdfsdfssdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdf</div>
                                <div class="precedence_fixing_post_after_icon"><i class="fas fa-caret-right"></i></div>
                            </li>
                        </ul>
                    </div><!--fixingPostContainer-->
                </div><!--//precedence_fixing_post_box-->
                <div class="post_variable_box"><!--post_variable_box-->


<!-- ----------------------------------주성호 2021 01 14 start----------------------------------------------- -->
                    <div id="crewPostWrap"><!--crewPostWrap-->
                        <div id="postingUserInformationContainer"><!--postingUserInformationContainer-->
                            <!-- -----------------------postUserInfoTmpl------------------------------ -->


                        </div><!--//postingUserInformationContainer-->
                        <div id="postingContentsContainer"><!--postingContentsContainer-->
                            <p class="posting_text">다 들어와</p>
                            <div class="posting_image"><!--posting_image-->
                                <ul class="posting_image_list"><!--posting_image_list-->
                                    <li class="posting_image_item"><img src="img/arimPost.png" width="100%" height="100%" /></li>
                                    <li class="posting_image_item"><img src="img/arimPost.png" width="100%" height="100%" /></li>
                                    <li class="posting_image_item"><img src="img/arimPost.png" width="100%" height="100%" /></li>
                                    <li class="posting_image_item"><img src="img/arimPost.png" width="100%" height="100%" /></li>
                                    <li class="posting_image_item"><img src="img/arimPost.png" width="100%" height="100%" /></li>
                                    <li class="posting_image_item"><img src="img/arimPost.png" width="100%" height="100%" /></li>
                                    <li class="posting_image_item"><img src="img/arimPost.png" width="100%" height="100%" /></li>
                                    <li class="posting_image_item"><img src="img/arimPost.png" width="100%" height="100%" /></li>
                                </ul><!--//posting_image_list-->
                            </div><!--//posting_image-->
                        </div><!--//postingContentsContainer-->
                        <div id="postCountContainer"><!--postCountContainer-->
                            <div class="like_box"><!--like_box-->
                                <div class="like_icon"><i class="fas fa-heart"></i></div>
                                <span class="like_count">2</span>
                                <div class="like_sort_icon"><i class="far fa-caret-square-down"></i></div>
                                <div class="sorting_like_box"><!--sorting_like_box-->
                                    <div class="sorting_like_title_box"><!--sorting_like_title_box-->
                                        <div class="like_icon"><i class="fas fa-heart"></i></div>
                                        <span class="like_count">2개</span>
                                    </div><!--//sorting_like_title_box-->
                                    <ul class="sorting_like_list"><!--sorting_like_list_box_list-->
                                <!-- -----------------------------sortingLikeListTmpl -----------------------------------  -->


                                    </ul><!--//sorting_like_box_list-->
                                </div><!--//sorting_like_box-->
                            </div><!--//like_box-->
                            <div class="comment_box"><!--comment_box-->
                                <span class="comment_title">댓글</span>
                                <span class="comment_count">2</span>
                            </div><!--//comment_box-->
                        </div><!--//postCountContainer-->
                        <div id="postReactionContainer"><!--postReactionContainer-->
                            <div class="like_btn"><input id="likeBtn" type="checkbox" /></div>
                            <button class="comment_btn"></button>
                        </div><!--//postReactionContainer-->
                        <div id="commentContainer"><!--commentContainer-->
                            <ul class="commented_list"><!--commented_list-->
                                <!-- ----------------------------- commentListTmpl -----------------------------------  -->

                            </ul><!--//commented_list-->
                        </div><!--//commentContainer-->
                        <div id="commentingContainer"><!--commentingContainer-->
                            <form action="">
                                <input id="commeningInput" />
                                <div class="commenting_user_profile"><img src="img/5.jpg" /></div>
                                <button id="commentingBtn">보내기</button>
                            </form>
                        </div><!--//commentingContainer-->
                    </div><!--//crewPostWrap-->


<!-- ----------------------------------주성호 2021 01 14 start----------------------------------------------- -->
                </div><!--//post_variable_box-->
            </div><!--//crewPostContainer-->
            <div id="crewFunctionBar"><!--crewFunctionBar-->
                <div class="chatting_box"><!--chatting_box-->
                    <span>채팅</span>
                    <div class="current_chatting_box"><!--current_chatting_box-->
                        <a class="current_chatting" href=""><!--current_chatting-->
                            <img src="img/5.jpg" />
                            <span class="chatting_box_crew_name">크루명</span>
                            <span class="chatting_text">어쩌구저쩌구</span>
                        </a><!--//current_chatting-->
                    </div><!--current_chatting-->
                </div><!--//chatting_box-->
                <div class="meeting_apply_box"><!--meeting_apply_list-->
                    <dl class="meeting_apply_list"><!--meeting_apply_list-->
                        <dt>신청목록(1)</dt>
                        <dd class="meeting_apply_item"><!--meeting_basket_item-->
                            <a href="">
                                <img src="img/5.jpg" width="40px" height="40px" />
                                <span class="apply_item_crew_name">뜨개뜨개</span>
                                <span class="apply_item_meeting_name">목요일에 뜨개뜨개</span>
                            </a>
                        </dd><!--//meeting_basket_item-->
                        <dd class="meeting_apply_item"><!--meeting_basket_item-->
                            <a href="">
                                <img src="img/5.jpg" width="40px" height="40px" />
                                <span class="apply_item_crew_name">뜨개뜨개</span>
                                <span class="apply_item_meeting_name">목요일에 뜨개뜨개</span>
                            </a>
                        </dd><!--//meeting_basket_item-->
                        <dd class="meeting_apply_item"><!--meeting_basket_item-->
                            <a href="">
                                <img src="img/5.jpg" width="40px" height="40px" />
                                <span class="apply_item_crew_name">뜨개뜨개</span>
                                <span class="apply_item_meeting_name">목요일에 뜨개뜨개</span>
                            </a>
                        </dd><!--//meeting_basket_item-->
                    </dl><!--//meeting_apply_list-->
                </div><!--//meeting_apply_list-->
            </div><!--//crewFunctionBar-->
        </div><!--//crewDetailContainer-->
    </div><!--//crewDetailContainerWrap--> 






<%@ include file="/WEB-INF/template/footer.jsp" %>

<script type="text/template" id="postUserInfoTmpl">
    <div class="posting_user_profile"><img src="img/<@= post.img@>" /></div>
    <span class="posting_user_name"><@= post.writer@></span>
    <span class="posting_date"><@= post.writedate@></span>
</script>

<script type="text/template" id="sortingLikeListTmpl">
    <@ _.each(liker, function(){ @>
    <li class="sorting_like_list_item">
        <div class="like_user_profile"><img src="img/<@= liker.getProfileImage()@>" width="40" height="40" /></div>
        <span class="like_user_name"><@= liker.getName()@></span>
    </li>
    <@})@>
</script>

<script type="text/template" id="commentListTmpl">
    <@ _.each(reply, function(){ @>
    <li class="commented_item"><!--commented_item-->
        <div class="commented_user_profile"><img src="img/arimProfile.jpg" width="40" height="40" /></div>
        <span class="commented_user_name">이아림</span>
        <p class="commented_text">ㅎㅇㅎㅇ 방가</p>
        <div class="commented_reaction_box"><!--commented_add_box-->
            <span class="commented_date">2020년 12월 3일 오전 9:30</span>
            <button class="like_btn">좋아요</button><!--
         --><button class="comment_btn">답글쓰기</button>
        </div><!--//commented_add_box-->
    </li><!--//commented_item-->
    <@})@>
</script>


<script src="/js/crewDetailPage.js"></script>
<script src="/js/crewDetailPost.js"></script>
<script>
	_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
	
	/*이름 / 작성자 / 프로필*/
	const $postingUserInformationContainer = $('#postingUserInformationContainer');
	const postUserInfoTmpl = _.template($('#postUserInfoTmpl').html());
	$.ajax({
	    url:"/ajax/postInfo.json",
	    type:'post',
	    dataType:'json',
	    error : function(xhr, error, code) {
	        alert("에러:" + code);
	    },
	    success:function (json){
	        $postingUserInformationContainer.html(postUserInfoTmpl({post:json}));
	    }
	});
	
	/*좋아요 이미지*/
	const $sortingLikeList = $('.sorting_like_list');
	const $sortingLikeListTmpl = _.template($('#sortingLikeListTmpl').html());
</script>
</body>
</html>