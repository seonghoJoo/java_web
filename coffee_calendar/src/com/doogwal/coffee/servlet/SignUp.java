package com.doogwal.coffee.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doogwal.coffee.dao.UsersDAO;
import com.doogwal.coffee.vo.User;


@WebServlet("/signUp.do")
public class SignUp extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//한글처리 필터로
		//POST방식의 한글처리
				req.setCharacterEncoding("UTF-8");
		
		String userName = req.getParameter("userName");
		String userEmail = req.getParameter("userEmail");
		String userPassword = req.getParameter("userPassword");
		String userPhoneNumber = req.getParameter("userPhoneNumber");
		String userGenderStr = req.getParameter("checkedGender");
		String userAddress = req.getParameter("userAddress");
		String emailReceptionStr = req.getParameter("chk_email_reception");
		String smsReceptionStr = req.getParameter("chk_sms_reception");
		char userGender = userGenderStr.charAt(0);//형변환
		char emailReception = emailReceptionStr.charAt(0);//형변환
		char smsReception = smsReceptionStr.charAt(0);//형변환
		
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String date = req.getParameter("date");
		//Date형으로 형변환
		Date userBirthDate = 
			Date.valueOf(year+'-'+month+'-'+date);
		
		
		
		User newUser = 
				new User(3018,userGender,emailReception,smsReception,userName,
						userPassword,userPhoneNumber,
						userAddress,userEmail,"temporaryEmailAuthorization",userBirthDate);
		
		int result = UsersDAO.insert(newUser);
		
		//req.getSession().setAttribute("msg", "회원가입이 되었습니다~!");
		
		resp.sendRedirect("/index.jsp");
		
		System.out.println(userGender);
		System.out.println(emailReception);
		System.out.println(smsReception);
		System.out.println(userName);
		System.out.println(userPassword);
		System.out.println(userPhoneNumber);
		System.out.println(year);
		System.out.println(month);
		System.out.println(date);
		System.out.println(userAddress);
		System.out.println(userEmail);
		System.out.println(userBirthDate);
		System.out.println(result);
		
	}//doPost() end

}
