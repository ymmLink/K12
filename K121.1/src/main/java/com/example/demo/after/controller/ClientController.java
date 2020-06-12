package com.example.demo.after.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.dao.MDAO;
import com.example.demo.entity.FeedBack;
import com.example.demo.entity.Material;
import com.example.demo.entity.MsgBean;
import com.example.demo.utils.MyUtil;

@Component
@Controller
@RequestMapping("admin")
public class ClientController {
	@Autowired
	private MDAO mdao;
	/**
	 * 跳转用户反馈
	 * toFeedBack
	 */
	@RequestMapping("toFeedBack")
	public String toFeedBack(ModelMap modelMap) {
		List<FeedBack> fbList=mdao.getAllFB();
		modelMap.addAttribute("fbList",fbList);
		return "/admin/feedback/feedback";
	}
	/**
	 * 跳转动态管理
	 * toMaterialPage
	 */
	@RequestMapping("toMaterialPage")
	public String toMaterialPage(String pageNum,String date,ModelMap modelMap) {
		if(!MyUtil.isnull(date)) {
			date=date.split("/")[0]+"-"+date.split("/")[1]+"-"+date.split("/")[2];
		}
		int pageSize=20;
		int pagenum;
		if(MyUtil.isnull(pageNum)) {
			pagenum=1;
		}else {
			pagenum=Integer.parseInt(pageNum);
		}
		int pageStar=(pagenum-1)*pageSize;
		Material material=new Material();
		material.setPublishDate(date);
		int count=mdao.getMaterialCount(material);
		int pagecount=(count+pageSize-1)/pageSize;
		List<Material> mList=mdao.getMaterialPage(material,pageStar,pageSize);
		modelMap.addAttribute("mList", mList);
		modelMap.addAttribute("pagecount", pagecount);
		modelMap.addAttribute("pageNum", pagenum);
		return "/admin/material/materialPage";
	}
	/**
	 * passMaterial
	 * 通过审核动态
	 */
	@RequestMapping("passMaterial")
	@ResponseBody
	public MsgBean passMaterial(int id,int type) {
		MsgBean msgBean;
		try {
			mdao.setMaterialState(id,type);
			msgBean=MsgBean.success();
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	
}