package com.example.demo.before.controller.api;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.MDAO;
import com.example.demo.entity.MsgBean;
import com.example.demo.entity.Xuehanyu;
import com.example.demo.entity.Xuehanyucategory;
import com.example.demo.entity.Xuehanyudetail;

@Component
@Controller
@RequestMapping("api")
public class XueHanYuController {
	@Autowired
	private MDAO mdao;
	/**
	 * getXHYcategory
	 * 得到学汉语的分类
	 */
	@RequestMapping("getXHYcategory")
	@ResponseBody
	public MsgBean getXHYcategory() {
		MsgBean msgBean;
		try {
			List<Xuehanyu> xList=mdao.getAllXuehanyu();
			Map<String, List<Xuehanyu>> xMap=new Hashtable<String, List<Xuehanyu>>();
			List<Xuehanyu> c1=new ArrayList<Xuehanyu>();
			List<Xuehanyu> c2=new ArrayList<Xuehanyu>();
			List<Xuehanyu> c3=new ArrayList<Xuehanyu>();
			List<Xuehanyu> c4=new ArrayList<Xuehanyu>();
			for(Xuehanyu x:xList) {
				if(x.getId()<13) {
					c1.add(x);
					c2.add(x);
				}else if(x.getId()<83) {
					c2.add(x);
				}else if(x.getId()<163) {
					c3.add(x);
				}else {
					c4.add(x);
				}
			}
			xMap.put("外主类", c1);//刚进入学汉语显示的标签
			xMap.put("主类", c2);//选择标签第一栏
			xMap.put("作者", c3);
			xMap.put("朝代", 	c4);
			msgBean=MsgBean.success();
			msgBean.add("xMap", xMap);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 得到该类别下的所有小标题
	 * getXHYtitle
	 */
	@RequestMapping("getXHYtitle")
	@ResponseBody
	public MsgBean getXHYtitle(int cid) {
		MsgBean msgBean;
		try {
			List<Xuehanyucategory> xcList=mdao.getXCbyId(cid);
			msgBean=MsgBean.success();
			msgBean.add("xcList", xcList);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * getXHYdetail
	 * 得到详情页
	 */
	@RequestMapping("getXHYdetail")
	@ResponseBody
	public MsgBean getXHYdetail(int id) {
		MsgBean msgBean;
		try {
			Xuehanyudetail xd=mdao.getXDbyId(id);
			msgBean=MsgBean.success();
			msgBean.add("xd", xd);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 模糊搜索古诗词
	 * getXHYbyCon
	 */
	@RequestMapping("getXHYbyCon")
	@ResponseBody
	public MsgBean getXHYbyCon(int pageNum,String con) {
		MsgBean msgBean;
		try {
			int pageSize=15;
			int totalCount=mdao.getXHYCount(con);
			int pageCount=(totalCount+pageSize-1)/pageSize;
			List<Xuehanyudetail> xdList=mdao.getXDList(con,(pageNum-1)*pageSize,pageSize);
			msgBean=MsgBean.success();
			msgBean.add("xdList", xdList);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	
}
