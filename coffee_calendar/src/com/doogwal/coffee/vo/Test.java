package com.doogwal.coffee.vo;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Test {
	
	
	
	public static void main(String[] args) throws Exception{
		
		CrewCalendar cc = new CrewCalendar();
		
		cc.setName("테트틑트트트");
		
		ObjectMapper mapper = new ObjectMapper();
		
		String json = mapper.writeValueAsString(cc);		
		
		System.out.println(json);
	}

}
