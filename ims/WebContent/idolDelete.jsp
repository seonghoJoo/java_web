<%@page import="org.bmj.ims.dao.IdolsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	// 넘어온 파라미터 받음
	String idolIdStr = request.getParameter("idolId");
	
	//int 형으로 변환
	int idolId = Integer.parseInt(idolIdStr);
	
	// 삭제
	int result = IdolsDAO.delete(idolId);
	System.out.println(result);
	
	//groupList.jsp로 리다이렉트
	response.sendRedirect("/idolList.jsp");
	
%>