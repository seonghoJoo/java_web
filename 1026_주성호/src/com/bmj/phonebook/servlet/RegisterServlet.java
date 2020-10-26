package com.bmj.phonebook.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.phonebook.dao.PhonebookDAO;
import com.bmj.phonebook.vo.Phone;

@WebServlet("/register.bmj")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		//입력받기
		String name = req.getParameter("name");
		String phone1 = req.getParameter("phone1");
		String phone2 = req.getParameter("phone2");
		String phone3 = req.getParameter("phone3");
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String day = req.getParameter("date");
		String genderStr = req.getParameter("gender");
		System.out.println(year + month + day);
		
		//형 변환
		Date birthDate = Date.valueOf(year+"-"+month+"-"+day);
		char gender = genderStr.charAt(0);
		String phoneNumber = phone1+phone2+phone3;
		
		Phone phone = new Phone(name, phoneNumber, gender, birthDate);
		System.out.println(name + phoneNumber + gender + birthDate);
		// insert 실행
		int result = PhonebookDAO.insert(phone);
		System.out.println("POST /register.bmj  Phonebook.insert(phone)"+result + "개 insert 되었습니다.");
		resp.sendRedirect("/index.jsp");
		
	}
	
}
