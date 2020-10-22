<%@page import="org.bmj.ims.dao.GroupsDAO"%>
<%@page import="org.bmj.ims.vo.Group"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String groupIdStr = request.getParameter("groupId");
	int groupId = Integer.parseInt(groupIdStr);
	Group group = GroupsDAO.selectOne(groupId);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>그룹 수정 | AIMS</title>
<link rel="stylesheet" href="/css/all.min.css"/>
<link rel="stylesheet" href="/css/notosanskr.css"/>
<link rel="stylesheet" href="/css/default.css" />
</head>
<body>
	<h1><a href="/"><i class="far fa-address-book"></i>  Awesome Idol Management Service</a></h1>
	<h2><i class="fas fa-wrench"></i> 그룹 수정</h2>
	<!-- 수정 폼임 -->
	<!-- noneView Page 등록되는게 눈에 안보임 -->
	<form action="/groupUpdate.jsp" method="post">
		<!--  유저에겐 보이진 않지만.. -->
		<input type="hidden" name="groupId" value="<%=groupId %>"/>
		<fieldset>
			<legend>
				그룹 수정
			</legend>
			<p>
				<label>
				 그룹명
				 <input name="name" placeholder="그룹명" value="<%=group.getName() %> "/>
				</label>
			</p>
			<p>
				<strong> 데뷔년월일</strong>
				<select name="year">
					<%for(int i=2020;i>1906;i--){ %>
					<option <%if(i==group.getDebutYear()){%>selected <% } %>>
						<%=i %>
					</option>
					<%} %>
				</select>년
				<select name="month">
					<%for(int i=1;i<13;i++){ %>
					<option
					<%if(i==group.getDebutMonth()){
						%> selected <%
						}%>>
					<%=i %>
					</option>
				
					<%} %>
				</select>월
				<select name="day">
					<%for(int i=1;i<32;i++){ %>
					<option <%if(i==group.getDebutDay()){ %>
						selected <%
					}%>>
					<%=i %>
					</option>
					<%} %>
				</select>일
			</p>
			<p>
				<button class="btn" type="submit">수정하기</button>
			</p>	
		</fieldset>
	</form>
	<a class="btn" href="/groupList.jsp"><i class="fas fa-user-friends"></i>목록으로</a>
</body>
</html>