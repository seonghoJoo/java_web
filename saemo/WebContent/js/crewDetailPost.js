// 사진 수에 따라 사진이 보이는 이미지가 다르게 만드는 기능
const $postingImage = $(".posting_image");
const $postingImageList = $(".posting_image_list");
let imageNumber = $postingImageList.children().length;

switch(imageNumber){
    case 0: break;
    case 1: $postingImage.addClass("image_box_type1"); break;
    case 2: $postingImage.addClass("image_box_type2"); break;
    case 3: $postingImage.addClass("image_box_type3"); break;
    case 4: $postingImage.addClass("image_box_type4"); break;
    default: $postingImage.addClass("image_box_type5");
        $postingImageList.children().eq(3).addClass("more_image");
        break;
}
//----------------------------------------------------------------------

// 좋아요 기능
const $likeBtnBox = $(".like_btn");
const $likeBtn = $(".like_btn>.likeBtn");

$likeBtnBox.click(function(){
    if($likeBtn.prop("checked")){
        $likeBtn.attr("checked",false);
        $(this).removeClass("like");
    }else{
        $likeBtn.attr("checked",true);
        $(this).addClass("like");
    }
});
//----------------------------------------------------------------------

// 좋아요 누른 사람들 다 보는 기능
const $sortingLikeBox = $(".sorting_like_box");
const $sortingLikeList = $(".sorting_like_list");

if($sortingLikeList.children().length>6){
    $sortingLikeBox.addClass("over");
}else{
    $sortingLikeBox.removeClass("over");
}

const $likeBox = $(".like_box");

$likeBox.click(function(){
    $sortingLikeBox.css("display","block");
});

$("html").click(function(e){
    if(!($(e.target).hasClass("like_box")||$(e.target).hasClass("like_icon")||
        $(e.target).hasClass("like_count")||$(e.target).hasClass("fa-caret-square-down")||$(e.target).hasClass("fa-heart"))){
        $sortingLikeBox.css("display","none");
    }else{
        $sortingLikeBox.css("display","block");
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