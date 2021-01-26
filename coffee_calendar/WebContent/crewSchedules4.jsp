<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/template/link.jsp"%>
<link rel="icon" href="/img/favicon.png" />
<link rel="stylesheet" href="/css/crewDetailSchedule.css" />
<link rel="stylesheet" href="/css/calendar.css" />
<style>
  #header{
    position: fixed;
    z-index: 200;
  }
  #crewDetailHeader{
    z-index: 200;
  }
  .calendar_box{
    display: none;
  }
  .calendar_box.appear{
    display: block;
  }
</style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp"%>
	<button class="schedule_btn">일정</button>

  <div class="calendar_box"><!--calendar_box start 이게 다 감싸는 거임-->
    <ul class="calendar_tab"><!--calendar_tab start-->
      <li><a href="">일정 캘린더</a></li>
      <li><a href="">일정 전체보기</a></li>
    </ul><!--//calendar_tab start-->
    <div class="calendar_wrap"><!--calendar_wrap start-->
      <div class="box_for_full_calendar">
        <div id="calendar"></div><!--일단 템플릿 밖으로 빼봄-->
      </div>
      <div class="daily_schedule_box"><!--daily_schedule_box start-->
          <!--여기에 일별 일정 리스트 탬플릿 붙임-->
      </div><!--//daily_schedule_box end-->
      <ul id="allSchedulesList">
        <!--모든 일정 리스트 템플릿 들어갈자리-->
      </ul>
    </div><!--//calendar_wrap end-->
  </div><!--//calendar_box end-->
<%@ include file="/WEB-INF/template/footer.jsp"%>
<!-- 일별 일정 리스트 템플릿 -->
  <!-- 일별 일정 리스트 및 일정 캘린더 템플릿 시작 -->
  <script type="text/template" id="dailySchedulesListTmpl">
    <div class="daily_schedule_header">
      <span><@=date@>일 <em><@=day@></em></span>
    </div>
    <ul id="dailySchedulesList">
      <@ _.each(dailySchedules, function(daily){ @>
      <li class="daily_schedule_item">
        <dl>
          <dt class="schedule_title screen_out">일정명</dt>
          <dd><a href=""><@=daily.name@></a></dd>
          <dt class="schedule_time screen_out">시작시간</dt>
          <dd><@=daily.startDateStr@> 시작</dd>
          <@ if(daily.participantsTotal >=0 && daily.nonParticipantsTotal >=0){ @>
          <dt class="schedule_rsvp screen_out">참여여부</dt>
          <dd>참석 <@=daily.participantsTotal@></dd>
          <dd>불참석 <@=daily.nonParticipantsTotal@></dd>
          <@} else{} @>
        </dl>
      </li>
      <@})@>
    </ul>
  </script><!--// 일별 일정 리스트 템플릿 끝 -->

  <!-- 모든 일정 리스트 템플릿 시작 -->
  <script type="text/template" id="allSchedulesListTmpl">
    <@ _.each(allSchedules, function(all){
    console.log(all.extendedProps.image)@>
    <li class="all_schedule_item">
      <dl>
        <div class="schedule_info">
          <dt class="schedule_title screen_out">일정명</dt>
          <dd><a href=""><@=all.title@></a></dd>
          <dt class="schedule_time screen_out">시작시간</dt>
          <dd><@=all.start@> 시작</dd>
          <@ if(all.extendedProps.participantsNum!==undefined){ @>
          <dt class="schedule_rsvp screen_out">참여여부</dt>
          <dd>참석 <@=all.extendedProps.participantsNum@></dd>
          <dd>불참석 <@=all.extendedProps.nonParticipantsNum@></dd>
          <@} else{} @>
        </div>
        <@ if(all.extendedProps.image!==undefined){ @>
        <div class="other_crew_info">
          <dt class="other_crew_img screen_out">밋팅사진</dt>
          <dd><img src="/img/meeting/<@=all.extendedProps.image@>" /></dd>
          <@} else{} @>
          <@ if(all.extendedProps.otherCrew!==undefined){ @>
          <dt class="other_crew screen_out">상대크루</dt>
          <dd><@=all.extendedProps.otherCrew@></dd>
          <@} else{} @>
          <@ if(all.extendedProps.saemo!==undefined){ @>
          <dt class="saemo_point screen_out">새모포인트</dt>
          <dd><img src="/img/saemoPoint.png" width="20" height="20" /><@=all.extendedProps.saemo@></dd>
        </div>
        <@} else{} @>
      </dl>
    </li>
    <@})@>
  </script><!--// 모든 일정 리스트 템플릿 끝 -->
  <script src="js/jquery.js"></script>
  <script src="js/main.js"></script>
  <script src='js/locales-all.js'></script>
  <script src="js/underscore-min.js"></script>
  <script src="js/moment-with-locales.js"></script>
  <script>
  const crewNo = 3000;
  </script>
