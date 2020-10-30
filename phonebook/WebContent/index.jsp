<%@page import="com.bmj.phonebook.util.PaginateUtil"%>
<%@page import="com.bmj.phonebook.vo.Phone"%>
<%@page import="com.bmj.phonebook.vo.PageVO"%>
<%@page import="com.bmj.phonebook.dao.PhonebookDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	int pageNo = 1;
	String pageNoStr = request.getParameter("page");
	try{
		//numberFormatException error 방지
		pageNo = Integer.parseInt(pageNoStr);
	}catch(Exception e){
	}//try~catch end
	
	int total = PhonebookDAO.selectTotal(); 
	System.out.println(total);
	int numPage = 3;
	
	int numBlock = 3;
	String url = "/index.jsp";
	String param = "page=";
	
	
	PageVO pageVO = new PageVO(pageNo,numPage);	
	List<Phone> phones = PhonebookDAO.selectList(pageVO);
	/*
	
	if(pageNo > Math.ceil(total / numPage)){
		pageNo = 1;
	}*/
			
	String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);
	
	

%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>아주 멋진 전화번호부</title>
	<%@ include file="/WEB-INF/template/link.jsp" %>
	<link rel="stylesheet" href="/css/index.css"/>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<!-- content -->
<h2><i class="fas fa-clipboard-list"></i> 전화번호 목록</h2>
<div id="phoneBox">
<table border="1">
<caption class="screen_out">전화번호표</caption>
<colgroup>
	<col id="name"/>
	<col id="phone"/>
	<col id="gender"/>
	<col id="age"/>
	<col id="update"/>
	<col id="delete"/>
</colgroup>
<thead>
<tr>
	<th>이 름</th>
	<th>전화번호</th>
	<th>성 별</th>
	<th>나 이</th>
	<th>수 정</th>
	<th>삭 제</th>
</tr>
</thead>
<tbody>
	<% if(phones.isEmpty()){%>
<tr>
	<td class="no_data" colspan="6"><i class="far fa-flushed"></i> 아직 전화번호가 없습니다.</td>
</tr>
	<%} %>
<% for(Phone phone : phones){ %>
<tr>
	<th><%= phone.getName()%></th>
	<td><i class="fas fa-mobile"></i> <%=phone.getPhoneFormat()%></td>
	<td>
	<%=phone.getGenderIcon() %>
  </td>
  <td title="<%=phone.getBirthDate()%>"><%=phone.getAge() %>세</td>
	<td>
		<a href="/updateForm.jsp?no=<%=phone.getNo() %>" class="btn update"><i class="fa fa-wrench"></i> 수정</a>
	</td>
	<td>
		<a href="/delete.bmj?no=<%=phone.getNo() %>" class="btn delete"><i class="far fa-trash-alt"></i> 삭제</a>
	</td>
</tr>
<%}  %>

</tbody>
<tfoot>
<%if(!phones.isEmpty()){ %>
<tr>
	<td class="box_btn" colspan="7">
		<%=paginate %>
	</td>
</tr>
<%} %>
<tr>
	<td class="box_btn" colspan="7">
		<a href="/registerForm.jsp" class="btn"><i class="fas fa-pencil-alt"></i> 전화번호 작성</a>
	</td>
</tr>
</tfoot>
</table>
</div>
<!-- //#contents end -->

</body>
</html>