<%@page import="org.bmj.ims.dao.IdolsDAO"%>
<%@page import="org.bmj.ims.vo.Idol"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	// 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");	
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	//형변환
	Date birthDate = Date.valueOf(year+"-"+month+"-"+day);
	int groupId = Integer.parseInt(request.getParameter("groupId"));
	double height = Double.parseDouble(request.getParameter("height"));
	double weight = Double.parseDouble(request.getParameter("weight"));
	char gender = request.getParameter("gender").charAt(0);
	Idol idol = new Idol(name,groupId,height,weight,birthDate,gender);
	System.out.println("전: "+idol.getIdolId() +" / "+ name + " / " + year + month + day + " / " +groupId +" / "+  height + "cm / "
			
			+ weight+"kg / " + gender);
	int result = IdolsDAO.insert(idol);
	System.out.println("후: "+idol.getIdolId() +" / "+ name + " / " + year + month + day + " / " +groupId +" / "+  height + "cm / "
			
			+ weight+"kg / " + gender);
	// 이 페이지에서 insert시킨 후 groupList.jsp로 이동(리다이렉트)
	response.sendRedirect("/idolDetail.jsp?idolId=" + idol.getIdolId());
%>

<%-- 
jsp 주석은 .java파일로 변환시 아예 없어짐

SELECT idols_seq.nextval
FROM dual

--%>