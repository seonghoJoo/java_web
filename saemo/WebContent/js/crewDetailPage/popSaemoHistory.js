// 새모 히스토리 나오게 하는 기능
const $meetingHistory = $(".meeting_history");
const $popSaemoRecordsWrap = $(".pop_saemo_records_wrap");

$meetingHistory.click(function(e){
	$popSaemoRecordsWrap.show();
	e.preventDefault();
});
//---------------------------------------------------------------

// 새모 히스토리 바깥 누르면 사라지게 하는 기능
$("html").click(function(e){
    console.log(e.target);
    if(!($(e.target).parents(".pop_saemo_records_box").hasClass("pop_saemo_records_box")||$(e.target).hasClass("meeting_history"))){
        $popSaemoRecordsWrap.hide();
    }else{;}
});
$(".pop_saemo_records_wrap>.close_btn").click(function(){
	$popRegisterWrap.hide();
})
//---------------------------------------------------------------
