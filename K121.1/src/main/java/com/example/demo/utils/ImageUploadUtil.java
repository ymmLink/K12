package com.example.demo.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;

import org.apache.commons.lang3.StringUtils;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.web.multipart.MultipartFile;


public class ImageUploadUtil {
	private static String VIEW_PATH="/images";
	private static String DEFAULT_PATH="c://images";
	//文件上传
	//filePath==null 默认路径c://images/yyyy/MM/dd
	//fileName==null 默认文件名  文件名+HHmmssSSS
	/**
	 * @param file          上传的文件
	 * @param filePath		文件地址
	 * @param fileName		文件名称
	 * @return
	 * @throws IOException
	 */
	public static String upload(MultipartFile file,String filePath,String fileName) throws IOException{
		//文件名
		String realName = file.getOriginalFilename();
		//路径
		String realPath;
		//后缀
		String suffix = getSuffix(realName);
		//前缀
		String prefix;
		
		
		if(!StringUtils.isNoneBlank(fileName)){
			prefix = getPrefix(realName)+createFilePath1();
		}else{
			/*prefix = fileName;*/
			prefix = fileName + CommonUtil.getNonceStr(5) + createFilePath1();
		}
		
		if(!StringUtils.isNoneBlank(filePath)){
			realPath = DEFAULT_PATH + createFilePath();
		}else{
			realPath = filePath;
		}
		
		
		File f = new File(realPath);
		if(!f.exists()){
			f.mkdirs();
		}
		
		
		String completePath = realPath + "/" + prefix + "." + suffix;
		String returnStr = completePath.replace(DEFAULT_PATH, VIEW_PATH);
		
		
		InputStream is = null;
		FileOutputStream fos = null;
		
		
		
		try {
			is = file.getInputStream();
			fos = new FileOutputStream(new File(completePath));
			IOUtils.copy(is, fos);
		}finally {
			if(is!=null){
				is.close();
			}
			if(fos!=null){
				fos.close();
			}
		}
		
		
		return returnStr;
	}
	
	
	
	// 文件下载
	public static HttpServletResponse download(String filePath,HttpServletResponse resp,String downloadName) throws IOException {
		String realPath = getRealPath(filePath);
		String fileName=getFileName(filePath);
		String realDownloadName=fileName;
		
		if(downloadName!=null){
			String suffix=getSuffix(filePath);
			downloadName=downloadName+suffix;
		}
			
		
		FileInputStream fis=null;
		ServletOutputStream sos = null;
		try {
			resp.setHeader("content-disposition", "attachment;filename="+realDownloadName);
			fis=new FileInputStream(new File(realPath));
			sos = resp.getOutputStream();
			IOUtils.copy(fis, sos);
		} finally {
			if (fis != null) {
				fis.close();
			}
		}

		return resp;
	}
	
	//转真实路径
	public static String getRealPath(String path){
		String realPath = path.replace(VIEW_PATH, DEFAULT_PATH);
		return realPath;
		
	}
	
	//获取后缀
	public static String getSuffix(String fileName){
		String suffix=null;
		int position = fileName.lastIndexOf(".");
		if(position!=-1){
			suffix=fileName.substring(position+1);
		}
		
		return suffix;
	}
	
	//获取前缀
	public static String getPrefix(String fileName){
		String prefix=null;
		int position = fileName.lastIndexOf(".");
		if(position!=-1){
			prefix=fileName.substring(0,position);
		}
		
		return prefix;
	}
	
	
	//由路径获取文件名
	public static String getFileName(String path){
		String fileName=null;
		int position = path.lastIndexOf("/");
		if(position!=-1){
			fileName=path.substring(position);
		}
		return fileName;
	}
	
	//生成路径
	public static String createFilePath(){
		String thisTime=null;
		SimpleDateFormat sdf=new SimpleDateFormat("/yyyy/MM/dd");
		thisTime=sdf.format(System.currentTimeMillis());
		return thisTime;
	}
	//生成路径
	public static String createFilePath1() {
		String thisTime = null;
		SimpleDateFormat sdf = new SimpleDateFormat("HHmmssSSS");
		thisTime = sdf.format(System.currentTimeMillis());
		return thisTime;
	}
	
	//删除文件
	public static boolean deleteFile(String str) {
		File f=new File(str.replace(VIEW_PATH,DEFAULT_PATH)); 
		boolean b=true;
		if(f.exists()){
			b = f.delete();
		}
		return b;
	}
}
