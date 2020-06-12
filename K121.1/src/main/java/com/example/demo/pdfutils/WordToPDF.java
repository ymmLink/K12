package com.example.demo.pdfutils;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
 
import org.apache.commons.collections.MapUtils;
import org.apache.poi.xwpf.converter.pdf.PdfConverter;
import org.apache.poi.xwpf.converter.pdf.PdfOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
 
import fr.opensagres.xdocreport.utils.StringUtils;
 
/**
 * Word文档转PDF文档
 * @author Rocca
 * 如果直接用这个方法会爆控指针异常，这是jar包里面的代码引起的，需要重写RunUnderlineValueProvider类，在
 * org.apache.poi.xwpf.converter.core.styles.run包里面，直接复制
 *
 */
public class WordToPDF {
 
    protected static final Logger logger = LoggerFactory.getLogger(WordToPDF.class);
     
    public static void main(String[] args) throws Exception{
        String filepath = "C:/desc.doc";
        String outpath = "C:/115.pdf"; 
        wordConverterToPdf(filepath, outpath);
    }
 
    /**
     * 将word文档， 转换成pdf, 中间替换掉变量
     * @param filepath 源为word文档， 必须为docx文档
     * @param outpath 目标输出
     * @throws Exception
     */
    public static void wordConverterToPdf(String filepath, String outpath) throws Exception {
    	
    	 InputStream source = new FileInputStream(filepath);
         OutputStream target = new FileOutputStream(outpath);
         Map<String, String> params = new HashMap<String, String>();
         PdfOptions options = PdfOptions.create();
    	
         XWPFDocument doc = new XWPFDocument(source);
         paragraphReplace(doc.getParagraphs(), params);
         for (XWPFTable table : doc.getTables()) {
           for (XWPFTableRow row : table.getRows()) {
               for (XWPFTableCell cell : row.getTableCells()) {
                   paragraphReplace(cell.getParagraphs(), params);
               }
           }
       }
       PdfConverter.getInstance().convert(doc, target, options);
       
       source.close();
       target.close();
    }
     
    /** 替换段落中内容 */
    private static void paragraphReplace(List<XWPFParagraph> paragraphs, Map<String, String> params) {
        if (MapUtils.isNotEmpty(params)) {
            for (XWPFParagraph p : paragraphs){
                for (XWPFRun r : p.getRuns()){
                    String content = r.getText(r.getTextPosition());
                    logger.info(content);
                    if(StringUtils.isNotEmpty(content) && params.containsKey(content)) {
                        r.setText(params.get(content), 0);
                    }
                }
            }
        }
    }
     
}
