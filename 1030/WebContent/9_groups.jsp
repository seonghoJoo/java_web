<%@page import="util.PaginateUtil"%>
<%@page import="dao.GroupsDAO"%>
<%@page import="vo.PageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>그룹 목록</title>
<style>
	table{
		border-collapse : collapse;
	}
	td, th {
		border : 1px solid #424242;
		padding : 8px 12px;
	}
	
	
</style>
</head>
<body>
	<h1>그룹 목록</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>그룹명</th>
				<th>데뷔일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="3">아직없음</td>
			</tr>
		</tbody>
	</table>
	<script type="text/template" id="groupTmpl">
		<@ _.each(groupList,function(group){ @>
		<tr>
				<th><@=group.groupId@></th>
				<th><@=group.name@></th>
				<th><@=group.debutDate@></th>
		</tr>
		<@}); @>
	</script>
	<script src="/js/jquery.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script src="/js/moment-with-locales.js"></script>
	<script>
		//% -> @ 으로
		_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
		
		$.ajax({
			url: "/getGroups.mms",
			error : function(){
				alert("서버 오류!");
			},
			success : function(groups){
				const groupTmpl = _.template($('#groupTmpl').html());
				// .html 대신 .append를 사용하면 아직없음이 있고 밑에 쌓이게 됨
				$('tbody').html(groupTmpl({"groupList":groups}));	//명 : 값 명은 each의 변수명 값:json
			}
		});
			
	</script>
</body>
</html>