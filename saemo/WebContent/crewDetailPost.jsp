<%@page import="com.doogwal.coffee.vo.PageVO"%>
<%@page import="com.doogwal.coffee.dao.BoardsDAO"%>
<%@page import="com.doogwal.coffee.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.doogwal.coffee.vo.CrewPost"%>
<%@page import="com.doogwal.coffee.dao.CrewPostsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	String crewNoStr = request.getParameter("crewNo");
		String memberNoStr = request.getParameter("memberNo");
		String crewOrderStr = request.getParameter("crewOrder");
    	int crewNo = Integer.parseInt(crewNoStr);
    	int crewMemberNo = Integer.parseInt(memberNoStr);
		int crewOrder = Integer.parseInt(crewOrderStr);  
		System.out.println(crewOrder);
    	/**/

    	/*페이지 처리 start*/
    	//현재 페이지 번호
    	int pageNo = 1;

    	//한 페이지에 보여지는 게시물수 
    	int numPage = 2;

    	
    	PageVO pageVO = 
    	new PageVO(pageNo,numPage,crewNo);	
    	
    	
    	/*페이지 처리 end*/
    	
    	List<Board> boards = BoardsDAO.selectBoards(crewNo);
    	
    	int boardNo = boards.get(0).getNo();
    	
    	//List<CrewPost> crewPosts = CrewPostsDAO.selectPostDetailList(crewNo);
    %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
   	<%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/crewDetailPage.css" />
    <link rel="stylesheet" href="/css/crewDetailPost.css" />
    <link rel="stylesheet" href="/css/quill.core.css" />
    <link rel="stylesheet" href="/css/quill.snow.css"/>
    <link rel="stylesheet" href="/css/popWritePost.css" />
    <style>
    #header{
        position: fixed;
        z-index: 1;
    }
    .appear{
    	display:block;
    }
    
    .crewPostWrap{
    	margin-bottom:20px;
    }
    .option_btn{
    	z-index:1;
    }
    .editor_upload_box.ql-toolbar.ql-snow{
    	border-bottom:0;
    	padding:0;
    }
    .popCrewPost{
	    width: 540px;
	    border: 1px solid #eaeaea;
	    box-shadow: 0 0 2px 1px #eaeaea;
	    background-color: white;
	    position:fixed;
	    left:50%;
	    top:10%;
	    margin:0 0 0 -270px;
    	display:none;
    	z-index: 100;
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
                
                 <div class="posting_box"><!--posting_box-->
                    <a class="posting_btn"><span>크루원들은 당신의 얘기를 기다리고 있어요<i class="fas fa-feather-alt"></i></span></a>
                </div><!--//posting_box-->
                
                
                <div class="post_variable_box"><!--post_variable_box-->




<!-- ----------------------------------주성호 2021 01 14 start----------------------------------------------- -->


<!-- ----------------------------------주성호 2021 01 14 end----------------------------------------------- -->
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


    <div class="pop_write_wrap">
    	<div class="pop_write"><!-- popWrite start-->
            <form id="writeForm" method="post" action="/writePost.do">
                <!-- 질문 2 : fieldset 추가 적당한지-->
                <fieldset>
                    <input type="hidden" id="contents" name="contents" value=""/>
                    <input type="hidden" name="boardNo" value="<%=boardNo %>"/>
                    <input type="hidden" name="memberNo" value="<%=crewMemberNo%>"/>
                    <input class="imageApplicable" type="hidden" name="imageApplicable" value="N" />
                    <h2>글쓰기</h2>
                    <div id="standalone-container">
                        <div id="toolbar-container">
                            <!--                    <span class="ql-formats">-->
                            <select class="ql-size">
                                <option>20px</option>
                                <option>28px</option>
                                <option>36px</option>
                                <option>48px</option>
                            </select>
                            <!--                    </span>-->
                            <!--                    <span class="ql-formats">-->
                            <button class="ql-bold" data-toggle="tooltip" data-placement="bottom" title="Bold"></button>
                            <button class="ql-italic" data-toggle="tooltip" data-placement="bottom" title="Italic"></button>
                            <button class="ql-underline" data-toggle="tooltip" data-placement="bottom" title="Underline"></button>
                            <button class="ql-strike" data-toggle="tooltip" data-placement="bottom" title="Strike"></button>
                            <select class="ql-color">
                                <option selected></option>
                                <option value="red"></option>
                                <option value="orange"></option>
                                <option value="yellow"></option>
                                <option value="green"></option>
                                <option value="blue"></option>
                                <option value="purple"></option>
                            </select>
                        </div>
                        <!-- 에디터 감싸는 컨테이너 -->
                        <div id="editorContainer"></div>
                        <div class="file_box">
                            <ul class="file_list"></ul>
                        </div>
                        <!-- 에디터 -->
                        <div class="editor_upload_box">
                            <ul class="editor_write_images">
                                <li>
                                    <label for="image_input"><i class="far fa-image"></i>
                                    </label>
                                    <input id="image_input" type="file" style="display: none;"/>
                                </li>
                                <li>
                                    <label for="file_input"><i class="fas fa-paperclip"></i>
                                    </label>
                                    <input id="file_input" type="file" style="display: none;"/>
                                </li>
                            </ul>
                            <div>
                                <label for="post_top_input">게시글 상위 고정</label>
                                <input type="checkbox" id="post_top_input" name="post_top" value="T"/><!--질문 3: value 뭐가 좋을지? -->
                            </div>

                            <div id="post_submit_btn"><button type="submit">저장</button></div>
                        </div><!--//editor_upload_box end-->
                        <div class="close"><i class="fas fa-times"></i></div>
                    </div>
                </fieldset>
            </form>
        </div><!--// popWrite end-->
  	</div><!-- //pop_write_wrap -->

	
	<div class="pop_write_wrap">
	<div class="popCrewPost"><!--crewPostWrap-->
	
	</div><!--//crewPostWrap-->
	</div>


<%@ include file="/WEB-INF/template/footer.jsp" %>

<script type="text/template" id="postsTmpl">
    <@ _.each(crewPost,function(c){@>
    <div class="crewPostWrap"><!--crewPostWrap-->
		<div class="option_btn"><!--//option_btn start-->
        	<a><i class="fas fa-ellipsis-v"></i></a>
        	<ul class="option_list">
            	<li class="top_item">상위글로 고정</li>
            	<li class="ban_item">신고하기</li>
				<@if(crewMemberNo == c.memberNo){ @>
				<li class="delete_post_item">삭제하기</li>
				<li class="update_post_item">수정하기</li>
				<@}@>
			</ul>
			<input type="hidden" value="<@= c.no@>"/>
			<input type="hidden" value="<@=c.memberNo@>"/>
    	</div><!--//option_btn end-->

	<div class="postingUserInformationContainer"><!--postingUserInformationContainer-->
            <!-- -----------------------postUserInfo------------------------------ -->
 			<div class="posting_user_profile"><img src="/img/<@=c.userMember.profileImg@>" /></div>
        	<span class="posting_user_name"><@=c.userMember.name @></span>
        	<span class="posting_date"><@= moment(c.regdate).format("YYYY년 MM월 DD일 HH:mm:ss")@></span>
			<!-- -----------------------postUserInfoTmpl------------------------------ -->
        </div><!--//postingUserInformationContainer-->
        <div class="postingContentsContainer"><!--postingContentsContainer-->
            <p class="posting_text"><@=c.texts@></p>
            <div class="posting_image image_box_type<@if(c.postImgs.length>5){@><@=4@><@}else{@><@=c.postImgs.length@><@}@>"><!--posting_image-->
                <ul class="posting_image_list"><!--posting_image_list-->
			<!-- -----------------------posting Imags------------------------------ -->
				<@ for(let i=0;i<c.postImgs.length;i++){ @>
					<li class="posting_image_item"><img src="<@=c.postImgs[i].image@>" width="100%" height="100%" /></li>
                <@} @>
			<!-- -----------------------posting Imags------------------------------ -->
				</ul><!--//posting_image_list-->
            </div><!--//posting_image-->
        </div><!--//postingContentsContainer-->
        <div class="postCountContainer"><!--postCountContainer-->
            <div class="like_box"><!--like_box-->
                <div class="like_icon"><i class="fas fa-heart"></i></div>
			<!-- -----------------------like Cnt ------------------------------ -->
                <span class="like_count"><@=c.likeCnt @></span>
			<!-- -----------------------like Cnt ------------------------------ -->
                <div class="like_sort_icon"><i class="far fa-caret-square-down"></i></div>
                <div class="sorting_like_box"><!--sorting_like_box-->
                    <div class="sorting_like_title_box"><!--sorting_like_title_box-->
                        <div class="like_icon"><i class="fas fa-heart"></i></div>
				<!-- -----------------------sorting Cnt ------------------------------ -->
                        <span class="like_count"><@=c.likeCnt@></span>
				<!-- -----------------------sorting Cnt ------------------------------ -->
                    </div><!--//sorting_like_title_box-->
                    <ul class="sorting_like_list"><!--sorting_like_list_box_list-->
                        <!-- -----------------------------sortingLikeList -----------------------------------  -->
					<@ for(let i=0;i<c.likeMembers.length;i++){ @>
						<li class="sorting_like_list_item">
                        	<div class="like_user_profile"><img src="/img/<@=c.likeMembers[i].profileImg @>.jpg" width="40" height="40" /><i class="fas fa-heart"></i></div>
                        	<span class="like_user_name"><@=c.likeMembers[i].name @></span>
                    	</li>
					<@} @>
					<!-- -----------------------------sortingLikeList -----------------------------------  -->
                    </ul><!--//sorting_like_box_list-->
                </div><!--//sorting_like_box-->
            </div><!--//like_box-->
            <div class="comment_box"><!--comment_box-->
                <span class="comment_title">댓글</span>
                <span class="comment_count"><@=c.replyCnt @></span>
            </div><!--//comment_box-->
        </div><!--//postCountContainer-->
        <div class="postReactionContainer"><!--postReactionContainer-->
            <div class="like_btn <@if(c.myLikeCount>0){ @>
				like
				<@}@>">
				<input class="likeBtn" type="checkbox" 
				<@if(c.myLikeCount>0){ @>
				checked="checked"
				<@}@>"/>
				<input type="hidden" value="<@= c.no@>"/>
			</div>
            <button class="comment_btn"></button>
        </div><!--//postReactionContainer-->
        <div class="commentContainer"><!--commentContainer-->
            <ul class="commented_list"><!--commented_list-->
            <!-- ----------------------------- replyList -----------------------------------  -->
			<@ for(let i=0;i<c.replies.length;i++){ @>
				<li class="commented_item"><!--commented_item-->
                	<div class="commented_user_profile"><img src="/img/<@=c.replies[i].profileImg @>" width="40" height="40" /></div>
                	<span class="commented_user_name"><@=c.replies[i].name @></span>
                	<p class="commented_text"><@= c.replies[i].reply@></p>
                	<div class="commented_reaction_box"><!--commented_add_box-->
                    <span class="commented_date"><@= moment(c.replies[i].regdate).format("YYYY년 MM월 DD일 HH:mm:ss")@></span>
                    <!--<button class="comment_btn">답글쓰기</button>-->
                </div><!--//commented_add_box-->
            	</li><!--//commented_item-->
			<@} @>
			<!-- ----------------------------- replyList -----------------------------------  -->
            </ul><!--//commented_list-->
        </div><!--//commentContainer-->
        <div class="commentingContainer"><!--commentingContainer-->
            <form class="reply_form" method="get" action="/ajax/insertReply.json">
                <input class="commeningInput" name="reply"/>
				<input type="hidden" value="<@= c.no@>"/>
                <div class="commenting_user_profile"><img src="/img/<%=userCrews[crewOrder].getProfileImg() %>" /></div>
                <button class="commentingBtn">보내기</button>
            </form>
        </div><!--//commentingContainer-->

    </div><!--//crewPostWrap-->
    <@})@>
