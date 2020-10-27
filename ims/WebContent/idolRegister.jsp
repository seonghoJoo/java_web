<%@page import="java.io.File"%>
<%@page import="org.bmj.ims.util.ResizeImageUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.bmj.ims.dao.IdolsDAO"%>
<%@page import="org.bmj.ims.vo.Idol"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	// 루트 경로 servlet Context -> 웹서비스 그 자체를 의미 application 내장 객체
	String root = application.getRealPath("/");
	
	// 업로드(원본) 경로
	String uploadPath = root + "upload";
	
	// profile 폴더 경로
	String proFilePath = root + "profile";
	
	// MultipartRequest 객체 생성(파일 업로드)
	MultipartRequest mr = new MultipartRequest(request,uploadPath,1024*1024*100,"UTF-8",new DefaultFileRenamePolicy());
	
	// 실제 파일명 얻기
	String profile = mr.getFilesystemName("profile");
	String source = uploadPath + File.separator+profile;
	String target = proFilePath + File.separator+profile;
	
	// 이미지를 리사이즈
	ResizeImageUtil.resize(source,target, 160);
	
	// 실제 파일명 얻기

	String name = mr.getParameter("name");	
	String year = mr.getParameter("year");
	String month = mr.getParameter("month");
	String day = mr.getParameter("day");

	System.out.println(name+year+month+day);
	//형변환
	Date birthDate = Date.valueOf(year+"-"+month+"-"+day);
	int groupId = Integer.parseInt(mr.getParameter("groupId"));
	double height = Double.parseDouble(mr.getParameter("height"));
	double weight = Double.parseDouble(mr.getParameter("weight"));
	char gender = mr.getParameter("gender").charAt(0);
	Idol idol = new Idol();
	idol.setName(name);
	idol.setGroupId(groupId);
	idol.setHeight(height);
	idol.setWeight(weight);
	idol.setBirthDate(birthDate);
	idol.setGender(gender);
	idol.setProfileImage(profile);
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