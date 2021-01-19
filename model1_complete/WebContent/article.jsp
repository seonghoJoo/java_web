<%@page import="com.bmj.model1.dao.LikesDAO"%>
<%@page import="com.bmj.model1.vo.Like"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.bmj.model1.util.PaginateUtil"%>
<%@page import="com.bmj.model1.vo.PageVO"%>
<%@page import="com.bmj.model1.vo.Reply"%>
<%@page import="com.bmj.model1.dao.RepliesDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.bmj.model1.vo.Article"%>
<%@page import="com.bmj.model1.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String noStr = 
	request.getParameter("no");

	int no = Integer.parseInt(noStr);
	
	Article article = 
		BoardDAO.selectOne(no);

	//해당 글이 없다면 index로 이동
	if (article == null) {
		response.sendRedirect("index.jsp");
		return;
	}
	
	Set<Integer> viewPages = (Set<Integer>)session.getAttribute("viewPages");
	
	if (viewPages == null) {
		viewPages = new LinkedHashSet<Integer>();
	} //if end
	
	if (!viewPages.contains(no)) {
		viewPages.add(no);
		BoardDAO.updateHit(no);
		session.setAttribute("viewPages", viewPages);
		article.setHit(article.getHit() + 1);
	} //if end
	
	
	String pageStr = 
			request.getParameter("page");
	
	int pageNo = 1;
	int numPage = 5;
	
	try {
		pageNo = 
			Integer.parseInt(pageStr);
	}catch(Exception e) {
		
	}
	
	PageVO pageVO = 
			new PageVO(pageNo,numPage,no);
	
	List<Reply> replies = 
			RepliesDAO.selectList(pageVO);
	
	int total = 
		RepliesDAO.selectTotal(no);
	
	String paginate = 
			PaginateUtil.getPaginate(pageNo, total, numPage, 3, "/article.jsp","no="+no+"&page=");
	
	int articlePageNo = BoardDAO.selectPageNo(no);
	
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
<!--  quill editor -->
<link rel="stylesheet" href="/css/quill-custom.css" />
<link rel="stylesheet" href="/css/quill.snow.css" />
<link rel="stylesheet" href="/css/article.css" />
<link href="https://fonts.googleapis.com/css?family=Jua|Nanum+Pen+Script|Poor+Story|Yeon+Sung&display=swap"
      rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
        <h2 class="title"><i class="far fa-eye"></i> 게시물 보기</h2>
        <div id="contentsBox">
            <div id="infoBox">
                <dl>
                    <dt class="screen_out">번호</dt>
                    <dd id="no"><%=article.getNo() %></dd>
                    <dt class="screen_out">글쓴이정보</dt>
                    <dd class="card_user">
                        <img src="/profile/<%=article.getProfile() %>" width="100" />
                        <strong><%=article.getNickname() %></strong>
                    </dd>
                    <dt class="screen_out">글쓴시간</dt>
                    <dd>
                        <time id="regdate"><%=article.getRegdate() %></time>
                    </dd>
                    <dt class="screen_out">조회수</dt>
                    <dd id="hit">
                        <i class="fa fa-eye"></i> <%=article.getHit() %>
                    </dd>
                </dl>
                <h3 id="title"><%=article.getTitle() %></h3>
            </div>
            <div id="viewerSection">
                <div id="editor-container"><%=article.getContents() %></div>
            <div class="box_btn">
<% 
			
			boolean flag = false;
			
			if(loginMember!=null) {
				Like searchLike = new Like(loginMember.getNo(),no,Like.BOARD);
				
				Like like =  LikesDAO.selectOne(searchLike);
				
				System.out.println("article.jsp:"+like);
				
				flag = like != null; 
			}
			
			%>
					<button class="btn_like <%if(flag) {%> like <%}%>">
					<i class="fas fa-heart"></i>
					<i class="far fa-heart"></i>
					<span class="screen_out">좋아요</span>
					<strong class="num_like"><%=article.getLikeCount() %></strong>
					</button>
                <div id="boxBtn">
				<% if( loginMember!=null && 
						loginMember.getNo()==article.getMemberNo()) { %>	
                    <a href="/update.jsp?no=<%=no %>" class="btn" id="modifyBtn"><i class="far fa-edit"></i> 수 정</a>
                    <a href="/delete.bmj?no=<%=no %>" class="btn" id="deleteBtn"><i class="far fa-trash-alt"></i> 삭 제</a>
				<%} %>
                    <a href="/index.jsp?page=<%=articlePageNo %>" class="btn"><i class="far fa-list-alt"></i> 게시판으로</a>
                </div>
            </div><!-- //#infoBox -->
        </div><!-- //#contentsBox -->
        <div id="replyBox">
           
        </div><!--//replyBox-->
<%@ include file="/WEB-INF/template/footer.jsp" %>
<script src="js/quill.min.js"></script>

