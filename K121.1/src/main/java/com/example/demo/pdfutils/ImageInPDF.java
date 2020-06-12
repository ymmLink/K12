package com.example.demo.pdfutils;

import java.io.FileOutputStream;
import java.util.List;

import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
/**
 * 在指定的位置插入图片，位置根据PDFFontLocation类来查找。
 * @author xmyun
 *
 */
public class ImageInPDF {
 /**
  * 
  * @param filePath   PDF文件地址
  * @param filePath1	合成的PDF文件地址
  * @param imageName	图片地址
  * @param ff			在PDF哪个位置插入
  */
	public static void ImageToPDF(String filePath,String filePath1,String imageName,List<float[]> ff){
		//指定将图片拼接到PDF
  		try {
  			PdfReader reader = new PdfReader(filePath);
  			PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(filePath1));//生成的PDF 路径
  			int pagecount= reader.getNumberOfPages();
  			if(ff.size()>0) {
  				for(float[] f:ff) {
  					PdfContentByte overContent = stamper.getOverContent((int)f[2]);
  		  			//添加图片
  		  			Image image = Image.getInstance(imageName);//图片名称
  		  			image.scaleAbsolute(100, 50);
  		  			
  		  			int x=(int)(f[0]);
  		  			int y=(int)(f[1]);
  		  			image.setAbsolutePosition(x,y);//左边距、底边距
  		  			overContent.addImage(image);
  		  			overContent.stroke();
  				}
  			}
  			stamper.close();
  			reader.close();
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
	}
}
