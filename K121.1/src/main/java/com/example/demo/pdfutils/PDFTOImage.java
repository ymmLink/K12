package com.example.demo.pdfutils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
/**
 * pdf转成多个图片，每页一张图片，PDF上的图片清晰
 * @author Administrator
 *
 */
public class PDFTOImage {
	
	public static void main(String[] args) {
		pdfImage("C:/114.pdf","C:/1.png");
	}
	/**
	 * @param pdfFile   PDF文件地址
	 * @param outpath	图片地址
	 */
	public static void pdfImage(String pdfFile, String outpath) {
		File file = new File(pdfFile);
		try {
			PDDocument doc = PDDocument.load(file);
			PDFRenderer renderer = new PDFRenderer(doc);
			int pageCount = doc.getNumberOfPages();
			for(int i=0;i<pageCount;i++){
				BufferedImage image = renderer.renderImageWithDPI(i, 296);
				//BufferedImage image = renderer.renderImage(i, 2.5f);
				ImageIO.write(image, "PNG", new File("C:\\"+i+".png"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
