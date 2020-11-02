	const $year = $('#year');
	const $month = $('#month');
	const $date = $('#date');
	
	// 현재 
	const now = moment();
	// 년과 월을 생성하는 함수
	function createYearMonth(){
		
		//월을 생성
		for(let i = 1 ; i < 13 ; i++ ){
			$("<option>").text(i).appendTo($month);
		}//for end
		
		//년을 생성
		for(let i = now.year(); i>=now.year()-120;i--){
			$('<option>').text(i).appendTo($year);
		}// for end
		createDate();
	}// createYearMonth() end
	createYearMonth();
	// 유저가 선택한 년도와 월을 가지고 해당하는 날짜를 생성하는 함수
	function createDate(){
		$date.empty();
		// 유저가 선택한 년도
		const year = $year.val();
		// 유저가 선택한 월
		const month = $month.val();
		
		const date = $date.val();

		const lastDate = moment([year,month-1]).daysInMonth();
		//for(let i = 1 ; i<=moment(year+"-"+month, "YYYY-M").daysInMonth();i++){
		for(let i = 1; i<=lastDate ; i++){
			$('<option>').text(i).appendTo($date);
		}// for end
	}
	$date.on("click",function(){
		
		createDate();
	});
	// ※ 주의 ※ createDate에 ()가 없음
 	$year.change(createDate);
	$month.on("change",createDate);