</script>




<script type="text/template" id="detailPostsTmpl">
		<div class="option_btn">
        	<a><i class="fas fa-ellipsis-v"></i></a>
        	<ul class="option_list">
            	<li class="top_item">상위글로 고정</li>
            	<li class="ban_item">신고하기</li>
				<@if(crewMemberNo == c.memberNo){ @>
				<li class="delete_post_item">삭제하기</li>
				<li class="update_post_item">수정하기</li>
				<@}@>
        		</ul>
		<input type="hidden" value="<@= c.no@>"/>
    </div>
        <div class="postingUserInformationContainer"><!--postingUserInformationContainer-->
            <!-- -----------------------postUserInfo------------------------------ -->
 			<div class="posting_user_profile"><img src="/img/<@=c.userMember.profileImg@>" /></div>
        	<span class="posting_user_name"><@=c.userMember.name @></span>
        	<span class="posting_date"><@= moment(c.regdate).format("YYYY년 MM월 DD일 HH:mm:ss")@></span>
			<!-- -----------------------postUserInfoTmpl------------------------------ -->
        </div><!--//postingUserInformationContainer-->
        <div class="postingContentsContainer"><!--postingContentsContainer-->
            <p class="posting_text"><@=c.texts@></p>
            <div class="posting_image image_box_type<@if(c.postImgs.length>5){@><@=4@><@}else{@><@=c.postImgs.length@><@}@>"><!--posting_image-->
                <ul class="posting_image_list"><!--posting_image_list-->
			<!-- -----------------------posting Imags------------------------------ -->
				<@ for(let i=0;i<c.postImgs.length;i++){ @>
					<li class="posting_image_item"><img src="<@=c.postImgs[i].image@>" width="100%" height="100%" /></li>
                <@} @>
			<!-- -----------------------posting Imags------------------------------ -->
				</ul><!--//posting_image_list-->
            </div><!--//posting_image-->
        </div><!--//postingC
