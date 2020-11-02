	const $year = $('#year');
	const $month = $('#month');
	const $date = $('#date');
	
	// 현재 
	const now = moment();
	// 년과 월을 생성하는 함수
	function createYearMonth(year,month,date){
	
		if(year==null){
			// 유저가 선택한 년도
			year = $year.val();
		}
		if(month==null){
			// 유저가 선택한 월
			month = $month.val();
		}
		if(date==null){
			date = $date.val();
		}
		$year.empty();
		$month.empty();
		$date.empty();
		
		//월을 생성
		for(let i = 1 ; i < 13 ; i++ ){
			$('<option>').text(i).prop("selected",i==month).appendTo($month);
		}//for end
		
		//년을 생성
		for(let i = now.year(); i>=now.year()-120;i--){
			$('<option>').text(i).prop("selected",i==year).appendTo($year);
		}// for end
		createDate(date);
	}// createYearMonth() end
	
	// 유저가 선택한 년도와 월을 가지고 해당하는 날짜를 생성하는 함수
	function createDate(date){
		$date.empty();
		// 유저가 선택한 년도
		const year = $year.val();
		// 유저가 선택한 월
		const month = $month.val();
		
		const lastDate = moment([year,month-1]).daysInMonth();
		//for(let i = 1 ; i<=moment(year+"-"+month, "YYYY-M").daysInMonth();i++){
		for(let i = 1; i<=lastDate ; i++){
			$('<option>').text(i).prop("selected",i==date).appendTo($date);
		}// for end
	}
	// ※ 주의 ※ createDate에 ()가 없음
 	$year.change(createDate);
	$month.on("change",createDate);
	//$date.on("click",createDate);
	

	