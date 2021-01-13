package collection;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class MapEx1 {

	public static void main(String[] args) {
		
		/*
		 * 		Map은 key와 value로 구성
		 * 		key의 자료형은 : Object형
		 * 		value의 자료형 : Object형
		 * 		
		 * 		제네릭 : 형을 고정시켜 버리는것
		 * 
		 * */
		
		//기존 맵
		// Map<Object,Object> map
		
		// 제네릭을 지정(key-> String value->Object) Session이네! 비슷~
		Map<String,Object> map = new ConcurrentHashMap();
		
		map.put("name","주성호");
		String name = (String)map.get("name");

		// 암시적 객체생성
		map.put("age",25);
		int age = (Integer)map.get("age");
		
		// 제네릭을 지정(key-> Integer value->Object) List네!
		//Map<Integer,Object> map
		
		// 제네릭을 지정(key-> Integer value->Object) 파라미터네!
		//Map<String,String> map
		
	}//main() end

}//MapEx1 end
