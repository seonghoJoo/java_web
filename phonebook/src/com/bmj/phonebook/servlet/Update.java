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

@WebServlet("/update.bmj")
public class Update extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 필터 때문에 한글처리 필요없음
		String noStr = req.getParameter("no");
		String name = req.getParameter("name");
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String date = req.getParameter("date");
		String phone1 = req.getParameter("phone1");
		String phone2 = req.getParameter("phone2");
		String phone3 = req.getParameter("phone3");
		String genderStr= req.getParameter("gender");
		
		// 형변환
		String phoneNum = phone1+ phone2 + phone3;
		Date birthDate = Date.valueOf(year+"-" + month+"-" + date);
		char gender = genderStr.charAt(0);
		int no = Integer.parseInt(noStr);
		int result = PhonebookDAO.update(new Phone(no,name, phoneNum, gender, birthDate));
		if(result==1) {
			HttpSession session = req.getSession();
			session.setAttribute("msg", name+"님을 변경하였습니다.");
		}
		resp.sendRedirect("/index.jsp");
		
	}
}
