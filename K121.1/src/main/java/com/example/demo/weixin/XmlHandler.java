package com.example.demo.weixin;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

public class XmlHandler {
	private Document document;
    private Element rootElment;

	/**
	 * 将XML字符串转换成Map
	 * @param xmlStr  需要转换的文档字符串
	 * @return	解析后的Map
	 * @throws DocumentException 
	 */
	@SuppressWarnings("unchecked")
	public Map<String, String> simpleXml2Map(String xmlStr) throws DocumentException{
		Map<String, String>	resultMap = new HashMap<String, String>();
		if (StringUtils.isNotEmpty(xmlStr)) {
			document = DocumentHelper.parseText(xmlStr);
	        rootElment = document.getRootElement();
	        Iterator<Element> childEles = rootElment.elementIterator();
	        while(childEles.hasNext()){
	        	Element item = childEles.next();
	        	resultMap.put(item.getName(), item.getTextTrim());
	        }
		}
		return resultMap;
	}
	/**
	 * 将Map数据转换成XML字符串
	 * @param paramMap
	 * @return
	 */
	public String Map2Xml(Map<String, String> paramMap){
		document = DocumentHelper.createDocument();
		rootElment = document.addElement("xml");
		Iterator<String> it = paramMap.keySet().iterator();
		while (it.hasNext()) {
			String key = it.next();
			String value = paramMap.get(key);
			Element ele = rootElment.addElement(key);
			ele.setText(value);
		}
		return document.getRootElement().asXML();
	}
}
