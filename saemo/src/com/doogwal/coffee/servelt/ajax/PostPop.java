package com.doogwal.coffee.servelt.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doogwal.coffee.dao.CrewMembersDAO;
import com.doogwal.coffee.dao.CrewsDAO;
import com.doogwal.coffee.dao.PostImgsDAO;
import com.doogwal.coffee.dao.PostsDAO;
import com.doogwal.coffee.vo.CrewMember;
import com.doogwal.coffee.vo.Post;
import com.doogwal.coffee.vo.PostImg;

@WebServlet(value="/ajax/match_history.json")
public class PostPop extends HttpServlet{

	
}
