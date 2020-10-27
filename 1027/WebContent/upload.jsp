<%@page import="java.io.File"%>
<%@page import="com.bmj.test.util.ResizeImageUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	// enctype이 x-www-form-urlencoded일때 즉 모든 파라미터가 글자로 넘어올때는
	// 우리가 지금까지 했던 방식으로 파라미터를 받을 수 있음.
	/*
	String name = request.getParameter("name");
	String profile = request.getParameter("profile");
		
	하지만 multipart/form-data 방식이면 쉽게 처리가 불가능
	: 라이브러리를 활용애야 함
	
	1) 	cos 라이브러리 : MODEL1 방식에서 사용

	2) 	apache 재단의 common-fileupload 라이브러리 : 라이브러리는 생명주기 관리 불가능!
		스프링에서 사용
		
	*/
	
	/*
			파일업로드를 하려면 업로드할 경로를 알아야 합니다. 
			c/BMJ/apache-tomcat:8.5.59/wtpwebapps/1027/upload 에 업로드가 됨
	
			MultipartRequest 객체 생성자
			1) request 객체
			2) 업로드 할 경로
			3) 업로드 파일 사이즈
			4) 인코딩 방식
			5) FileRenamePolicy(파일 이름 정책)
	*/

	// 어디서 얻어오냐?
	// 서버의 root 경로
	String root = application.getRealPath("/");
	
	// upload 폴더 경로(원본)
	String uploadPath = root + "upload";
	
	// 썸네일 이미지 경로
	String thumbPath = root + "thumbs";
	
	
	
	// Server Locations -> Use Tomcat installation 서버 지웠다가 다시 설정해야함
	// cos 라이브러리
	// 이때 파일 업로드가 됨
	// multipart로 넘어온 파라미터를 처리하는 객체로 생성될때 파일이 업로드 됨
	MultipartRequest mr = new MultipartRequest(
			request,
			uploadPath,
			1024 * 1024 * 100,//100메가 까지 지원
			"UTF-8", 
			new DefaultFileRenamePolicy());

	
	
	// 이름
	String name = mr.getParameter("name");
	// 아이디
	String id = mr.getParameter("id");
	// 파일명
	String fileName = mr.getFilesystemName("profile");

	//File.seperator OS마다 '/' '\' 인게 달라서
	String source = uploadPath +File.separator+ fileName;
	
	String target = thumbPath + File.separator + fileName;
	
	// 인자 3개 : 정사각형 / 인자 4개 : 직사각형
	boolean result = ResizeImageUtil.resize(source, target, 180);
	System.out.println(result);
%>
이름 : <%=name %><br/>
아이디 : <%=id%><br />
파일명 : <%=fileName %><br />
업로드 : <%= uploadPath%><br/>
소스 : <%=source %><br />
타겟 : <%=target %><br />
<img src="/thumbs/<%=fileName%>"/><br/>
<img src="/upload/<%=fileName%>"/>
<%--
root : <%=root %><br/>
<%=uploadPath%>
 --%>