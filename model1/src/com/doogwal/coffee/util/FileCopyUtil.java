package com.doogwal.coffee.util;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class FileCopyUtil {
	
	
	public static boolean copy(String start, String end)  {
		File file = new File(start);
		
		if(file.isDirectory()) {
			File[] files = file.listFiles();
			
			for (File file2 : files) {
				try {
					FileInputStream fis =
						       new FileInputStream(file2);
					
					System.out.println(file2.getName());

						FileOutputStream fos =
						       new FileOutputStream(end+file2.getName());
						//데이터 저장
						int size = 0;

						byte[] values = new byte[4096];

						while((size=fis.read(values))!=-1) {
						   fos.write(values,0,size);
						}
						fis.close();
						fos.close();
						
				} catch (Exception e) {
					e.printStackTrace();
					return false;
				}
			}
			return true;
		}else {
			return false;
		}
	}

}
