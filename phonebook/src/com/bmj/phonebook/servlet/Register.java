package com.bmj.phonebook.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bmj.phonebook.dao.PhonebookDAO;
import com.bmj.phonebook.vo.Phone;

@WebServlet("/register.bmj")
public class Register extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 필터사용하기 때문에 POst방식의 한글처리 필요없음
		String name = req.getParameter("name");
		String phone1 = req.getParameter("phone1");
		String phone2 = req.getParameter("phone2");
		String phone3 = req.getParameter("phone3");
		String year= req.getParameter("year");
		String month= req.getParameter("month");
		String date = req.getParameter("date");
		String genderStr= req.getParameter("gender");
		
		// 형변환
		String phoneNum = phone1 + phone2 + phone3;
		Date birthDate = Date.valueOf(year+"-"+month+"-"+date);
		char gender = genderStr.charAt(0);
		//System.out.println(name + phone + date + gender);
		Phone phone = new Phone(name, phoneNum, gender, birthDate);
		int result = PhonebookDAO.insert(phone);
		if(result == 1) {
			//HttpSession 객체를 얻어옴
			HttpSession session = req.getSession();
			
			session.setAttribute("msg", phone.getName()+"님이 전화번호에 잘 등록되었습니다.");
		}
		resp.sendRedirect("/index.jsp");
	}
	
}
