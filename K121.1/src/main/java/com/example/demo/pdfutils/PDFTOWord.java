package com.example.demo.pdfutils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
/**
 * PDF转成成word文件，识别不了PDF中的图片，只识别字体，且格式全清空，所有字体一样大小
 * @author xmyun
 *
 */
public class PDFTOWord{
	public static void main(String[] args){
		try{
			pdf2word("C:/114.pdf");
		}catch (IOException e){
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * @param pdfFile   PDF文件地址
	 * @throws IOException
	 */
	public static void pdf2word(String pdfFile) throws IOException{
		PDDocument doc = PDDocument.load(new File(pdfFile));
		int pagenumber = doc.getNumberOfPages();
		pdfFile = pdfFile.substring(0, pdfFile.lastIndexOf("."));
		String fileName = pdfFile + ".doc";
		File file = new File(fileName);
		if (!file.exists()){
			file.createNewFile();
		}
		FileOutputStream fos = new FileOutputStream(fileName);
		Writer writer = new OutputStreamWriter(fos, "UTF-8");
		PDFTextStripper stripper = new PDFTextStripper();
		stripper.setSortByPosition(true);// 排序
		stripper.setStartPage(1);// 设置转换的开始页
		stripper.setEndPage(pagenumber);// 设置转换的结束页
		stripper.writeText(doc, writer);
		writer.close();
		doc.close();
		System.out.println("pdf转换word成功！");
	}
}