// 성별 아이콘 조절
const $sexRatioMaleImageBox = $(".sex_ratio_male_image_box");
const $sexRatioFemaleImageBox = $(".sex_ratio_female_image_box");
let maleNumber = $sexRatioMaleImageBox.data("maleNumber");
let femaleNumber = $sexRatioFemaleImageBox.data("femaleNumber");
let maleRatio = (maleNumber*260)/(maleNumber+femaleNumber);
let femaleRatio = (femaleNumber*260)/(maleNumber+femaleNumber);
let sexRatio = (maleNumber*100)/(maleNumber+femaleNumber);

$sexRatioMaleImageBox.css("max-height", maleRatio+"px");
$sexRatioFemaleImageBox.css("max-height", femaleRatio+"px");
$(".sex_ratio_female_image_box>img").css("margin-top", "-"+(260-femaleRatio)+"px");
$(".crew_sex_ratio_box>span").text(sexRatio+"%")
//-------------------------------------------------

// 게시판 추가 기능
const $boardAdding = $(".board_adding");
const $boardPlusContainer = $("#boardPlusContainer");

$boardAdding.click(function(){
    $boardPlusContainer.css("display", "block")
    $("html").css("overflow-y","hidden");
})

$("html").click(function(e){
    if(!($(e.target).parents("#boardPlusContainer").hasClass("board_plus_container")||$(e.target).hasClass("board_adding"))){
        $boardPlusContainer.css("display", "none");
        $("html").css("overflow-y","scroll");
    }else{
        
    }
})
//-------------------------------------------------

// 게시판 갯수 제한 + 글자 수 제한
const $crewDetailBoardList = $(".crew_detail_board_list");
const $boardNumber = $(".board_number");
const $boardName = $("#boardName");
let newBoardNumber = $crewDetailBoardList.children(".new_board").length;

if(newBoardNumber==3) {
    $boardAdding.hide();
}

$boardName.keyup(function(){
    $(this).val($(this).val().substr(0,5));
});
$boardNumber.text("("+newBoardNumber+" / 3)");
//-------------------------------------------------

// upcomming event에서 "N명 참여 중" 위에 마우스 올렸을 때, 참여하는 인원들 프로필 사진을 띄우는 함수
const $participants = $(".upcomming_event_participants");
const $participantsListBox = $(".upcomming_event_participants_list_box");

$participants.hover(function(){
    $participantsListBox.css("display","block");
}, function(){
    $participantsListBox.css("display", "none");
}); //$participants.hover end
/*
const $headerStatus = $('.header_status');
const $headerStatusDropbox = $('.header_status_dropbox');
$headerStatus.click(function (e) {
    e.preventDefault();
    $headerStatusDropbox.toggleClass("show");
});*/
//-------------------------------------------------

// 가입조건 3개 초과시 숨기고 더 보기 띄우는 기능
const $conditionList = $(".condition_list");
const $viewMore = $(".view_more");

if($conditionList.children().length>3){
    $conditionList.parent().parent().css("height","179px");
    $conditionList.css("margin-bottom","19px");
    $viewMore.show();
}
//-------------------------------------------------
// 실패작들
// $participants.hover(function(){
//     $.ajax({
//         url: "data/testData.json",
//         error: function(){
//             alert("실수");
//         },
//         success: function(json){
//             $(json).each(function(){
//                 const $participantsImage = $("<li>").append($("<img>").attr("src", this.image).attr("width", "30px").attr("height", "30px"));
//                 $participantsImageList.append($participantsImage);
//                 if($(".upcomming_event_participants_list>li").length%8==0){
//                     $("<br />").appendTo($participantsImageList);
//                 }
//             }); // $(json).each end
//             $participantsListBox.css("display","block");
//         }
//     }); // $.ajax end
// },function() {
//     $participantsListBox.css("display", "none");
//     $participantsImageList.empty();
// }); // $participants.hover end