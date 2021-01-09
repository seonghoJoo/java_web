<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
	Integer[] userCrews = new Integer[3];
	String[] userCrewImgs = new String[3];
	for(int i=0;i<3;i++){
		System.out.println((Integer)session.getAttribute("userCrewList"+i));
		System.out.println((String)session.getAttribute("userCrewListImg"+i));
		userCrews[i] = (Integer)session.getAttribute("userCrewList"+i);
		userCrewImgs[i] = (String)session.getAttribute("userCrewListImg"+i);
	}
	
		
%>
<div id="header"><!--header start-->
    <div class="inner">
        <div class="header_logo_search"><!--header_left start-->
            <a href="/logout.do"><img src="img/logo.png" alt="saemo logo" title="saemo logo" /></a>
            <form class="header_search"><!--header_search-->
                <fieldset><!--fieldset-->
                    <legend class="screen_out">검색</legend>
                    <input placeholder="검색어를 입력하세요." maxlength="10" />
                    <button type="submit"><i class="fas fa-search"></i></button>
                </fieldset><!--//fieldset-->
            </form><!--//header_search -->
        </div><!--//header_left end-->
        <div class="header_crew_list_meeting_status"><!--header_right start-->
            <div class="header_crew_list"><!--header_crew_list-->
                <ul>
                	<%for(int i=0;i<userCrews.length;i++){ %>
                		<%if(userCrews[i]!=null){ %>
                    		<li><a href="/<%=userCrews[i]%>"><img class="header_crew_list_on" src="<%=userCrewImgs[i] %>" width="40" height="40" /></a></li>
                   		<%}else{ %>
                   			<li><a href="/create_crew.jsp"><i class="fas fa-plus-circle"></i></a></li>
                   		<%} %>
                   	<%} %>
                </ul>
            </div><!--//header_crew_list -->
            <div class="header_meeting_home"><a href="/"><i class="far fa-handshake"></i></a></div>
            <div class="header_status"><a href=""><i class="fas fa-user-circle"></i></a></div>
            <div class="header_status_dropbox">
                <h3 class="screen_out">내메뉴</h3>
                <ul>
                    <li><a href="">마이페이지</a></li>
                    <li><a href="">로그아웃</a></li>
                </ul>
            </div>
        </div><!--//header_right end-->
    </div><!--// inner end-->
</div><!--//header end-->
<div id="container"><!--container start-->