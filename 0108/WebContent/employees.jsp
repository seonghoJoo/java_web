<%@page import="java.util.List"%>
<%@page import="dao.EmployeesDAO"%>
<%@page import="vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Employee> employees = EmployeesDAO.selectList();
	System.out.println(employees.size());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>사원 목록</h1>
<table border="1">
	<thead>
		<tr>
			<th>사번</th>
			<th>성명</th>
			<th>입사일</th>
		</tr>
	</thead>
	<tbody>
	<%for(Employee employee : employees){ %>
		<tr>
			<td><%=employee.getEmployeeId() %></td>
			<td>
				<%=employee.getFirstName()%>
				<%=employee.getLastName()%>
			</td>
			<td><%=employee.getHireDate()%></td>
		</tr>
		<%} %>
	</tbody>
</table>

</body>
</html>