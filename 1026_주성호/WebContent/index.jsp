<%@page import="com.bmj.phonebook.util.PaginateUtil"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.bmj.phonebook.dao.PhonebookDAO"%>
<%@page import="com.bmj.phonebook.vo.PageVO"%>
<%@page import="com.bmj.phonebook.vo.Phone"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Date today = new Date();	
	
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	
	int year = cal.get(Calendar.YEAR);
	System.out.println(year);


	int pageNo = 1;
	String pageStr = request.getParameter("page");
	try{
		pageNo = Integer.parseInt(pageStr);
	}catch(Exception e){
		
	}
	int numPage = 3;
	int total = PhonebookDAO.selectTotal();
	int numBlock = 5;
	String url = "/index.jsp"; // 페이지 주소
	String param = "page=";
	PageVO pageVO = new PageVO(pageNo,numPage);
	String pagiNate = PaginateUtil.getPaginate(pageNo,
            total,
            numPage,
             numBlock,
             url,
             param);
	
	List<Phone> phones = PhonebookDAO.selectPageList(pageVO);
	if(pageNo!= 1 && phones.isEmpty()){
		response.sendRedirect("/index.jsp?pageNo=1");
	}//if end
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>성호의 전화번호부</title>
	<%@include file="/WEB-INF/template/link.jsp" %>
	<link rel="stylesheet" href="/css/paginate.css"/>
</head>
<body>
<%@include file="/WEB-INF/template/header.jsp" %>
<div id="content">
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
<% if(phones.isEmpty()){ %>
<tr>
	<td class="no_data" colspan="6"><i class="far fa-flushed"></i> 아직 전화번호가 없습니다.</td>
</tr>
<%} 
for(Phone phone : phones ){ %>
<tr>
	<th><%= phone.getName()%></th>
	<%if(phone.getPhone().length()==11){ %>
		<td><i class="fas fa-mobile"></i> <%=phone.getPhone().substring(0,3)+"-"+phone.getPhone().substring(3,7)+"-"+phone.getPhone().substring(7,phone.getPhone().length())%></td>
	<%}else{ %>
		<td><i class="fas fa-mobile"></i> <%=phone.getPhone().substring(0,3)+"-"+phone.getPhone().substring(3,6)+"-"+phone.getPhone().substring(6,phone.getPhone().length())%></td>
	<%} %>
	<td>
	<i class="fa fa-<%= (phone.getGender() == 'F'? "fe" :"") %>male"></i>
  <%= (phone.getGender() == 'F'? "여" :"남") %>
  <% 
	cal.setTime(phone.getBirthDate());
	int birthYear = cal.get(Calendar.YEAR); %>
  </td>
  <td title="<%=phone.getBirthDate()%>"><%= year-birthYear+1 %></td>
	<td>
		<a href="/updateForm.jsp?no=<%=phone.getNo() %>" class="btn update"><i class="fa fa-wrench"></i> 수정</a>
	</td>
	<td>
		<a href="/delete.bmj?no=<%=phone.getNo() %>" data-name="<%=phone.getName() %>" class="btn delete"><i class="far fa-trash-alt"></i> 삭제</a>
	</td>
</tr>
	<%} %>
</tbody>
<tfoot>
<tr>
	<td class="box_btn" colspan="7">
		<!--  <div class='paginate'><span title="이전 페이지 없음"><i class="fa fa-chevron-left"></i></span><strong title='현재 1페이지'>1</strong><span title='다음 페이지 없음'><i class='fa fa-chevron-right'></i></span></div>
		-->
		<%= pagiNate %>
	</td>
</tr>
<tr>
	<td class="box_btn" colspan="7">
		<a href="/registerForm.jsp" class="btn"><i class="fas fa-pencil-alt"></i> 전화번호 작성</a>
	</td>
</tr>
</tfoot>
</table>
</div>
</div><!-- //content  -->

<%@include file="/WEB-INF/template/footer.jsp" %><!-- //footer -->
<script src="/js/jquery.js"></script>
<script>


// confirm 창을 써야한다!!
$('.delete').on("click",function () {
   	
    //const no = $(this).attr("data-car-type");
    const no = $(this).attr("data-name");
   
    const name = $(this).data('name');
	 if (confirm(name+"님을 정말로 삭제하시겠습니까??") == true){    //확인
	     document.removefrm.submit();
	 }else{   //취소
	     return false;
	 }
	console.log(name);
});

</script>
</body>
</html>