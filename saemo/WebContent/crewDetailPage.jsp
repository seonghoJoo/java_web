<%@page import="com.doogwal.coffee.vo.PageVO"%>
<%@page import="com.doogwal.coffee.vo.Post"%>
<%@page import="com.doogwal.coffee.dao.PostsDAO"%>
<%@page import="com.doogwal.coffee.dao.MeetAppsDAO"%>
<%@page import="com.doogwal.coffee.dao.BoardsDAO"%>
<%@page import="com.doogwal.coffee.vo.Board"%>
<%@page import="com.doogwal.coffee.dao.QuestionsDAO"%>
<%@page import="com.doogwal.coffee.vo.Question"%>
<%@page import="com.doogwal.coffee.vo.CrewMember"%>
<%@page import="java.util.List"%>
<%@page import="com.doogwal.coffee.dao.AttendancesDAO"%>
<%@page import="com.doogwal.coffee.vo.Attendance"%>
<%@page import="com.doogwal.coffee.vo.Gathering"%>
<%@page import="com.doogwal.coffee.dao.SchedulesDAO"%>
<%@page import="com.doogwal.coffee.dao.MeetingsDAO"%>
<%@page import="com.doogwal.coffee.vo.Meeting"%>
<%@page import="com.doogwal.coffee.dao.CrewsDAO"%>
<%@page import="com.doogwal.coffee.vo.Crew"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/crewDetailPage/crewDetailPage.css" />
    <link rel="stylesheet" href="/css/crewDetailPage/crewDetailPost.css" />
    <link rel="stylesheet" href="/css/crewDetailPage/popSaemoHistory.css" />
    <link rel="stylesheet" href="/css/crewDetailPage/popCrewSignUp.css" />
    <link rel="stylesheet" href="/css/crewDetailPage/popBringMeeting.css" />
    <link rel="stylesheet" href="/css/crewDetailPage/popCrewMemberList.css" />
    <link rel="stylesheet" href="/css/crewDetailPage/popMeetingMakingForm.css" />
	<link rel="stylesheet" href="/css/crewDetailPage/popMeetingRequestList.css" />
	
	<link rel="stylesheet" href="/css/crewDetailPage/crewDetailPost.css" />
    <link rel="stylesheet" href="/css/quill.core.css" />
    <link rel="stylesheet" href="/css/quill.snow.css"/>
    <link rel="stylesheet" href="/css/crewDetailPage/popWritePost.css" />
    <link rel="stylesheet" href="/css/crewDetailPage/popReport.css" />
    <link rel="stylesheet" href="/css/crewDetailPage/enlargePost(image).css"/>
    
    <link rel="stylesheet" href="/css/tui-date-picker.min.css"/>
    <link rel="stylesheet" href="/css/tui-time-picker.min.css"/>
    
<style>
	html{
		width:100%;
		height:100%;
		background-color: #EEF0F3;
	}
	body{
		width:100%;
		height:100%;
	}
	#container{
		height:100%;
	}
	
    #header{
        position: fixed;
        z-index: 10;
    }
    
    /* 바디에 스크롤 막는 방법 */
	.not_scroll{
	    position: fixed;
	    overflow: hidden;
	    width: 100%;
	    height: 100%
	}
    .appear{
    	display:block;
    }
    
    
    

	
    
    
