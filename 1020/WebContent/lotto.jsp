<%@page import="java.util.Random"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	// 랜덤한 정수를 발생시키기 위해
	Random ran = new Random();

	// 랜덤한 숫자 가지고 있는 컬렉션
	Set<Integer> lottos = new TreeSet();

	while(lottos.size()<6){
		lottos.add(ran.nextInt(45)+1);
	}//while end
	
	String lottoStr = lottos.toString();
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로또 번호 생성기</title>
</head>
<body>
	<h1>로또 번호 생성기</h1>
	<h2><%= lottoStr.substring(1,lottoStr.length()-1) %></h2>
</body>
</html>