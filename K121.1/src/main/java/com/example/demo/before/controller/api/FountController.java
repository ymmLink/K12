package com.example.demo.before.controller.api;
/**
 * 
 * @author ymm
 * 发现模块下的接口
 */

import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.SpringbootExampleApplication;
import com.example.demo.dao.MDAO;
import com.example.demo.entity.GetCoinRecord;
import com.example.demo.entity.Guanzhu;
import com.example.demo.entity.Material;
import com.example.demo.entity.MsgBean;
import com.example.demo.entity.Print;
import com.example.demo.entity.Shoucang;
import com.example.demo.entity.User;
import com.example.demo.entity.Zan;
import com.example.demo.entity.vo.Materialvo;
import com.example.demo.utils.ImgCompress;
import com.example.demo.utils.TimeUtil;

@Component
@Controller
@RequestMapping("api")
public class FountController {
	@Autowired
	MDAO mdao;
	public Map<String,List<Long>> totolIdMap=new Hashtable<String,List<Long>>();
	/**
	 * 图片
	 */
	@RequestMapping("/publishMaterial")
	@ResponseBody
	public MsgBean publishMaterial(Material material,MultipartFile[] files) {
		MsgBean msgBean;
		try {
			ImgCompress compress=new ImgCompress();
			String imgPath=null;
			int i=0;
			for(MultipartFile file:files) {
				if(!file.isEmpty()) {
					String path=compress.CompressMini(file, 1.0);
					if(i==0) {
						imgPath=path+",";
					}else if(i==files.length-1){
						imgPath+=path;
					}else {
						imgPath+=path+",";
					}
				}
				i++;
			}
			if(i==1) {
				material.setImgPath(imgPath.split(",")[0]);
			}else {
				material.setImgPath(imgPath);
			}
			String sDate=TimeUtil.getThisTime();
			material.setPublishDate(sDate);
			boolean res=mdao.addMaterial(material);
			msgBean=MsgBean.success();
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 关注事件
	 * @param type 0关注，1取消关注
	 */
	@RequestMapping("guanzhu")
	@ResponseBody
	public MsgBean guanzhu(Long userId,Long guanzhuId) {
		MsgBean msgBean=new MsgBean();
		int type;
		try {
			Guanzhu gz=mdao.getGZbyuId(userId, guanzhuId);
			if(gz==null) {
				type=0;
			}else {
				type=1;
			}
			if(type==0) {
				String now=TimeUtil.getThisTime();
				Guanzhu guanzhu=new Guanzhu(Long.parseLong("0"),userId,guanzhuId,now,null,1);
				boolean re= mdao.addGuanZhu(guanzhu);
				if(re) {
					mdao.addUGZ(userId);
					mdao.addFans(guanzhuId);
					try {
						Socket socket=SpringbootExampleApplication.socketMap.get(guanzhuId.intValue()+"");
						if(socket!=null&&socket.isConnected()&&!socket.isClosed()) {	
							socket.getOutputStream().write(("followed,"+userId).getBytes());
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}else if(type==1) {
				String now=TimeUtil.getThisTime();
				boolean re=mdao.cancelGuanzhu(userId,guanzhuId,now);
				if(re) {
					mdao.substractUGZ(userId);
					mdao.substractFans(guanzhuId);
				}
			}
			gz=mdao.getGZbyuId(userId, guanzhuId);
			int state;
			if(gz==null) {
				state=0;
			}else {
				state=1;
			}
			msgBean.setCode(100);
			msgBean.setMsg("操作成功");
			msgBean.add("state", state);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean.setCode(200);
			msgBean.setMsg("操作失败");
			return msgBean;
		}
	}
	/**
	 * 收藏事件
	 * shoucang
	 */
	@RequestMapping("shoucang")
	@ResponseBody
	public MsgBean shoucang(Long mId,Long uId) {//0收藏，1取消收藏
		MsgBean msgBean;
		try {
			Shoucang osc=mdao.getSC(mId, uId);
			int type;
			if(osc==null) {
				type=0;
			}else {
				type=1;
			}
			Material m=mdao.getMById(mId);
			if(type==0) {
				String now=TimeUtil.getThisTime();
				Shoucang sc=new Shoucang();
				sc.setCreateDate(now);
				sc.setmId(mId.intValue());
				sc.setuId(uId.intValue());
				int addsc=mdao.addSC(sc);
				if(addsc>0) {
					this.addCoin(mdao.getMById(mId).getUserId().intValue(), 3);
					mdao.addMsc(mId);
					mdao.addUsc(m.getUserId());
				}
			}else if(type==1) {
				int re=mdao.removeSC(mId,uId);
				if(re>0) {
					mdao.subtractMsc(mId);
					mdao.subtractUsc(m.getUserId());
				}
			}
			osc=mdao.getSC(mId, uId);
			int state;
			if(osc==null) {
				state=0;
			}else {
				state=1;
			}
			msgBean=MsgBean.success();
			msgBean.add("state", state);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 打印事件
	 * print
	 */
	@RequestMapping("print")
	@ResponseBody
	public MsgBean print(Long mId,Long uId) {
		MsgBean msgBean;
		try {
			String now=TimeUtil.getThisTime();
			Print print=new Print();
			Material material=mdao.getMById(mId);
			print.setMid(mId.intValue());
			print.setUid(uId.intValue());
			print.setCreateDate(now);
			int re=mdao.savePrint(print);
			if(re>0) {
				this.addCoin(mdao.getMById(mId).getUserId().intValue(), 5);
				mdao.addMPrint(mId);
				mdao.addUPrint(material.getUserId());
			}
			msgBean=MsgBean.success();
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 点赞事件
	 * zan
	 */
	@RequestMapping("zan")
	@ResponseBody
	public MsgBean zan(Long mId,Long uId) {//0点赞，1取消点赞
		MsgBean msgBean;
		try {
			Zan ozan=mdao.getZan(mId, uId);
			int type;
			if(ozan==null) {
				type=0;
			}else {
				type=1;
			}
			if(type==0) {
				String now=TimeUtil.getThisTime();
				Zan zan=new Zan();
				zan.setCreateDate(now);
				zan.setmId(mId.intValue());
				zan.setuId(uId.intValue());
				int addzan=mdao.addZan(zan);
				if(addzan>0) {
					this.addCoin(mdao.getMById(mId).getUserId().intValue(), 4);
					mdao.addMzan(mId);
				}
			}else if(type==1) {
				int re=mdao.removeZan(mId,uId);
				if(re>0) {
					mdao.subtractMzan(mId);
				}
			}
			ozan=mdao.getZan(mId, uId);
			int state;
			if(ozan==null) {
				state=0;
			}else {
				state=1;
			}
			msgBean=MsgBean.success();
			msgBean.add("state", state);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
		
	}
	/**
	 * 得到关注的素材(分页)
	 * getGZMaterial
	 * @param pageNum 分页从1开始
	 */
	@RequestMapping("getGZMaterial")
	@ResponseBody
	public MsgBean getGZMaterial(Long userId,int pageNum) {
		MsgBean msgBean=new MsgBean();
		try {
			int pageSize=8;
			List<User> uList=mdao.getGZUser(userId);
			System.out.println(uList);
			if(uList.size()==0) {
				msgBean=MsgBean.fail();
				msgBean.setMsg("还未关注他人！");
			}else {
				int totalCount=mdao.getGZMcount(uList);//得到关注记录数
				int pageCount=(totalCount+pageSize-1)/pageSize;
				List<Materialvo> mList=mdao.getGZMeterial(uList,(pageNum-1)*pageSize,pageSize);
				for(Materialvo m:mList) {
					User user=mdao.getUserById(m.getUserId());
					user.setPassword(null);
					Zan zan=mdao.getZan(new Long(m.getmId()),userId);
					if(zan==null) {
						m.setZanState(0);;//未点赞
					}else {
						m.setZanState(1);
					}
					Shoucang sc=mdao.getSC(new Long(m.getmId()),userId);
					if(sc==null) {
						m.setScState(0);//未点赞
					}else {
						m.setScState(1);
					}
					m.setGzState(1);
				}
				msgBean.setCode(100);
				msgBean.setMsg("操作成功");
				msgBean.add("pageCount", pageCount);
				msgBean.add("mList", mList);
			}
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean.setCode(200);
			msgBean.setMsg("操作失败");
			return msgBean;
		}
	}
	/**
	 * 得到推荐素材
	 * getTJmaterial
	 */
	@RequestMapping("getTJmaterial")
	@ResponseBody
	public MsgBean getTJmaterial(int pageNum,Long userId) {
		MsgBean msgBean;
		try {
			int totolCount=mdao.getMcount();//得到总的可见素材
			if(totolCount==0) {
				msgBean=MsgBean.fail();
				msgBean.setMsg("没有素材！");
			}else {
				int pageSize=8;
				int pageCount=(totolCount+pageSize-1)/pageSize;
				List<Long> totolId=totolIdMap.get(userId+"");
				List<Long> idList=new ArrayList<>();
				if(totolId==null||pageNum==1) {
					totolId=mdao.getMidList();//得到总素材ID
				}
				if((totolCount-(pageNum-1)*pageSize)<8) {
					pageSize=totolCount-(pageNum-1)*pageSize;
				}
				Random random=new Random();
				int tsize=totolId.size();
				for(int i=0;i<pageSize;i++) {
					int n=random.nextInt(tsize--);
					idList.add(totolId.get(n));
					totolId.remove(n);
				}
				//System.out.println(totolId);
				totolIdMap.put(userId+"", totolId);
				//System.out.println(idList);
				List<Materialvo> mList=mdao.getTJList(idList);
				for(Materialvo m:mList) {
					Guanzhu guanzhu=mdao.getGZbyuId(userId,m.getUserId());
					if(m.getUserId().longValue()==userId.longValue()){
						m.setGzState(2);;//本人发布的
					}else if(guanzhu==null){
						m.setGzState(0);;
					}else {
						m.setGzState(1);;
					}
					Zan zan=mdao.getZan(new Long(m.getmId()),userId);
					if(zan==null) {
						m.setZanState(0);;//未点赞
					}else {
						m.setZanState(1);;
					}
					Shoucang sc=mdao.getSC(new Long(m.getmId()),userId);
					if(sc==null) {
						m.setScState(0);;//未点赞
					}else {
						m.setScState(1);;
					}
				}
				msgBean=MsgBean.success();
				msgBean.add("pageCount", pageCount);
				msgBean.add("mList", mList);
			}
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 得到相应标签下的素材
	 * @param label
	 * @param pageNum
	 * @return
	 */
	@RequestMapping("getLabelMaterial")
	@ResponseBody
	public MsgBean getLabelMaterial(String label,int pageNum,Long userId) {
		MsgBean msgBean;
		try {
			int pageSize=8;
			System.out.println(label);
			int totalCount=mdao.getMcountBylabel(label);//得到记录数
			//System.out.println(totalCount);
			int pageCount=(totalCount+pageSize-1)/pageSize;
			List<Materialvo> mList=mdao.getMBylabel(label,(pageNum-1)*pageSize,pageSize);
			for(Materialvo m:mList) {
				Guanzhu guanzhu=mdao.getGZbyuId(userId,m.getUserId());
				if(m.getUserId().longValue()==userId.longValue()){
					m.setGzState(2);//本人发布的
				}else if(guanzhu==null){
					m.setGzState(0);
				}else {
					m.setGzState(1);
				}
				Zan zan=mdao.getZan(new Long(m.getmId()),userId);
				if(zan==null) {
					m.setZanState(0);//未点赞
				}else {
					m.setZanState(1);
				}
				Shoucang sc=mdao.getSC(new Long(m.getmId()),userId);
				if(sc==null) {
					m.setScState(0);//收藏
				}else {
					m.setScState(1);
				}
			}
			msgBean=MsgBean.success();
			msgBean.add("pageCount", pageCount);
			msgBean.add("mList", mList);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 得到搜索素材
	 * getSearchMaterial
	 */
	@RequestMapping("getSearchMaterial")
	@ResponseBody
	public MsgBean getSearchMaterial(String con,int pageNum,Long userId) {
		MsgBean msgBean;
		try {
			String label=null;
			if(con.equals("手帐")) {
				label="0";
			}else if(con.equals("学习")) {
				label="1";
			}else if(con.equals("日历")) {
				label="2";
			}else if(con.equals("素描")) {
				label="3";
			}else if(con.equals("表情包")) {
				label="4";
			}else if(con.equals("漫画")) {
				label="5";
			}else if(con.equals("黑白")) {
				label="6";
			}else if(con.equals("人物")) {
				label="7";
			}else if(con.equals("休闲")) {
				label="8";
			}else if(con.equals("工作")) {
				label="9";
			}else if(con.equals("生活")) {
				label="10";
			}else if(con.equals("其他")) {
				label="11";
			}
			int pageSize=8;
			//System.out.println(label);
			int totalCount=mdao.getMcountByCon(con,label);//得到记录数
			//System.out.println(totalCount);
			int pageCount=(totalCount+pageSize-1)/pageSize;
			List<Materialvo> mList=mdao.getMByCon(con,label,(pageNum-1)*pageSize,pageSize);
			for(Materialvo m:mList) {
				Guanzhu guanzhu=mdao.getGZbyuId(userId,m.getUserId());
				if(m.getUserId().longValue()==userId.longValue()){
					m.setGzState(2);//本人发布的
				}else if(guanzhu==null){
					m.setGzState(0);
				}else {
					m.setGzState(1);
				}
				Zan zan=mdao.getZan(new Long(m.getmId()),userId);
				if(zan==null) {
					m.setZanState(0);//未点赞
				}else {
					m.setZanState(1);
				}
				Shoucang sc=mdao.getSC(new Long(m.getmId()),userId);
				if(sc==null) {
					m.setScState(0);//收藏
				}else {
					m.setScState(1);
				}
			}
			msgBean=MsgBean.success();
			msgBean.add("pageCount", pageCount);
			msgBean.add("mList", mList);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 得到第二次搜索素材
	 * getSearchMaterial
	 */
	@RequestMapping("getSecondSearchMaterial")
	@ResponseBody
	public MsgBean getSearchMaterial(String con1,String con2,Long userId) {
		MsgBean msgBean;
		try {
			String label1=null;
			String label2=null;
			label1=isLabe(con1);
			label2=isLabe(con2);
//			int pageSize=8;
//			//System.out.println(label);
//			int totalCount=mdao.getMcountByCon(con,label);//得到记录数
//			//System.out.println(totalCount);
//			int pageCount=(totalCount+pageSize-1)/pageSize;
			List<Materialvo> mList=mdao.getSMByCon(con1,label1,con2,label2);
			for(Materialvo m:mList) {
				Guanzhu guanzhu=mdao.getGZbyuId(userId,m.getUserId());
				if(m.getUserId().longValue()==userId.longValue()){
					m.setGzState(2);//本人发布的
				}else if(guanzhu==null){
					m.setGzState(0);
				}else {
					m.setGzState(1);
				}
				Zan zan=mdao.getZan(new Long(m.getmId()),userId);
				if(zan==null) {
					m.setZanState(0);//未点赞
				}else {
					m.setZanState(1);
				}
				Shoucang sc=mdao.getSC(new Long(m.getmId()),userId);
				if(sc==null) {
					m.setScState(0);//收藏
				}else {
					m.setScState(1);
				}
			}
			msgBean=MsgBean.success();
			msgBean.add("mList", mList);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	public String isLabe(String con) {
		String label=null;
		if(con.equals("手帐")) {
			label="0";
		}else if(con.equals("学习")) {
			label="1";
		}else if(con.equals("日历")) {
			label="2";
		}else if(con.equals("素描")) {
			label="3";
		}else if(con.equals("表情包")) {
			label="4";
		}else if(con.equals("漫画")) {
			label="5";
		}else if(con.equals("黑白")) {
			label="6";
		}else if(con.equals("人物")) {
			label="7";
		}else if(con.equals("休闲")) {
			label="8";
		}else if(con.equals("工作")) {
			label="9";
		}else if(con.equals("生活")) {
			label="10";
		}else if(con.equals("其他")) {
			label="11";
		}
		return label;
	}
	public boolean checkRandom(Long n,List<Long> index) {
		for(Long l:index) {
			if(n==l) {
				return true;
			}
		}
		return false;
	}
	public boolean addCoin(int uid,int type) {
		String today=TimeUtil.getStringShort();
		try {
			if(type==1) {//签到
				int conSign=0;
				if(mdao.getCoinRecord(uid,type,TimeUtil.getPreDay(new Date(), 1))!=null) {
					conSign++;
					if(mdao.getCoinRecord(uid,type,TimeUtil.getPreDay(new Date(), 2))!=null) {
						conSign++;
						if(mdao.getCoinRecord(uid,type,TimeUtil.getPreDay(new Date(), 3))!=null) {
							conSign++;
							if(mdao.getCoinRecord(uid,type,TimeUtil.getPreDay(new Date(), 4))!=null) {
								conSign++;
								if(mdao.getCoinRecord(uid,type,TimeUtil.getPreDay(new Date(), 5))!=null) {
									conSign++;
									if(mdao.getCoinRecord(uid,type,TimeUtil.getPreDay(new Date(), 6))!=null) {
										conSign++;
									}
								}
							}
						}
					}
				}
				if(conSign>=6) {//连续签到7天
					GetCoinRecord gcr=new GetCoinRecord();
					gcr.setType(type);
					gcr.setUid(uid);
					gcr.setNumber(40);
					gcr.setCreateDate(TimeUtil.getThisTime());
					int re= mdao.addGetCoinRecord(gcr);
					if(re>0) {
						mdao.addCoin(uid,40);
					}
				}else if(conSign>=2) {//3-6
					GetCoinRecord gcr=new GetCoinRecord();
					gcr.setType(type);
					gcr.setUid(uid);
					gcr.setNumber(30);
					gcr.setCreateDate(TimeUtil.getThisTime());
					int re= mdao.addGetCoinRecord(gcr);
					if(re>0) {
						mdao.addCoin(uid,40);
					}
				}else if(conSign>=1) {//2
					GetCoinRecord gcr=new GetCoinRecord();
					gcr.setType(type);
					gcr.setUid(uid);
					gcr.setNumber(25);
					gcr.setCreateDate(TimeUtil.getThisTime());
					int re= mdao.addGetCoinRecord(gcr);
					if(re>0) {
						mdao.addCoin(uid,40);
					}
				}else{
					GetCoinRecord gcr=new GetCoinRecord();
					gcr.setType(type);
					gcr.setUid(uid);
					gcr.setNumber(20);
					gcr.setCreateDate(TimeUtil.getThisTime());
					int re= mdao.addGetCoinRecord(gcr);
					if(re>0) {
						mdao.addCoin(uid,40);
					}
				}
			}else if(type==2) {
				
			}else if(type==3) {//被收藏
				int coinCount=mdao.getCoinCount(uid,type,today);
				if(coinCount<10) {
					GetCoinRecord gcr=new GetCoinRecord();
					gcr.setType(type);
					gcr.setUid(uid);
					gcr.setNumber(2);
					gcr.setCreateDate(TimeUtil.getThisTime());
					int re= mdao.addGetCoinRecord(gcr);
					if(re>0) {
						mdao.addCoin(uid,2);
					}
				}
			}else if(type==4) {//被点赞
				int coinCount=mdao.getCoinCount(uid,type,today);
				if(coinCount<30) {
					GetCoinRecord gcr=new GetCoinRecord();
					gcr.setType(type);
					gcr.setUid(uid);
					gcr.setNumber(1);
					gcr.setCreateDate(TimeUtil.getThisTime());
					int re= mdao.addGetCoinRecord(gcr);
					if(re>0) {
						mdao.addCoin(uid,1);
					}
				}
			}else if(type==5) {//被打印
				int coinCount=mdao.getCoinCount(uid,type,today);
				if(coinCount<150) {
					GetCoinRecord gcr=new GetCoinRecord();
					gcr.setType(type);
					gcr.setUid(uid);
					gcr.setNumber(3);
					gcr.setCreateDate(TimeUtil.getThisTime());
					int re= mdao.addGetCoinRecord(gcr);
					if(re>0) {
						mdao.addCoin(uid,3);
					}
				}
			}
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}
