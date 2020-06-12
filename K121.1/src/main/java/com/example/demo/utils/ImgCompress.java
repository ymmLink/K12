package com.example.demo.utils;

import java.awt.Color;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;

import javax.imageio.ImageIO;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnails;  
/** 
 * 图片压缩处理 
 * 详情 https://rensanning.iteye.com/blog/1545708
 */  
public class ImgCompress {  
	private static String VIEW_PATH="/images";
	private static String DEFAULT_PATH="c://images";
	
	/**
	 * @param file   上传的文件
	 * @param b		  压缩的比例
	 * @return
	 */
	public String Compress(@RequestParam("file")MultipartFile file,Double b) {
		//文件名
		String realName = file.getOriginalFilename();
		//路径
		String realPath;
		//后缀
		String suffix = getSuffix(realName);
		System.err.println(suffix);
		//前缀
		String prefix = CommonUtil.getNonceStr(5) + createFilePath1();
		realPath = DEFAULT_PATH + createFilePath();
		File f = new File(realPath);
		if(!f.exists()){
			f.mkdirs();
		}
		String completePath = realPath + "/" + prefix + "." + suffix;
		String returnStr = completePath.replace(DEFAULT_PATH, VIEW_PATH);
		File dest = new File(completePath); // 保存位置
		InputStream is =null;
		try {
			BufferedImage bi=ImageIO.read(file.getInputStream());
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			ImageIO.write(bi,suffix , os);
			is=new ByteArrayInputStream(os.toByteArray());
			Thumbnails.of(is).scale(b).toFile(completePath);
		} catch (IOException e) {
			try {
				// 失败了再用springmvc自带的方式
				file.transferTo(dest);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}finally {
			if(is!=null){
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return returnStr;
	}
	/**
	 * @param file   上传的文件
	 * @param b		  压缩的比例
	 * @return
	 */
	public String CompressMini(@RequestParam("file")MultipartFile file,Double b) {
		//文件名
		String realName = file.getOriginalFilename();
		//路径
		String realPath;
		//后缀
		//String suffix = getSuffix(realName);
		String suffix="jpg";
		System.err.println(suffix);
		//前缀
		String prefix = CommonUtil.getNonceStr(5) + createFilePath1();
		realPath = DEFAULT_PATH + createFilePath();
		File f = new File(realPath);
		if(!f.exists()){
			f.mkdirs();
		}
		String completePath = realPath + "/" + prefix + "." + suffix;
		String returnStr = completePath.replace(DEFAULT_PATH, VIEW_PATH);
		String miniCompletePath=realPath + "/" + prefix + "mini." + suffix;
		String miniReturnStr=miniCompletePath.replace(DEFAULT_PATH, VIEW_PATH);
		File dest = new File(completePath); // 保存位置
		File miniDest=new File(miniCompletePath); // 保存位置
		InputStream is =null;
		InputStream miniIs=null;
		try {
			//原图
			BufferedImage bi=ImageIO.read(file.getInputStream());	
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			ImageIO.write(bi,suffix , os);
			is=new ByteArrayInputStream(os.toByteArray());
			int width=bi.getWidth();
			int height=bi.getHeight();
//			if(width>800) {
//				double scaleb=(double)800/(double)width;
//				Thumbnails.of(is).scale(scaleb).toFile(completePath);
//			}else {
//				Thumbnails.of(is).scale(b).toFile(completePath);
//			}
			Thumbnails.of(is).scale(b).toFile(completePath);
			//缩略图
			int minValue=0; 
			if(width>=height) {
				minValue=height;
				bi=bi.getSubimage((width-height)/2, 0, minValue, minValue);
			}else {
				minValue=width;
				bi=bi.getSubimage(0, 0, minValue, minValue);
			}
			double minib=(double)160/(double)minValue;
			ByteArrayOutputStream minios = new ByteArrayOutputStream();
			ImageIO.write(bi,suffix , minios);
			miniIs=new ByteArrayInputStream(minios.toByteArray());
			Thumbnails.of(miniIs).scale(minib).toFile(miniCompletePath);
		} catch (IOException e) {
			try {
				//System.out.println(11111);
				// 失败了再用springmvc自带的方式
				file.transferTo(dest);
				file.transferTo(miniDest);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			if(is!=null){
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(miniIs!=null){
				try {
					miniIs.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return returnStr;
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
	//获取前缀
	public static String getPrefix(String fileName){
		String prefix=null;
		int position = fileName.lastIndexOf(".");
		if(position!=-1){
			prefix=fileName.substring(0,position);
		}
		
		return prefix;
	}
	//去水印
	public static void removeWaterMark(String filePath,Color color) {
		File file=new File("c:/"+filePath);
		int ocr=color.getRGB();
		try {
			BufferedImage img=(BufferedImage)ImageIO.read(file);
			for(int x=0;x<img.getWidth();x++) {
				for(int y=0;y<img.getHeight();y++) {
					int icr=img.getRGB(x, y);
					int ncr=new Color(255, 255, 255).getRGB();
					if(icr==ocr) {
						img.setRGB(x, y, ncr);
					}
				}
			}
			String fileType=filePath.substring(filePath.lastIndexOf(".") + 1, filePath.length());
			ImageIO.write(img, fileType, file);//写出
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}  