ontentsContainer-->
        <div class="postCountContainer"><!--postCountContainer-->
            <div class="like_box"><!--like_box-->
                <div class="like_icon"><i class="fas fa-heart"></i></div>
			<!-- -----------------------like Cnt ------------------------------ -->
                <span class="like_count"><@=c.likeCnt @></span>
			<!-- -----------------------like Cnt ------------------------------ -->
                <div class="like_sort_icon"><i class="far fa-caret-square-down"></i></div>
                <div class="sorting_like_box"><!--sorting_like_box-->
                    <div class="sorting_like_title_box"><!--sorting_like_title_box-->
                        <div class="like_icon"><i class="fas fa-heart"></i></div>
				<!-- -----------------------sorting Cnt ------------------------------ -->
                        <span class="like_count"><@=c.likeCnt@></span>
				<!-- -----------------------sorting Cnt ------------------------------ -->
                    </div><!--//sorting_like_title_box-->
                    <ul class="sorting_like_list"><!--sorting_like_list_box_list-->
                        <!-- -----------------------------sortingLikeList -----------------------------------  -->
					<@ for(let i=0;i<c.likeMembers.length;i++){ @>
						<li class="sorting_like_list_item">
                        	<div class="like_user_profile"><img src="/img/<@=c.likeMembers[i].profileImg @>.jpg" width="40" height="40" /><i class="fas fa-heart"></i></div>
                        	<span class="like_user_name"><@=c.likeMembers[i].name @></span>
                    	</li>
					<@} @>
					<!-- -----------------------------sortingLikeList -----------------------------------  -->
                    </ul><!--//sorting_like_box_list-->
                </div><!--//sorting_like_box-->
            </div><!--//like_box-->
            <div class="comment_box"><!--comment_box-->
                <span class="comment_title">댓글</span>
                <span class="comment_count"><@=c.replyCnt @></span>
            </div><!--//comment_box-->
        </div><!--//postCountContainer-->
        <div class="postReactionContainer"><!--postReactionContainer-->
            <div class="like_btn <@if(c.myLikeCount>0){ @>
				like
				<@}@>">
				<input class="likeBtn" type="checkbox" 
				<@if(c.myLikeCount>0){ @>
				checked="checked"
				<@}@>"/>
				<input type="hidden" value="<@= c.no@>"/>
			</div>
            <button class="comment_btn"></button>
        </div><!--//postReactionContainer-->
        <div class="commentContainer"><!--commentContainer-->
            <ul class="commented_list"><!--commented_list-->
            <!-- ----------------------------- replyList -----------------------------------  -->
			<@ for(let i=0;i<c.replies.length;i++){ @>
				<li class="commented_item"><!--commented_item-->
                	<div class="commented_user_profile"><img src="/img/<@=c.replies[i].profileImg @>" width="40" height="40" /></div>
                	<span class="commented_user_name"><@=c.replies[i].name @></span>
                	<p class="commented_text"><@= c.replies[i].reply@></p>
                	<div class="commented_reaction_box"><!--commented_add_box-->
                    <span class="commented_date"><@= moment(c.replies[i].regdate).format("YYYY년 MM월 DD일 HH:mm:ss")@></span>
                    <!--<button class="comment_btn">답글쓰기</button>-->
                </div><!--//commented_add_box-->
            	</li><!--//commented_item-->
			<@} @>
			<!-- ----------------------------- replyList -----------------------------------  -->
            </ul><!--//commented_list-->
        </div><!--//commentContainer-->
        <div class="commentingContainer"><!--commentingContainer-->
            <form class="reply_form" method="get" action="/ajax/insertReply.json">
                <input class="commeningInput" name="reply"/>
				<input type="hidden" value="<@= c.no@>"/>
                <div class="commenting_user_profile"><img src="/img/<%=userCrews[crewOrder].getProfileImg() %>" /></div>
                <button class="commentingBtn">보내기</button>
            </form>
        </div><!--//commentingContainer-->
