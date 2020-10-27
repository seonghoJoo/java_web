<%@page import="org.bmj.ims.dao.IdolsDAO"%>
<%@page import="org.bmj.ims.vo.Idol"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");

	// 파라미터 값 얻어오기
	String idolIdStr = request.getParameter("idolId");
	String name = request.getParameter("name");
	String groupIdStr = request.getParameter("groupId");
	String heightStr = request.getParameter("height");
	String weightStr = request.getParameter("weight");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String genderStr = request.getParameter("gender");
	System.out.println(year+"-"+month+"-"+day);
	System.out.println(heightStr +"  / "+ weightStr);
	
	//형변환
	int idolId = Integer.parseInt(idolIdStr);
	int groupId = Integer.parseInt(groupIdStr);
	double height = Double.parseDouble(heightStr);
	double weight = Double.parseDouble(weightStr);
	Date birthDate = Date.valueOf(year+"-"+month+"-"+day);
	char gender = genderStr.charAt(0);
	System.out.println(height +"  / "+ weight);
	
	//sql 실행
	Idol idol = new Idol(idolId,name,groupId,height,weight,birthDate,gender,"","");
	int result = IdolsDAO.update(idol);
	System.out.println(result+ " 개 업데이트");
	
	// 리다이렉트
	response.sendRedirect("/idolDetail.jsp?idolId="+idolId);
%>