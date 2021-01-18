const $postVariableBox = $(".post_variable_box");
// 좋아요 기능
const $likeBtnBox = $(".like_btn");
const $likeBtn = $(".like_btn>.likeBtn");


$postVariableBox.on("click",'.like_box',function(e){
	const $that = $(this).children().next().next().next();
	console.log($that);
    //$(".sorting_like_box").css("display","block");
	$that.toggleClass('appear');
	
	if($that.children().next().children().length>6){
    $that.addClass("over");
	}
	else{
    $that.removeClass("over");
	}
	

});

$("html").click(function(e){
	const $likeBox = $(this).find('.sorting_like_box');	
    if(!($(e.target).hasClass("like_box")||$(e.target).hasClass("like_icon")||
        $(e.target).hasClass("like_count")||$(e.target).hasClass("fa-caret-square-down")||$(e.target).hasClass("fa-heart"))){
        $likeBox.removeClass('appear');
    }
});
//----------------------------------------------------------------------

//상위 고정글 없을 경우를 위한 기능
const $precedenceFixingPostBox = $(".precedence_fixing_post_box");
const $precedenceFixingPostList = $(".precedence_fixing_post_list");

if($precedenceFixingPostList.children().length==0){
    $precedenceFixingPostBox.hide();
}
//----------------------------------------------------------------------
