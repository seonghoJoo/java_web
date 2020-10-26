<%@page import="org.bmj.ims.dao.GroupsDAO"%>
<%@page import="org.bmj.ims.vo.Group"%>
<%@page import="java.util.List"%>
<%@page import="org.bmj.ims.dao.IdolsDAO"%>
<%@page import="org.bmj.ims.vo.Idol"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idolIdStr = request.getParameter("idolId");
	int idolId = Integer.parseInt(idolIdStr);
	Idol idol = IdolsDAO.selectOne(idolId);
	
	List<Group> groups = GroupsDAO.selectList();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이돌 수정 | AIMS</title>
<link rel="stylesheet" href="/css/all.min.css"/>
<link rel="stylesheet" href="/css/notosanskr.css"/>
<link rel="stylesheet" href="/css/default.css" />
<style>
 /*[속성] 선택자*/
	  input[type=radio]{
	  	display:none;
	  }
	  /*+ 다음요소 선택자*/
	  input[type=radio]+label{
	  	display: inline-block;
	  	padding : 8px 12px;
	  	border : 1.5px solid #424242;
	  	border-radius : 12px;
	  	cursor: pointer;
	  	margin: 5px 0;
	  }
	  input[type=radio]+label:hover{
	  	box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	  }
	  input[type=radio]:checked+label{
	  	background:#424242;
	  	color:#fff;
	  }
</style>
</head>
<body>
	<h1><a href="/"><i class="far fa-address-book"></i>  Awesome Idol Management Service</a></h1>
	<h2><i class="fas fa-wrench"></i> 아이돌 수정</h2>
	<!-- 수정 폼임 -->
	<!-- noneView Page 등록되는게 눈에 안보임 -->
	<form action="/idolUpdate.jsp" method="post">
		<!--  유저에겐 보이진 않지만.. post로 보내줘야해 naver 검색창 생각해 -->
		<input type="hidden" name="idolId" value="<%=idolId %>"/>
		<fieldset>
			<legend>
				아이돌 수정
			</legend>
			<p>
				<label>
				 이름
				 <input name="name" placeholder="아이돌 이름" value="<%=idol.getName() %> "/>
				</label>
			</p>
			
			<p>
				<label>
				 키
				 <input name="height" placeholder="키" value="<%=idol.getHeight() %>"/>
				</label>
				cm
			</p>
			<p>
				<label>
				 몸무게
				 <input name="weight" placeholder="몸무게" value="<%=idol.getWeight() %>"/>
				</label>
				kg
			</p>
			<p>
				<strong>성별</strong>
				<!-- name이 같아야 둘중에 하나만 선택이 가능해짐 -->
				<input type="radio" id="male" name="gender" <%if(idol.getGender() == 'M'){ %>checked <%} %>
				value="M"><label for="male"><i class="fas fa-male"></i>  남자</label>
				<input type="radio" id="female" name="gender" <%if(idol.getGender() == 'F'){ %>checked <%} %>
				value="F" ><label for="female"><i class="fas fa-female"></i>  여자</label>
			<p>
			
			<p>
				<strong> 생년월일</strong>
				<select name="year">
					<%for(int i=2020;i>1906;i--){ %>
					<option <%if(i==idol.getBirthYear()){%>selected <% } %> value="<%=i %>">
						<%=i %>
					</option>
					<%} %>
				</select>년
				<select name="month">
					<%for(int i=1;i<13;i++){ %>
					<option
					<%if(i==idol.getBirthMonth()){
						%> selected <%
						}%> value="<%=i %>">
					<%=i %>
					</option>
				
					<%} %>
				</select>월
				<select name="day">
					<%for(int i=1;i<32;i++){ %>
					<option <%if(i==idol.getBirthDay()){ %>
						selected <%
					}%> value="<%=i %>">
					<%=i %>
					</option>
					<%} %>
				</select>일
			</p>
			
			<p>
				<strong>그룹 선택</strong>
				<% for(Group group : groups){ %>
				<input <%if(group.getGroupId() == idol.getGroupId()){ %>checked <%} %> value="<%=group.getGroupId() %>" id="group<%=group.getGroupId() %>" type="radio" name="groupId" />
				<label for="group<%=group.getGroupId() %>"><%=group.getName() %></label>
				<%} %>
			</p>
			
			
			<p>
				<button class="btn" type="submit">수정하기</button>
			</p>	
		</fieldset>
	</form>
	<a class="btn" href="/idolList.jsp"><i class="fas fa-user-friends"></i>목록으로</a>
</body>
</html>