</style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<%
	//크루 컬럼을 다 가진 crew객체 생성
	int crewNo = Integer.parseInt(request.getParameter("crewNo"));
	Crew crew = CrewsDAO.selectCrewAllInformation(crewNo);
	
	//upcomming event에 쓸 객체 생성
	Meeting upcommingMeeting = SchedulesDAO.selectUpcommingMeeting(crewNo);
	Gathering upcommingGathering = SchedulesDAO.selectUpcommingGathring(crewNo);
	
	//가입 조건을 기술할 객체 생성
	List<Question> joinConditions = QuestionsDAO.selectJoinConditions(crewNo);
	
	//크루 게시판을 가져오는 객체 생성
	List<Board> boards = BoardsDAO.selectBoards(crewNo);
	
	
	//우리가 신청한 밋팅 가져오는 객체 생성
	List<Meeting> weApplyMeetings = MeetAppsDAO.weApplymeetingList(crewNo);
	
	//해당 크루 전체글의 상위 고정 게시글을 가져오는 객체 생성
	List<Post> precedenceFixingPosts = PostsDAO.selectTopContents(boards.get(0).getNo());
	
	//현재 방문한 크루의 크루원인지 판단하고 맞다면 크루원으로써의 정보 객체 생성
	CrewMember myMemberInCrew;
	try{
		myMemberInCrew = userCrews[Integer.parseInt(request.getParameter("crewOrder"))];
		System.out.println("크루멤버 번호 : "+myMemberInCrew.getNo());
	}catch(Exception e){
		myMemberInCrew = null;
	}
	
	//외부 사용자가 운영진급이 되는지 확인하는 플래그
	int somewhereCaptainFalg = 0;
	for(CrewMember cm : userCrews){
		if(cm==null){;}
		else if(cm.getRole()!='M'){somewhereCaptainFalg=1;}
	}
	
	int crewOrder = Integer.parseInt(request.getParameter("crewOrder"));
	
	int boardNo = boards.get(0).getNo();
	/*페이지 처리 start*/
	//현재 페이지 번호
	int pageNo = 1;
	
	//한 페이지에 보여지는 게시물수 
	int numPage = 2;
	
	
	PageVO pageVO = 
	new PageVO(pageNo,numPage,crewNo);
	int crewMemberNo = userCrews[crewOrder].getNo(); 
	
	/*페이지 처리 end*/
