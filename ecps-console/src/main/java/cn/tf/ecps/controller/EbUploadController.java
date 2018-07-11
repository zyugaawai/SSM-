package cn.tf.ecps.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;

import cn.tf.ecps.utils.ECPSUtil;
import cn.tf.ecps.utils.UploadResponse;

@Controller
@RequestMapping("/upload")
public class EbUploadController {
	
	//普通的图片上传
	@RequestMapping("/uploadPic.do")
	public void uploadPic(HttpServletRequest request,PrintWriter out, String lastPath){
		
		try {
			//强制转换request
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
			//获得文件
			Iterator<String> iter = mr.getFileNames();
			String fileInputName = iter.next();
			MultipartFile mf = mr.getFile(fileInputName);
			//获得文件的字节数组
			byte[] byteArr = mf.getBytes();
			String fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
			Random  random = new Random();
			for(int i = 0 ; i < 3; i++){
				fileName = fileName + random.nextInt(10);
			}
			//获得原始文件名
			String oriFileName = mf.getOriginalFilename();
			String suffix = oriFileName.substring(oriFileName.lastIndexOf("."));
			//获得文件服务器的主机地址
			String filePath = ECPSUtil.readProp("FILE_PATH");
			//获得上传文件的绝对路径
			String realPath = filePath + "/upload/"+fileName + suffix;
			String relativePath = "/upload/"+fileName + suffix;

			Client client = Client.create();
			//如果更换了图片，就删除原来的
			if(StringUtils.isNotBlank(lastPath)){
				WebResource wr1 = client.resource(lastPath);
				wr1.delete();
			}
			
			
			//创建Jersey客户端
			
			WebResource wr = client.resource(realPath);
			wr.put(byteArr);
			//ajax返回多个值的时候要使用JSON
			JSONObject jo = new JSONObject();
			jo.accumulate("realPath", realPath);
			jo.accumulate("relativePath", relativePath);
			String result = jo.toString();
			out.write(result);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
		//fck的图片上传
		@RequestMapping("/uploadForFck.do")
		public void uploadForFck(HttpServletRequest request,PrintWriter out, String lastPath){
			
			try {
				//强制转换request
				MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
				//获得文件
				Iterator<String> iter = mr.getFileNames();
				String fileInputName = iter.next();
				MultipartFile mf = mr.getFile(fileInputName);
				//获得文件的字节数组
				byte[] byteArr = mf.getBytes();
				String fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
				Random  random = new Random();
				for(int i = 0 ; i < 3; i++){
					fileName = fileName + random.nextInt(10);
				}
				//获得原始文件名
				String oriFileName = mf.getOriginalFilename();
				String suffix = oriFileName.substring(oriFileName.lastIndexOf("."));
				//获得文件服务器的主机地址
				String filePath = ECPSUtil.readProp("FILE_PATH");
				//获得上传文件的绝对路径
				String realPath = filePath + "/upload/"+fileName + suffix;
				String relativePath = "/upload/"+fileName + suffix;

				Client client = Client.create();

				
				//创建Jersey客户端
				
				WebResource wr = client.resource(realPath);
				wr.put(byteArr);
				
				//创建fck的上传的响应对象
				UploadResponse ur = new UploadResponse(UploadResponse.EN_OK, realPath);
				out.print(ur);
				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

}
