package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

// 필터를 전부 적용한다.
@WebFilter("/*")
public class EncodingFilter implements Filter{
	@Override
	public void destroy() {
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// POST 방식의 한글처리
		request.setCharacterEncoding("UTF-8");
		System.out.println("EncodingFilter doFilter");
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("EncodingFilter init!");
	}
	

}