<script type="text/template" id="replyTmp">
<h3><i class="fa fa-comment"></i> 댓글 <@=total@>개</h3>
		
		<%if(loginMember!=null) { %>	
			<div id="formBox">
			<form action="" method="post" id="replyForm">
				<textarea maxlength="140" 
				name="contents"
				id="contentsField" placeholder="새 글을 입력합니다."></textarea>
				<button id="writeBtn" class="btn"><i class="fas fa-pencil-alt"></i> 댓글쓰기</button>
			</form>
			</div><!--//formBox-->
		<%} %>	
<@ if(replyList.length==0) {@>					
<p class="no_reply"><i class="fas fa-skull-crossbones"></i> 댓글이 아직 없습니다.</p>
<@}else {@>
		<div id="replyListBox">
			<ul>
<@ _.each(replyList,function(reply) { @>
				<li>
					<div class="card_user">
						<img src="/profile/<@=reply.profile@>" width="100"/>
						<strong><@=reply.nickname@></strong>
					</div><!-- //card_user -->
					<div class="box_reply">
						<div class="comments"><@=reply.contents@></div>
<%if(loginMember!=null) { %>	
<@ if(reply.memberNo==<%=loginMember.getNo()%>) {@>
						<a href="" data-no="<@=reply.no@>" class="btn delete">
							<i class="fas fa-times"></i>
							<span class="screen_out">삭제</span>
						</a>
<@}@>
<%} %>
						<time class="time" data-time=""><@=reply.formatRegdate@></time>
					</div><!--//box_reply-->
				</li>
<@})@>
			</ul>
		</div><!--//replyListBox -->
<@=paginate@>
<@}@>
</script><!-- //#replyTmp -->


<script>

_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};


const replyTmp = _.template($("#replyTmp").html());

const $likeBtn = $(".btn_like");
const $likeNum = $(".num_like");
const $replyBox = $("#replyBox");

let page = 1;

function getReplyList() {
	
	$.ajax({
		url:"/ajax/getReplyList.json",
		data:{
			no:<%=no%>,
			page:page	
		},
		type:"GET",
		error:function() {
			alert("서버 점검중~");
		},
		success:function(json) {
			console.log(json);
			$replyBox.html(replyTmp(json));
			fixFooter();
		}//success end
	})//$.ajax() end
	
}//getReplyList() end

getReplyList();


$replyBox.on("submit","#replyForm",function(e) {
	e.preventDefault();
	
	$.ajax({
		url:"/ajax/writeReply.json",
		type:"POST",
		data:{
			no:<%=no%>,
			contents:$("#contentsField").val()
		},
		error:function() {
			alert("서버 점검중~");
		},
		success:function(json) {
			if(json.result) {
				console.log(json);
				getReplyList();
				
			}//if end
		}//success end
			
	});//$.ajax() end

});//$replyForm submit() end

$replyBox.on("click",".paginate a",function(e) {
	e.preventDefault();
	
	page = this.dataset.page;
	
	getReplyList();
	
	
});//.paginate a click end


$replyBox.on("click",".delete",function(e) {
	e.preventDefault();
	
	const no = this.dataset.no;
	
	$.ajax({
		url:"/ajax/deleteReply.json",
		data:{
			no:no
		},
		type:"GET",
		error:function() {
			alert("서버 점검중~");
		},
		success:function(json) {
			if(json.result) {
				console.log(json);
				getReplyList();
			}//if end
		}//success end
	})//$.ajax() end
	
	
	getReplyList();
	
	
});//.paginate a click end


$likeBtn.click(function() {
	
<% if(loginMember==null) { %>
	alert("로그인 해주세요!");
<%}else {%>
	$.ajax({
		url:"/ajax/like.json",
		dataType:"json",
		type:"POST",
		data:{no:<%=no%>,type:"<%=Like.BOARD%>"},
		error:function() {
			alert("서버 점검중!");
		},
		success:function(json) {
			console.log(json);
			
			if(json.flag) {
				$likeBtn.addClass("like");
			}else {
				$likeBtn.removeClass("like");
			}//if else end
			
			$likeNum.text(json.count);
			
		}//success end
	})//$.ajax() end
<%}%>	

});//$likeBtn click() end

//Font에 대한 설정을 불러와서
const Font = Quill.import('formats/font');
//우리가 필요한 폰트를 넣고
Font.whitelist = ['','nanumPen','yeonSung','poorStory','jua'];
//다시 등록
Quill.register(Font, true);

var Size = Quill.import('attributors/style/size');
Size.whitelist = ['20px', '28px', '36px','48px'];
Quill.register(Size, true);

const quill = new Quill('#editor-container', {
	theme:"snow",
	readOnly:true,//수정불가
	modules:{
		toolbar:false	//툴바 없음
	}
  });

</script>
</body>
</html>