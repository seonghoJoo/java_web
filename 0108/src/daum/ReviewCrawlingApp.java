package daum;

import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Scanner;

import com.fasterxml.jackson.databind.ObjectMapper;

import vo.Comment;

public class ReviewCrawlingApp {
	
	public static void main(String[] args) throws Exception {
		
		//서버 연결
		URL url = new URL("https://comment.daum.net/apis/v1/posts/149655001/comments?parentId=0&offset=0&limit=10&sort=RECOMMEND&isInitial=true&hasNext=true");
		
		//스트림 연결
		InputStream in = url.openStream();
		
		// 우리한테 필요한것이 무엇일까? -> 전처리
		ObjectMapper om = new ObjectMapper();

		Comment[] comments = om.readValue(in, Comment[].class);
		
		
		for(Comment comment : comments) {
			System.out.println(comment.getContent());
		}//for end
		
		
		
	}//main() end

}//ReviewCrawlingApp end