%>
<%@ include file="/popSaemoHistory.jsp" %>
<%@ include file="/popCrewSignUp.jsp" %>
<%@ include file="/popSaemoHistory.jsp" %>
<%@ include file="/popBringMeeting.jsp" %>
<%@ include file="/popCrewMemberList.jsp" %>
<%@ include file="/popMeetingMakingForm.jsp" %>
<%@ include file="/popMeetingRequestList.jsp" %>
    <div id="boardPlusContainer" class="board_plus_container"><!--boardPlusContainer-->
    	<div class="close_btn"><i class="fas fa-times"></i></div>
        <div class="board_plus_title_box"><!--board_plus_title_box-->
            <div class="board_plus_title"><!--board_plus_title-->
                <span>게시판 추가하기</span><span class="board_number"></span>
            </div><!--//board_plus_title-->
        </div><!--//board_plus_title_box-->
        <div class="board_plus_contents_box"><!--board_plus_contents_box-->
            <div class="board_plus_contents"><!--board_plus_contents-->
                <form action="/plusBoard.doo" method="post">
                    <span>이름 :</span><input id="boardName" name="boardName" placeholder="최대 5자" maxlength="5"/>
                    <input type="hidden" name="crewNo" value="<%=crewNo %>" />
                    <button>추가</button>
                </form>
            </div><!--//board_plus_contents-->
        </div><!--//board_plus_contents_box-->
    </div><!--//boardPlusContainer-->
    <div id="crewDetailHeader"><!-- crewDetailHeader -->
        <div class="crew_detail_header_box"><!--crew_detail_header_box-->
            <div class="crew_detail_board_box"><!-- crew_detail_box -->
                <ul class="crew_detail_board_list"><!-- crew_detail_list -->
                	<%int boardSeq = 0; %>
                	<%for(Board board : boards){ %>
                	<li class="crew_detail_board_item <%if(boardSeq>2){%>new_board<%}%>"><input id="boardItem<%=++boardSeq %>" name="boardItem" type="radio" value="<%=board.getNo()%>" 
                	onclick="changePrecedencePost(this.value)" <%if(boardSeq==1){%>checked<%} %>/>
                	<label for="boardItem<%=boardSeq %>"><%=board.getName() %></label></li>        
                    <%} %>        
                    <%if(myMemberInCrew!=null && myMemberInCrew.getRole()!='M'){ %>
                    <li class="crew_detail_board_item board_adding">+</li>                   
                    <%} %>
                </ul><!-- //crew_detail_list -->
            </div><!-- //crew_detail_box -->
            <%if(myMemberInCrew!=null && myMemberInCrew.getRole()!='M'){ %>
            <div class="crew_operator_function_box"><!-- crew_operator_function_box -->
                <ul class="crew_operator_function_list"><!-- crew_operator_function_list -->
                    <li class="crew_operator_function_item"><button class="make_gathring_btn">모임만들기</button></li><!--
                    --><li class="crew_operator_function_item"><button class="make_meeting_btn">밋팅만들기</button></li><!--
                    --><li class="crew_operator_function_item"><button class="meeting_wating_list_btn">밋팅대기자목록</button><span class="crew_applicant_nobody"><i class="far fa-grin-beam-sweat"></i>에구구 신청자가 없네여....</span></li><!--
                    --><li class="crew_operator_function_item"><button class="registe_wating_list_btn">가입대기자목록</button><span class="crew_applicant_nobody"><i class="far fa-grin-beam-sweat"></i>에구구 신청자가 없네여....</span></li>
                </ul><!-- //crew_operator_function_list -->
            </div><!-- //crew_operator_function_box -->
            <%} %>
        </div><!--//crew_detail_header_box-->
    </div><!-- //crewDetailHeader -->
    <div id="crewDetailContainerWrap"><!--crewDetailContainerWrap-->
        <div id="crewDetailContainer"><!--crewDetailContainer-->
            <div id="crewInformationSideBar"><!-- crew_information_side_bar -->
                <div class="crew_information_box"><!-- crew_information_box -->
                    <img src="/img/crew/<%=crew.getCoverImg() %>" />
                    <div class="crew_name_box">
                        <span class="crew_name"><%=crew.getName() %></span>
                        <span class="crew_member_number">(크루원 <%=crew.getCurPop() %>명)</span>
                    </div>
                    <span class="crew_introduction"><%=crew.getIntro() %></span>
                </div><!-- //crew_information_box -->              
                <div class="meeting_information_box"><!-- meeting_information -->
               		<%if(myMemberInCrew==null && somewhereCaptainFalg==1){ %>
                    <a href="javascript: void(0)" class="meeting_bring" onclick="bringMeeting(<%=loginUser.getNo()%>)"><i class="far fa-grin-tongue-squint"></i>밋팅 데려오기</a>
                    <%} %>
                    <a href="" class="meeting_history"><i class="fas fa-history"></i>밋팅 히스토리</a>
                </div><!-- //meeting_information -->               
                <div class="crew_sex_ratio_box"><!-- crew_sex_ratio_box -->
                    <div class="sex_ratio_male_image_box" data-male-number="<%=(int)crew.getGenderRate()%>"><!--sex_ratio_male_image_box-->
                        <img src="/img/sexRatioImgMale.png" width="260" height="260" />
                    </div><!--//sex_ratio_male_image_box-->
                    <div class="sex_ratio_female_image_box" data-female-number="<%=(int)(crew.getCurPop()-crew.getGenderRate())%>"><!--sex_ratio_female_image_box-->
                        <img src="/img/sexRatioImgFemale.png" width="260" height="260" />
                    </div><!--//sex_ratio_female_image_box-->
                </div><!-- //crew_sex_ratio_box -->
                <div class="saemo_point_box"><!-- seamo_point_box -->
                    <img src="/img/saemoPoint.png" width="40" height="40" />
                    <p class="saemo_point"><%=crew.getPoint() %></p>
                </div><!-- //seamo_point_box -->
            </div><!--//crewInformationSideBar-->
            <div id="crewPostContainer"><!--crewPostContainer-->
                <div id="fixedPostContainer"><!--fixedPostContainer-->
                    <div class="crew_upcomming_event_box"><!--crew_upcomming_event_box-->
                    	<%if(upcommingMeeting==null&&upcommingGathering==null){ %>
                        <span class="upcomming_event_name">아무 스케쥴도 없습니다</span>
                        <%}else if(upcommingGathering==null){ %>
                        <span class="upcomming_event_name"><%=upcommingMeeting.getName() %></span>
                        <span class="upcomming_event_spot"><%=upcommingMeeting.getAddress() %> / <%=upcommingMeeting.getStartDate() %></span>
                        <%}else{ 
                        	int attendanceCount = AttendancesDAO.selectYAttendanceCount(upcommingGathering.getNo()); 
                        	List<CrewMember> attendanceYCrewMembers = AttendancesDAO.selectYAttendanceList(upcommingGathering.getNo());
                        %>
                        <span class="upcomming_event_name"><%=upcommingGathering.getName() %></span>
                        <span class="upcomming_event_spot"><%=upcommingGathering.getAddress() %> / <%=upcommingGathering.getStartDate() %></span>
                        <span class="upcomming_event_participants"><%=attendanceCount%>명 참여 중</span>
                        <!-- width: 4+33*n , height: 35*n 이와 같이 계산해서 .upcomming_event_participants_list_box 스타일에 적어주어야 한다. -->
                        <div class="upcomming_event_participants_list_box" style="width: 
                        <%if(attendanceCount>6){%><%=202%><%}else{%><%=4+attendanceCount*33%><%}%>px; height: <%=35+(attendanceCount/6)*35%>px"><!--upcomming_event_participants_list_box-->
                            <ul class="upcomming_event_participants_list"><!--upcomming_event_participants_list-->
                            	<%for(CrewMember yCrewMember : attendanceYCrewMembers){ %>
                            	<li><img src="img/profile/<%=yCrewMember.getProfileImg() %>" width="30px" height="30px"></li>
                            	<%} %>
                            </ul><!--//upcomming_event_participants_list-->
                        </div><!--//upcomming_event_participants_list_box-->
                        <%} %>
                    </div><!--//crew_upcomming_event_box-->
                    <%if(myMemberInCrew==null){ %>
                    <div class="crew_qualification_condition_box"><!--crew_qualification_condition_box-->
                        <div class="crew_qualification_condition_title"><span>가입 조건</span></div>
                        <div class="condition_box"><!--condition_box-->
                            <ol class="condition_list"><!--condition_list-->
                            	<%int conditionSeq = 0; %>
                            	<%for(Question condition : joinConditions){ %>
                            	<li><%=++conditionSeq+condition.getQuest() %></li>
                            	<%} %>                               
                            </ol><!--//condition_list-->
                            <div class="view_more">...더 보기</div>
                            <div class="crew_join"><a href="">크루 가입하기</a></div>
                        </div><!--//condition_box-->
                    </div><!--crew_qualification_condition_box-->
                    <%} %>
                    <div class="precedence_fixing_post_box"><!--fixingPostContainer-->
                        <ul class="precedence_fixing_post_list">
                        	<%for(Post precedenceFixingPost : precedenceFixingPosts){ %>
                        	<li class="precedence_fixing_post_item">
						    	<div class="precedence_fixing_post_before_icon"><i class="fas fa-grip-lines-vertical"></i></div>
						    	<div class="precedence_fixing_post"><%=precedenceFixingPost.getContents()%></div>
						   	 	<div class="precedence_fixing_post_after_icon"><i class="fas fa-caret-right"></i></div>
						    </li>
						    <%} %>
                        </ul>
                    </div><!--fixingPostContainer-->
                    <div class="posting_box"><!--posting_box-->
                        <a class="posting_btn"><span>크루원들은 당신의 얘기를 기다리고 있어요<i class="fas fa-feather-alt"></i></span></a>
                    </div><!--//posting_box-->
                </div><!--//fixedPostContainer-->
                <div class="post_variable_box"><!--post_variable_box-->
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
                        <dt>신청목록(<%=weApplyMeetings.size() %>)</dt>
                        <%for(Meeting meeting : weApplyMeetings){ %>
                        <dd class="meeting_apply_item"><!--meeting_basket_item-->
                            <a href="">
                                <img src="/img/meeting/<%=meeting.getImg() %>" width="40px" height="40px" />
                                <span class="apply_item_crew_name"><%=meeting.getName() %></span>
                                <span class="apply_item_meeting_name"><%=meeting.getDescription() %></span>
                            </a>
                        </dd><!--//meeting_basket_item-->
                        <%} %>                      
                    </dl><!--//meeting_apply_list-->
                </div><!--//meeting_apply_list-->
            </div><!--//crewFunctionBar-->
        </div><!--//crewDetailContainer-->
    </div><!--//crewDetailContainerWrap-->
	
	<div class="pop_write_wrap">
  	</div><!-- //pop_write_wrap -->

	<div class="pop_post_detail_wrap">
	</div>
	
	<div id="reportBoxWrap"><!--reportBoxWrap-->
	</div>
	
	<div class="post_detail_image_warp"><!--postDetailImageWarp-->
	</div><!--//postDetailImageWarp-->

