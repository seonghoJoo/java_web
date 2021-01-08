package com.bmj.model1.filter;




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

import com.bmj.model1.vo.Member;


@WebFilter(value= {
		"/ajax/deleteReply.json",
		"/ajax/like.json",
		"/ajax/writeReply.json",
		"/update.jsp",
		"/update.bmj",
		"/updateForm.jsp",
		"/write.jsp",
		"/write.bmj",
		"/delete.bmj"
		})
public class LoginCheckFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		System.out.println("LoginCheckFilter 필터작동!!");
		
		HttpSession session = ((HttpServletRequest)request).getSession();
		System.out.println("request:"+request);
		System.out.println("request:"+session);
		Member loginMember =  (Member)session.getAttribute(Member.LOGIN);
		
		if(loginMember==null) {
			((HttpServletResponse)response).sendRedirect("/index.jsp");
		}else {
			chain.doFilter(request, response);
		}//if~else end
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("LoginCheckFilter init");
	}

}
