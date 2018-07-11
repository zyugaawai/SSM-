package cn.tf.ecps.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletResponse;

public class ECPSUtil {
	
	
		public static String readProp(String key){
			Properties prop = new Properties();
			
			InputStream in = ECPSUtil.class.getClassLoader().getResourceAsStream("ecps.properties");
			String value = null;
			try {
				prop.load(in);
				value = prop.getProperty(key);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return value;
			
		}
		
		public static void printJSON(String result,HttpServletResponse response){
			response.setCharacterEncoding("UTF-8");
			response.setContentType("html/text;charset=UTF-8");
			try {
				response.getWriter().write(result);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		
	}