</div><!-- //container -->

<script><!--자바스크립트에 jsp 변수를 보내기 위한 스크립트-->
const crewNo = <%=crewNo%>;
const crewCategoryNo = <%=crew.getCategoryNo()%>;
const crewRank = '<%=myMemberInCrew.getRole()%>';
let boardNo = <%=boardNo %>;

_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
//크루멤버 번호
const crewMemberNo = <%=myMemberInCrew.getNo() %>;
//크루 번호
</script>
<script type="text/template" id="precedenceFixingPostTmpl">
	<@ _.each(precedencePostContents,function(p){@>
	<li class="precedence_fixing_post_item">
    	<div class="precedence_fixing_post_before_icon"><i class="fas fa-grip-lines-vertical"></i></div>
    	<div class="precedence_fixing_post"><@=p.contents@></div>
   	 	<div class="precedence_fixing_post_after_icon"><i class="fas fa-caret-right"></i></div>
    </li>
	<@})@>
</script>

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
	<div class="close"><i class="fas fa-times"></i></div>
	<div class="detail_post_wrap"><!--detail_post_wrap-->
		<div class="option_btn">
		<input type="hidden" value="<@= c.no@>"/>
    </div>
        <div class="postingUserInformationContainer"><!--postingUserInformationContainer-->
            <!-- -----------------------postUserInfo------------------------------ -->
 			<div class="posting_user_profile"><img src="/img/<@=c.userMember.profileImg@>" /></div>
        	<span class="posting_user_name"><@=c.userMember.name @></span>
        	<span class="posting_date"><@= moment(c.regdate).format("YYYY년 MM월 DD일 HH:mm:ss")@></span>
			<!-- -----------------------postUserInfo------------------------------ -->
        </div><!--//postingUserInformationContainer-->
        <div class="postingContentsContainer"><!--postingContentsContainer-->
            <p class="posting_text"><@=c.contents@></p>
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
	</div>
