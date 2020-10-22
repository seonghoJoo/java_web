<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Date debutDate = Date.valueOf("2013-6-13");
	//depreicated - 이제 사용하지 마라란 뜻
	
	// Calendar 추상클래스라 new Calendar()가 안됨
	Calendar cal = Calendar.getInstance();
	
	//해당 날짜로 세팅
	cal.setTime(debutDate);
	
	//년 월 일 등등 얻어오는 메서드 : get(인자)
	

%>

<%= cal.get(Calendar.YEAR) %> 년
<%= cal.get(Calendar.MONTH)+1 %> 월
<%= cal.get(Calendar.DATE) %> 일