<%@page import="org.bmj.ims.dao.GroupsDAO"%>
<%@page import="org.bmj.ims.vo.Group"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//POST 방식의 한글처리 나중에 filter를 활용해서 처리할거임
	request.setCharacterEncoding("UTF-8");

	//파라미터를 활용해 받기
	String name = request.getParameter("name");
	String groupIdStr = request.getParameter("groupId");
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	String dayStr = request.getParameter("day");
	
	// 형변환
	int groupId = Integer.parseInt(groupIdStr);
	Date date = Date.valueOf(yearStr + "-" + monthStr + "-" + dayStr);	
	Group group = new Group(groupId,name,date);
	
	//update 구문 수행
	int result = GroupsDAO.update(group);
	System.out.println(result + "개 수정");
	
	//groupDetail.jsp로 이동(리다이렉트)
	response.sendRedirect("/groupDetail.jsp?groupId="+groupId);
%>