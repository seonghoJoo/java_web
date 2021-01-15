
package com.doogwal.coffee.filter;




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

import com.doogwal.coffee.vo.*;

@WebFilter(value= {
		"/write.jsp",
		"/write.bmj",
		"/delete.bmj",
		"/logout.bmj"
		})
public class LoginCheckFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// 형변환
		HttpServletRequest req = (HttpServletRequest) request;
		
		// HttpSession을 얻어옴
		HttpSession session = req.getSession();
		
		// 로그인 멤버를 얻어옴
		Object loginMember = session.getAttribute("loginMember");
		
		if(loginMember==null) {
			
			HttpServletResponse resp = (HttpServletResponse) response;
			resp.sendRedirect("/index.jsp");
			
			//((HttpServletResponse)response).sendRedirect("/index.jsp");
		}else {
			chain.doFilter(request, response);
		}//if~else end
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("LoginCheckFilter init");
	}

}
