package com.doogwal.model1.listener;


import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.doogwal.coffee.util.FileCopyUtil;


@WebListener
public class FileCopyListener implements ServletContextListener{

	// 서버가 꺼질 때
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
		ServletContext application =  sce.getServletContext();
		
		String uploadPath = application.getRealPath("upload/");
		String profilePath = application.getRealPath("profile/");
		
		File directory = new File("D:/backup/upload/");
		
		if(!directory.exists()) {
			directory.mkdirs();
		}
		
		System.out.println(directory.toString()+File.separator);
		
		FileCopyUtil.copy(uploadPath, directory.toString()+File.separator);
		
		directory = new File("D:/backup/profile/");
		
		if(!directory.exists()) {
			directory.mkdirs();
		}
		
		System.out.println(directory.toString()+File.separator);
		
		FileCopyUtil.copy(profilePath, directory.toString()+File.separator);
		
	}

	// 서버가 켜질때
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		ServletContext application =  sce.getServletContext();
		
		System.out.println("후후후후");
		
		String uploadPath = application.getRealPath("upload/");
		String profilePath = application.getRealPath("profile/");
		
		File directory = new File("D:/backup/upload/");
		
		if(!directory.exists()) {
			directory.mkdirs();
		}
		
		FileCopyUtil.copy(directory.toString()+File.separator, uploadPath);
		
		directory = new File("D:/backup/profile/");
		
		if(!directory.exists()) {
			directory.mkdirs();
		}
		FileCopyUtil.copy(directory.toString()+File.separator, profilePath);
		
	}

}