</script>

<script type="text/template" id="popWriteTmpl">
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

<script type="text/template" id="popUpdateTmpl">
	<div class="pop_write"><!-- popWrite start-->
		
            <form id="writeForm" method="post" action="/writePost.do">
                <!-- 질문 2 : fieldset 추가 적당한지-->
                <fieldset>
                    <input type="hidden" id="contents" name="contents" value=""/>
                    <input type="hidden" name="boardNo" value="<%=boardNo %>"/>
                    <input type="hidden" name="memberNo" value="<%=crewMemberNo%>"/>
                    <input class="imageApplicable" type="hidden" name="imageApplicable" value="N" />
                    <h2>글수정</h2>
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
                        <div id="editorContainer">
							<div class="ql-editor update_contents" data-gramm="false" contenteditable="true">
							<@=c.contents @>
							</div>
						</div>
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
</script>

<script type="text/template" id="reportTmpl">
       <div id="reportBox"><!--reportBox-->
        <div class="report_title">신고하기</div>
        <div class="report_target_box"><!--report_target_box-->
            <div class="target_name_box"><!--target_name_box-->
                <span class="title">작성자</span>
                <span class="report_target_name">sdfs</span>
            </div><!--//target_name_box-->
            <div class="target_post_box"><!--report_target_post_box-->
                <span class="title">내용</span>
                <span class="report_target_post">sdffffffffffffffffffffffffffffffffffffffgggggffffffffffffffffffffff</span>
            </div><!--//report_target_post_box-->
        </div><!--//report_target_box-->
        <form class="report_reason_box" method="get" action="/"><!--report_reason_box-->
            <ul class="report_reason_list">
                <li class="report_reason_item">
                    <label>
                        <span>스팸입니다.</span>
                        <i class="fas fa-angle-right"></i>
                        <input class="report_input" type="radio" name="type" value="S"/>
                    </label>
                </li>
                <li class="report_reason_item">
                    <label>
                        <span>부적절한 상품을 팔거나 홍보하고 있습니다.</span>
                        <i class="fas fa-angle-right"></i>
                        <input class="report_input"  type="radio" name="type" value="P"/>
                    </label>
                </li>
                <li class="report_reason_item">
                    <label>
                        <span>자해나 자살과 관련된 내용입니다.</span>
                        <i class="fas fa-angle-right"></i>
                        <input class="report_input" type="radio" name="type" value="H"/>
                    </label>
                </li>
                <li class="report_reason_item">
                    <label>
                        <span>나체 이미지거나 음란한 내용을 담고 있습니다.</span>
                        <i class="fas fa-angle-right"></i>
                        <input class="report_input" type="radio" name="type" value="D"/>
                    </label>
                </li>
                <li class="report_reason_item">
                    <label>
                        <span>저작권, 명예훼손 등 기타 권리를 침해하는 내용입니다.</span>
                        <i class="fas fa-angle-right"></i>
                        <input class="report_input" type="radio" name="type" value="C"/>
                    </label>
                </li>
                <li class="report_reason_item">
                    <label>
                        <span>특정인의 개인정보가 포함되어 있습니다.</span>
                        <i class="fas fa-angle-right"></i>
                        <input class="report_input" type="radio" name="type" value="I"/>
                    </label>
                </li>

                <li class="report_reason_item">
                    <label>
                        <span>혐오를 조장하는 내용입니다.</span>
                        <i class="fas fa-angle-right"></i>
                        <input class="report_input" type="radio" name="type" value="H"/>
                    </label>
                </li>
            </ul>
        </form><!--//report_reason_box-->
    </div>
