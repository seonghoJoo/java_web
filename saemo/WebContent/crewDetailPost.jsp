<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/all.min.css" />
    <link rel="stylesheet" href="css/default.css" />
    <link rel="stylesheet" href="css/crewDetailPost.css" />
</head>
<body>
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
<!--                <li class="posting_image_item"><img src="img/arimPost.png" width="100%" height="100%" /></li>-->
<!--                <li class="posting_image_item"><img src="img/arimPost.png" width="100%" height="100%" /></li>-->
<!--                <li class="posting_image_item"><img src="img/arimPost.png" width="100%" height="100%" /></li>-->
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
                    <li class="sorting_like_list_item">
                        <div class="like_user_profile"><img src="img/5.jpg" width="40" height="40" /><i class="fas fa-heart"></i></div>
                        <span class="like_user_name">이아림</span>
                    </li>
                    <li class="sorting_like_list_item">
                        <div class="like_user_profile"><img src="img/5.jpg" width="40" height="40" /><i class="fas fa-heart"></i></div>
                        <span class="like_user_name">이아림</span>
                    </li>
                    <li class="sorting_like_list_item">
                        <div class="like_user_profile"><img src="img/5.jpg" width="40" height="40" /><i class="fas fa-heart"></i></div>
                        <span class="like_user_name">이아림</span>
                    </li>
                    <li class="sorting_like_list_item">
                        <div class="like_user_profile"><img src="img/5.jpg" width="40" height="40" /><i class="fas fa-heart"></i></div>
                        <span class="like_user_name">이아림</span>
                    </li>
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
            <li class="commented_item"><!--commented_item-->
                <div class="commented_user_profile"><img src="img/arimProfile.jpg" width="40" height="40" /></div>
                <span class="commented_user_name">이아림</span>
                <p class="commented_text">젖밥들이 깝치긴 왜 깝쳐</p>
                <div class="commented_reaction_box"><!--commented_add_box-->
                    <span class="commented_date">2020년 12월 3일 오전 9:30</span>
                    <button class="like_btn">좋아요</button><!--
                    --><button class="comment_btn">답글쓰기</button>
                </div><!--//commented_add_box-->
            </li><!--//commented_item-->
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

<script type="text/template" id="postUserInfoTmpl">
    <div class="posting_user_profile"><img src="img/<@= post.img@>" /></div>
    <span class="posting_user_name"><@= post.writer@></span>
    <span class="posting_date"><@= post.writedate@></span>
</script>

<script src="js/jquery.js"></script>

<script>
    _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

    /*객관식 질문*/
    const $postingUserInformationContainer = $('#postingUserInformationContainer');
    const postUserInfoTmpl = _.template($('#postUserInfoTmpl').html());
    $.ajax({
        url:"ajax/postInfo.json",
        type:'post',
        dataType:'json',
        error : function(xhr, error, code) {
            alert("에러:" + code);
        },
        success:function (){
            $postingUserInformationContainer.html(postUserInfoTmpl{user:json});
        }
    })
</script>
<script src="js/crewDetailPost.js"></script>
</body>
</html>