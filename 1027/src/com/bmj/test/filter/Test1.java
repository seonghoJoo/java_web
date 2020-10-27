package com.bmj.test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

// Filter 메소드가 가진 추상메서드를 구현하지 않아서
public class Test1 implements Filter{

	public Test1() {
		System.out.println("Test1 태어났어요");
	}
	// 기본생성자 -> init -> 작동시 doFilter -> 서버꺼지면 destroy
	
	@Override
	public void destroy() {
		System.out.println("test1 죽었어유 ㅜㅡㅜ");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		
		System.out.println("test1 전처리!!");
		
		// a.jsp 호출
		chain.doFilter(request, response);
		
		System.out.println("test1 후처리!!");
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("test1 준비중~");
	}
	
}
