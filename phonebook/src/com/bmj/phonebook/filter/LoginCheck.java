package com.bmj.phonebook.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter({
	"/main.jsp",
	"/increase.jsp",
	"/updateForm.jsp",
	"/registerForm.jsp",
	"/register.bmj",
	"/update.bmj",
	"/delete.bmj"
})
public class LoginCheck implements Filter{
	
	// 사용안함
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		// HttpServletRequest 객체로 강제 형변환 부모에서 자식으로
		HttpServletRequest req = (HttpServletRequest)request;
		
		// 세션을 얻어옴
		HttpSession session = req.getSession();
		
		Object loginMemeber = session.getAttribute("loginMember");
		HttpServletResponse resp = (HttpServletResponse)response;
		if(loginMemeber==null) {
			session.setAttribute("msg", "로그인을 해주세요");
			resp.sendRedirect("/index.jsp");
		}else {
			//로그인 되었으면 해당페이지 or 서블릿으로 이동
			chain.doFilter(request, response);
		}//if~else end
	}
	
	// 사용 안함
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
// interface들은 adapter가 보통 있어서 extends를 받을 수 있다
	
	
	
}
