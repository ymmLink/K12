package com.example.demo.pdfutils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.itextpdf.awt.geom.Rectangle2D.Float;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.ImageRenderInfo;
import com.itextpdf.text.pdf.parser.PdfReaderContentParser;
import com.itextpdf.text.pdf.parser.RenderListener;
import com.itextpdf.text.pdf.parser.TextRenderInfo;

/**
 * 在PDF文件中查询某个字符或者字的位置所在，以便插入图片或者字体。
 * @author xmyun
 *
 */
public class PDFFontLocation{
	private static Integer i=1;
	/**
	 * @param filePath   PDF文件
	 * @param KEY_WORD	  某个字符或者字，最好用特殊符号，不要跟文本里面的内容重复，不然他会把文本里面重复的位置也一并查询出来。
	 * 					  这有时可以查多个字符或者字，但有时却只能查单个字符或者字，所以确保万一还是使用特殊符号。
	 * @param page		这是从第几页开始，默认第一页开始
	 * @return			返回  x，y，page  x和y是经纬度  page是第几页
	 */
    public static List<float[]> getKeyWords(String filePath,String KEY_WORD,Integer page) {
    	List<float[]> arrays = new ArrayList<float[]>();
        try {
        	PdfReader pdfReader = new PdfReader(filePath);
			int pageNum = pdfReader.getNumberOfPages();
            PdfReaderContentParser pdfReaderContentParser = new PdfReaderContentParser(pdfReader);
            if(page==null) {
            	page=1;
            }
            for (i = page; i <=pageNum; i++) {
                pdfReaderContentParser.processContent(i, new RenderListener() {
                    @Override
                    public void renderText(TextRenderInfo textRenderInfo) {
                        String text = textRenderInfo.getText(); // 整页内容
                        if (null != text && text.contains(KEY_WORD)) {
                            Float boundingRectange = textRenderInfo
                                    .getBaseline().getBoundingRectange();
                            float[] resu = new float[3];
                            resu[0] = boundingRectange.x;
                            resu[1] = boundingRectange.y;
                            resu[2] = i;
                            arrays.add(resu);
                        }
                    }
                    @Override
                    public void renderImage(ImageRenderInfo arg0) {
                    }
                    @Override
                    public void endTextBlock() {
                    }
                    @Override
                    public void beginTextBlock() {
                    }
                });
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return arrays;
    }
  
    public static void main(String[] args) {
		try {
	        List<float[]> ff = getKeyWords("/113.pdf",":",1);
	        for(float[] f : ff){
	            System.out.println(f[0]+"----"+f[1]+"----"+f[2]);
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
     }
}