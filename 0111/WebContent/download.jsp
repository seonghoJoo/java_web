<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String urlStr = request.getParameter("url");

	//톰캣 루트 경로
	String root = application.getRealPath("/");
	
	System.out.println(root);
	
	// 다운로드 폴더 경로
	String downloadPath = root +"download" + File.separator;
	System.out.println(downloadPath);
	/*
		1) downloadForm.jsp에서 넘어온 주소를 얻기

		2) 톰캣경로의 download 폴더의 경로 알기
		
		3) 파일명 및 확장자를 얻어와야 함
		
	*/
	
	URL url = new URL(urlStr);
	// 파일명 얻기
	String fileName = urlStr.substring(urlStr.lastIndexOf("/")+1,urlStr.length());
		
		
	InputStream in = url.openStream();
	
	FileOutputStream fos = new FileOutputStream(downloadPath+fileName);
	
	//현재 밀리 세컨드 초 (유닉스 타임)
	long start = System.currentTimeMillis();
	System.out.println("시작");
	
	//값
	byte[] values = new byte[4096];
	
	//사이즈
	int size = 0;
	
	while((size=in.read(values))!=-1) {
		fos.write(values,0,size);
	}//while end
	long end = System.currentTimeMillis();
	System.out.println(end-start+"초 걸림");
	
	in.close();
	fos.close();
	
%>
<!DOCTYPE html lang="ko">
<html>
<head>
<meta charset="UTF-8">
<title>다운로드 받은 파일 보기</title>
</head>
<body>
	<div>
		<img src="/download/<%= fileName%>"/>
	</div>
</body>
</html>