</script>

<script type="text/template" id="detailImageTmpl">

    <div>
        <div class="close report_icon"><i class="fas fa-times"></i></div>
        <div class="right_icon report_icon"><i class="fas fa-chevron-right"></i></div>
        <div class="left_icon report_icon"><i class="fas fa-chevron-left"></i></div>
        <div class="enlarge_image_container image_box">
        <!--enlargeImageContainer--></div>
    </div>
</script>


<!--  quill Editor js가 CrewDetailPost.js 위에 오도록 할것! -->
<script src="js/quill.core.js"></script>
<script src="js/quill.min.js"></script>
<!--  quill Editor js가 CrewDetailPost.js 위에 오도록 할것! -->
<script src="/js/moment-with-locales.js"></script>
<script src="/js/crewDetailPage/crewDetailPage.js"></script>
<script src="/js/crewDetailPage/crewDetailPost.js"></script>
<script src="/js/tui-date-picker.min.js"></script>
<script src="/js/tui-time-picker.min.js"></script>

<script src="/js/crewDetailPage/popSaemoHistory.js"></script>	
<script src="/js/crewDetailPage/popCrewSignUp.js"></script>
<script src="/js/crewDetailPage/popBringMeeting.js"></script>
<script src="/js/crewDetailPage/popCrewMemberList.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70794a76a110afe1608244fb91d2b83d&libraries=services"></script>
<script src="/js/crewDetailPage/popMeetingMakingForm.js"></script>
<script src="/js/crewDetailPage/popMeetingRequestList.js"></script>
</body>
</html>