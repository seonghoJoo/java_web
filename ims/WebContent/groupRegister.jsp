<%@page import="org.bmj.ims.vo.Group"%>
<%@page import="java.sql.Date"%>
<%@page import="org.bmj.ims.dao.GroupsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	
	// 등록페이지는 유저에게 보여줄 컨텐츠가 없습니다.
	// 이런 페이지를 none-view 라고 함
	// 엄밀히 말하면 redirect
	
	
	// 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");	
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	Date d = Date.valueOf(year+"-"+month+"-"+day);
	Group group = new Group(name,d);
	System.out.println("groupId: " + group.getGroupId());
	int result = GroupsDAO.insert(group);
	System.out.println("result" + result);
	System.out.println("groupId: " + group.getGroupId());
	// 이 페이지에서 insert시킨 후 groupList.jsp로 이동(리다이렉트)
	response.sendRedirect("/groupDetail.jsp?groupId="+group.getGroupId());
%>
이름 : <%=name %><br />
년 : <%=year %><br />
월 : <%=month %><br />
일 : <%=day %><br />