</script>


<script type="text/template" id="replyTmpl">

<li class="commented_item"><!--commented_item-->
	<div class="commented_user_profile"><img src="/img/<@=r.profileImg @>" width="40" height="40" /></div>
    <span class="commented_user_name"><@=r.name @></span>
    <p class="commented_text"><@= r.reply@></p>
    <div class="commented_reaction_box"><!--commented_add_box-->
    <span class="commented_date">방금 전</span>
                    
    </div><!--//commented_add_box-->
 </li><!--//commented_item-->
</script>
<script src="/js/moment-with-locales.js"></script>
<script src="/js/crewDetailPage.js"></script>
<script src="/js/crewDetailPost.js"></script>
<script src="js/quill.core.js"></script>
<script src="js/quill.min.js"></script>
<script>
	
	const crewMemberNo = <%=crewMemberNo %>;
	_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
	
	const $detailPostsTmpl = _.template($('#detailPostsTmpl').html());
	//$('.commented_list').append($replyTmpl({r:json}))
	// 업데이트 start
	$postVariableBox.on("click",".update_post_item",function(e){
		const $that = $(this).parent().next();
		const val = $that.val();
		$.ajax({
    	    url:"/ajax/updateSelectPost.json",
    	    type:'post',
    	    data:{
    	    	crewNo:<%=crewNo%>,
    	    	crewMemberNo:<%=crewMemberNo%>,
    	    	postNo:val
    	    },
    	    error : function(xhr, error, code) {
    	        alert("에러:" + code);
    	    },
    	    success:function (json){
    	    	//$('.commented_list').append($updatePostsTmpl({r:json}))
    	    	console.log(json);
    	    }
    	});
	});
	// 업데이트 start
	
	
	
	$(document).on("click", '.remove_question',function (e) {
	    const $this = $(this);
	    //여기서 ajax로 파일 업로드 수행
	    $.ajax({
	        url:"ajax/deleteFile.json",
	        type : 'POST',//multipart/form-data
	        dataType : "json",
	        error : function(xhr, error, code) {
	            alert("에러:" + code);
	        },
	        success:function(json) {
	            alert(json.result);
	            if(json.result==true) {
	                $this.parent().remove();
	            }
	        }
	    });
	});
	
	/*post*/
	
	let pageNo = 1;

	//한 페이지에 보여지는 게시물수 
	let numPage = 2;
	
	//const $postVariableBox = $('.post_variable_box');
	const $postsTmpl = _.template($('#postsTmpl').html());
	
	function getPost(){
		$.ajax({
		    url:"/ajax/getCrewPost.json",
		    type:'get',
		    dataType:'json',
		    data:{
		    	crewNo:<%=crewNo%>,
		    	crewMemberNo:<%=crewMemberNo%>,
				start:pageNo++,
				end:numPage
		    },
		    error : function(xhr, error, code) {
		       // alert("에러:" + code);
		    },
		    success:function (json){
		    	console.log(json);
		        $postVariableBox.append($postsTmpl({crewPost:json}));
		    }
		});
	}
	getPost();
	function pushLike(url,postNo){
		$.ajax({
		    "url": url,
		    type:'get',
		    dataType:'json',
		    data:{
		    	postNo: postNo,
				likerNo: <%=crewMemberNo%>
		    },
		    error : function(xhr, error, code) {
		       // alert("에러:" + code);
		    },
		    success:function (json){
		    	console.log(json);
		    }
		});
	}
	


	
	/*무한 스크롤링*/
	$(window).scroll(function(e) {
	    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	    	getPost();
	    }
	});	
	
	$postVariableBox.on("click",'.option_btn',function(e){
		const $that = $(this).children().next();
		$that.toggleClass('appear');
	});
	
	$postVariableBox.on("click",'.top_item',function(e){
		const $that = $(this).parent();
		$that.toggleClass('appear');
	});
	
	$postVariableBox.on("click",'.ban_item',function(e){
		const $that = $(this).parent().next();
		const postNo = $that.val();
		const writerMemberNo = $that.next().val();
		$that.toggleClass('appear');
		
		$.ajax({
		    url: "/ajax/insertReport.json",
		    type:'get',
		    dataType:'json',
		    data:{
		    	postNo: postNo,
				reporterMemberNo : <%=crewMemberNo%>,
		    	writerMemberNo: writerMemberNo,
		    },
		    error : function(xhr, error, code) {
		       // alert("에러:" + code);
		    },
		    success:function (json){
		    	console.log(json);
		    }
		});
		
	});
	
	
	$postVariableBox.on("click",'.comment_btn',function(e){
		const $that = $(this).parent().next().next().children().children().eq(0);
		console.log($that);
		$that.focus();
	});
	
	
	$postVariableBox.on("click",'.like_btn',function(e){
	// likeBtn
	const $that = $(this).children();
	const val = $that.next().val();
	alert(val);
	if($that.prop("checked")){
	    $that.attr("checked",false);
	    $(this).removeClass("like");
	    pushLike("/ajax/unPushLike.json",val);
	}else{
	    $that.attr("checked",true);
	    $(this).addClass("like");
	    pushLike("/ajax/pushLike.json",val);
	}
	});

	// 댓글 달기
	const $replyTmpl = _.template($('#replyTmpl').html());
	$postVariableBox.on("submit",'.reply_form',function(e){
		e.preventDefault();
		const $that = $(this).children();
		let val = $that.val().substr(0,30);
		const postNoVal = $(this).children().next().val();
		
		$.ajax({
		    url: "/ajax/insertReply.json",
		    type:'get',
		    dataType:'json',
		    data:{
		    	postNo: postNoVal,
		    	memberNo: <%=crewMemberNo%>,
				reply:val
		    },
		    error : function(xhr, error, code) {
		       // alert("에러:" + code);
		    },
		    success:function (json){
		    	console.log(json);
		    	$that.val('');
		    	$('.commented_list').append($replyTmpl({c:json}))
		    }
		});
		
	});
	/*글 상세*/
	const $popCrewPost = $('.popCrewPost');
	$postVariableBox.on("click",'.postingContentsContainer',function(e){
		e.preventDefault();
		alert("클릭");
		
		const $that = $(this).parent().children().children().next().next();
		const postNoval = $that.val()
		
		$.ajax({
		    url: "/ajax/getCrewPostDetail.json",
		    type:'get',
		    dataType:'json',
		    data:{
		    	postNo: postNoval,
		    	memberNo: <%=crewMemberNo%>,
				crewNo:<%=crewNo%>
		    },
		    error : function(xhr, error, code) {
		       // alert("에러:" + code);
		    },
		    success:function (json){
		    	$popCrewPost.append($detailPostsTmpl{});
		    	console.log(json);
		    }
		});
	});
	
	
    /*post*/
    
    
    /*popWrite start*/
	const $contents = $("#contents");
	
	const $popWriteWrap= $(".pop_write_wrap");
	const $popWrite = $('.pop_write');
	// 닫기 버튼
	const $close = $('.close');
	$close.click(function (e) {
	    $popWriteWrap.removeClass('on');
	    $popWriteWrap.children().remove();
	});
	
	
	// 새글 쓰기 버튼 on
	const $postingBtn = $('.posting_btn');
	$postingBtn.click(function (e) {
	    e.preventDefault();
	    $popWriteWrap.addClass("on");
	    //$popWriteWrap.append($updatePostsTmpl({w:json}));
	    quill.focus();
	})
	
	// 삭제하기
	$postVariableBox.on("click",".delete_post_item",function(e){
		const $that = $(this).parent().next();
		const $popWrap = $(this).parent().parent().parent();
		const val = $that.val();
		console.log($popWrap);
		$.ajax({
    	    url:"/ajax/deletePost.json",
    	    type:'get',
    	    data:{
    	    	postNo:val
    	    },
    	    error : function(xhr, error, code) {
    	        alert("에러:" + code);
    	    },
    	    success:function (){
    	    	$popWrap.remove();    
    	    }
    	});
	});
	// 삭제하기 END
	
	
	const $post_top_input = $('#post_top_input');
	$("#writeForm").on("submit",function (e) {
	
	    const contents = 
        	$(".ql-editor").html();

        const text = $(".ql-editor").text();
        $contents.val(contents);
        console.log("text:"+text);
        console.log("contents:"+contents);
        
        if (text.length <= 0) {
            alert("내용을 입력하세요.");
            return false;
        }//if end
	    // 첫번째 값이 엔터면 아무것도 글자를 쓰지 않았음
	    else if(contents.ops[0].insert=="\n") {
	        alert("글자를 입력해주세요!");
	        return false;
	    }else {
	        //const contentString =JSON.stringify(contents);
	        //input type=hidden에 value로 세팅
	    	/*if(!$("#post_top_input").prop('checked')){
	    		$post_top_input.val('N');
	    	}*/
	        
	        // 수정
	        //$contents.val(contentString);
           	$popWriteWrap.removeClass('on');
	        return false;
	    }
	
	});//#writeForm submit() end
	
	var quill = new Quill('#editorContainer', {
	    modules: {
	        toolbar: {
	            container: '#toolbar-container',
	        }
	    },
	    theme: 'snow'
	});
	
	$("#image_input").on("change",function() {
	
	    const file = this.files[0];
	
	
	    console.log(file);
	
	    //image/ 로 시작하는
	
	    if (/^image\//.test(file.type)) {
	
	        //alert("여기에 오면 파일이 있고 사진임");
	
	        //multipart/form-data에 필요함
	        const formData = new FormData();
	
	        formData.append("uploadImage", file, file.name);
	
	        //여기서 ajax로 파일 업로드 수행
	        $.ajax({
	            url:"/ajax/uploadPostImage.json",
	            processData : false,//multipart/form-data
	            contentType : false,//multipart/form-data
	            data : formData,//multipart/form-data
	            type : 'POST',//multipart/form-data
	            dataType : "json",
	            error : function(xhr, error, code) {
	                alert("에러:" + code);
	            },
	            success:function(json) {
	                const range = quill.getSelection();
	                console.log(range);
	                $('.imageApplicable').val('T');
	                let idx = 0;
	                if(range!=null) {
	                    idx = range.index;
	                }
	                // image
	                // delta라는 개념을 하나 만들어라
	                // 요소를 직접 못넣는다. custom delta
	                quill.insertEmbed(idx, 'image', "/upload/"+json.imageName);
	                quill.insertText( quill.getSelection() + 1, ' ', Quill.sources.SILENT);
	
	            }
	        });
	
	
	    } else {
	        alert("이미지를 선택해주세요!");
	    }
	})
	
	var Size = Quill.import('attributors/style/size');
	Size.whitelist = ['20px', '28px', '36px','48px'];
	Quill.register(Size, true);
	
	var ColorClass = Quill.import('attributors/class/color');
	Quill.register(ColorClass, true);
	
	/*popWrite end*/
    
</script>
</body>
</html>