<script>

  // 언더스코어는 기본적으로 %을 사용하는데 %는  jsp에서 사용할 수 없기 때문에 % -> @ 로변경하는 코드가 필요함
  _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};


  //일별 일정 리스트 템플릿: 현재 여기에 일별+모든 일정 리스트 다 합쳐서 넣음.
  const dailySchedulesListTmpl = _.template($("#dailySchedulesListTmpl").html());
  //모든 일정 리스트 템플릿
  const allSchedulesListTmpl = _.template($("#allSchedulesListTmpl").html());

  const today = new Date();//오늘 날짜 얻기

  const calendarEl = document.getElementById("calendar");//이거 지금 템플릿 안에 있어서 그런가?
  //undefined 뜨는 이유가?==> 그래서 일단 템플릿 밖으로 뺌.
		  
	//let tempDate = -1;
  
  const calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
      //툴바 위치 조정 여기서 가능함
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth',
    },

    initialDate: today,
    //navLinks: true, // can click day/week names to navigate views
    //이거 true 아니면 e.stopPropagation(); 안해줘도 됨.
    businessHours: true, // display business hours
    editable: true,
    selectable: true,
    locale:"ko",
    //select: triggered when a date/time selection is made.
    dateClick: function(info) {
      console.log(info);
      getDailySchedulesList(info.date,info.dateStr,info.date.getFullYear(),info.date.getMonth()+1,info.date.getDate(),
    		  info.date.getHours(),info.date.getMinutes(),info.date.getSeconds(),info.date.getMilliseconds());//풀캘린더가 자체적으로 갖고 있는 속성들 date, dateStr 
      //tempDate = info.dateStr;
     
      //alert(info.dateStr);
      //alert('selected ' + info.startStr + ' to ' + info.endStr);
      //우리가 만든 일별 일정 리스트 html템플릿에 일 날짜 클릭시에 뜨게할 때 필요함!!
    }
  });//풀캘린더 만들기.


  //스케줄 버튼 클릭하면 일정 뜨도록(크루 디테일에서 일정탭 클릭하면 뜨는 것처럼)
  const $scheduleBtn = $(".schedule_btn");
  const $calendarBox = $(".calendar_box");//모든 스케줄 다 감싼 박스


  const $newMonthCalendar= $(".calendar_tab li:nth-child(1)>a");//일정 캘린터 탭
  const $newWholeCalendar= $(".calendar_tab li:nth-child(2)>a");//일정 전체보기 탭
  const $dailyScheduleBox = $(".daily_schedule_box");//매일 일정 리스트 박스
  const $allSchedulesList = $("#allSchedulesList");//전체 스케줄 리스트 담는애
  //지금 템플릿 안에 넣어서 페이지 안에 없음.... 페이지가 로딩될때는 jquery 입장에서 얘가 없음
  const $calendarWrap = $(".calendar_wrap");//매일일정, 캘린더, 전체 스케줄 리스트 다 담고 있는애


  const $monthCalendar = $(".fc-dayGridMonth-button");//기존 "월" 버튼
  const $wholeCalendar = $(".fc-listMonth-button");//기존 "일정목록" 버튼
  const $prevBtn = $(".fc-prev-button");//전월 이동 버튼
  const $nextBtn = $(".fc-next-button");//다음월 이동 버튼
  const $todayBtn = $(".fc-today-button");//오늘 버튼


  //일정 버튼 누르면 캘린더와 일별일정 리스트 뜨게 만들기
  $scheduleBtn.click(function () {
    $calendarBox.addClass("appear");
    $newMonthCalendar.addClass("color");
    calendar.render();//렌더해야 캘린더 찌그러지는거 막음.
    getDailySchedulesList(new Date());
  });

    $newMonthCalendar.click(function (e) {
      e.preventDefault();
      $monthCalendar.click();
      $calendarBox.addClass("appear");
      $(".box_for_full_calendar").show();
      $(".daily_schedule_box").removeClass("disappear");
      $allSchedulesList.removeClass("appear");
      $(this).addClass("color");
      $newWholeCalendar.removeClass("color");//일정 전체보기 색깔 빼기
      calendar.render();
    });

  $newWholeCalendar.click(function (e) {//일정 전체보기 탭 클릭시

    e.preventDefault();//링크이동 막기
    $(this).addClass("color");//일정 전체보기 탭에 색깔 줌
    $(".box_for_full_calendar").hide();
    $(".daily_schedule_box").addClass("disappear");
    $newMonthCalendar.removeClass("color");
    $allSchedulesList.addClass("appear");
  });
  
    function getDailySchedulesList(dateAll,dateStr,year,month,date,hour,min,sec,milSec) {

      $.ajax({
        url:"/ajax/getDailyScheduleList.json",
        dataType: "json",
        type: "POST",
        data:{"dateAll":dateAll,"dateStr":dateStr,"crewNo":crewNo,"year":year,"month":month,"date":date,"hour":hour,"min":min,
        	"sec":sec,"milSec":milSec},//넘겨야 할 정보들
        error:function() {
          alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
        },
        success:function (json) {
          let dayArray=["일","월","화","수","목","금","토"]
          $(".daily_schedule_box").html(dailySchedulesListTmpl({date :dateAll.getDate(), day:dayArray[dateAll.getDay()], dailySchedules:json}));

        }//success end
      })//ajax end

    }//getDailySchedulesList() end
    
  	//이렇게 했기 때문에 오늘 날짜가 제일 먼저 뜨는 것.
  	getDailySchedulesList(new Date());

    //모든 일정 목록을 불러오는 함수
    function getAllSchedulesList() {

      $.ajax({
        url:"ajax/allSchedules.json",
        error:function() {
          alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
        },
        success:function (json) {
          console.log(json);
          $("#allSchedulesList").html(allSchedulesListTmpl({allSchedules : json}));
        }//success end
      })//ajax end

    }//getAllSchedulesList() end
      getAllSchedulesList();

    calendar.render();

  function getMonthSchedules(info) {
    $.ajax({
      url:"/ajax/monthSchedules.json",
      data:{
        "date":info, "crewNo":crewNo
      },
      error:function () {
        alert("에러!");
      },
      success: function (json) {
        console.log(json);
        calendar.addEventSource(json);
      }
    });
  }
  getMonthSchedules();
  //월별 스케줄은 미리 떠 있어야 함. 그래서 함수 호출함.
  //일별 스케줄은 dateClick 속성 적용해서 따로 만든 li html 에 뜨게 해야 함.

  


</script>


</body>
</html>