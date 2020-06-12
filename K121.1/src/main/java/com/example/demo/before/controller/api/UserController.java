package com.example.demo.before.controller.api;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.dao.MDAO;
import com.example.demo.entity.Catetree;
import com.example.demo.entity.FeedBack;
import com.example.demo.entity.FriendList;
import com.example.demo.entity.Guanzhu;
import com.example.demo.entity.K12Config;
import com.example.demo.entity.Material;
import com.example.demo.entity.MsgBean;
import com.example.demo.entity.Shoucang;
import com.example.demo.entity.User;
import com.example.demo.entity.Version;
import com.example.demo.entity.Zan;
import com.example.demo.entity.Zujuanquestion;
import com.example.demo.entity.vo.Materialvo;
import com.example.demo.utils.ImgCompress;
import com.example.demo.utils.MyUtil;
import com.example.demo.utils.TencentUtil;
import com.example.demo.utils.TimeUtil;
import net.coobird.thumbnailator.Thumbnails;
/**
 * 
 * @author ymm
 * 用户登入和用户信息
 */
@Component
@Controller
@RequestMapping("api")
public class UserController {
	@Autowired
	private MDAO mdao;
	public Map<String,String> codeMap=new Hashtable<String,String>();
	public String defaultHeadUrl="/images/logo_shang1.png";
	/**
	 * 得到用户信息
	 * @return
	 * @param type(1为手机，2为微信，3为qq)
	 */
	@RequestMapping("getUserInfo")
	@ResponseBody
	public MsgBean getUserInfo(int type,String tel,String password,String nickName,String avatarUrl,
			String sex,String province,String city,String country,String unionId,String code) {
		MsgBean msgBean;
		User conuser=new User();
		if(type==1) {
			conuser.setPhoneNumber(tel);
			User user=mdao.getUserByCon(conuser);
			if(user==null) {
				msgBean=MsgBean.fail();
				msgBean.setMsg("该手机未注册！");
				return msgBean;
			}else {
				if(MyUtil.isnull(user.getPassword())) {
					msgBean=MsgBean.fail();
					msgBean.setMsg("密码错误！");
					return msgBean;
				}else{
					if(user.getPassword().equals(password)) {
						msgBean=MsgBean.success();
						msgBean.setMsg("登入成功！");
						user.setPassword("1");//0没密码，1有密码
						msgBean.add("user", user);
						return msgBean;
					}else {
						msgBean=MsgBean.fail();
						msgBean.setMsg("密码错误！");
						return msgBean;
					}
				}
			}
		}else if(type==2) {
			conuser.setUnionId(unionId);
			User user=mdao.getUserByCon(conuser);
			if(user==null) {
				if(MyUtil.isnull(tel)) {
					msgBean=MsgBean.fail();
					msgBean.setCode(201);
					msgBean.setMsg("注册新用户");
					return msgBean;
				}else {
					if(codeMap.get(tel).equals(code)) {
						conuser=new User();
						//conuser.setId(user.getId());
						conuser.setPhoneNumber(tel);
						user=mdao.getUserByCon(conuser);
						if(user==null) {
							User nuser=new User();
							nuser.setAvatarUrl(avatarUrl);
							nuser.setNickName(nickName);
							nuser.setSex(sex);
							nuser.setProvince(province);
							nuser.setCity(city);
							nuser.setCountry(country);
							nuser.setUnionId(unionId);
							nuser.setPhoneNumber(tel);
							int i1=Integer.parseInt(tel.substring(0, 3));
							int i2=Integer.parseInt(tel.substring(3, 11));
							nuser.setUid(String.format("%08d", i2-i1));
							mdao.addUser(nuser);
							user=mdao.getUserByCon(conuser);
							msgBean=MsgBean.success();
							msgBean.add("user", user);
							return msgBean;
						}else {
							if(user.getAvatarUrl()==null) {
								user.setAvatarUrl(avatarUrl);
							}
							if(user.getNickName()==null) {
								user.setNickName(nickName);
							}
							if(user.getSex()==null) {
								user.setSex(sex);
							}
							user.setUnionId(unionId);
							mdao.editUser(user);
							msgBean=MsgBean.success();
							msgBean.add("user", user);
							return msgBean;
						}
					}else {
						msgBean=MsgBean.fail();
						msgBean.setMsg("验证码错误！");
						return msgBean;
					}
				}
			}
			user=mdao.getUserByCon(conuser);
			msgBean=MsgBean.success();
			msgBean.add("user", user);
			return msgBean;
		}else if(type==3) {
			conuser.setOfficialOpenId(unionId);
			User user=mdao.getUserByCon(conuser);
			if(user==null) {
				if(MyUtil.isnull(tel)) {
					msgBean=MsgBean.fail();
					msgBean.setCode(201);
					msgBean.setMsg("注册新用户");
					return msgBean;
				}else {
					if(codeMap.get(tel).equals(code)) {
						conuser=new User();
						//conuser.setId(user.getId());
						conuser.setPhoneNumber(tel);
						user=mdao.getUserByCon(conuser);
						if(user==null) {
							User nuser=new User();
							nuser.setAvatarUrl(avatarUrl);
							nuser.setNickName(nickName);
							nuser.setSex(sex);
							nuser.setProvince(province);
							nuser.setCity(city);
							nuser.setCountry(country);
							nuser.setOfficialOpenId(unionId);
							nuser.setPhoneNumber(tel);
							int i1=Integer.parseInt(tel.substring(0, 3));
							int i2=Integer.parseInt(tel.substring(3, 11));
							nuser.setUid(String.format("%08d", i2-i1));
							mdao.addUser(nuser);
							user=mdao.getUserByCon(conuser);
							msgBean=MsgBean.success();
							msgBean.add("user", user);
							return msgBean;
						}else {
							if(user.getAvatarUrl()==null) {
								user.setAvatarUrl(avatarUrl);
							}
							if(user.getNickName()==null) {
								user.setNickName(nickName);
							}
							if(user.getSex()==null) {
								user.setSex(sex);
							}
							user.setOfficialOpenId(unionId);
							mdao.editUser(user);
							msgBean=MsgBean.success();
							msgBean.add("user", user);
							return msgBean;
						}
					}else {
						msgBean=MsgBean.fail();
						msgBean.setMsg("验证码错误！");
						return msgBean;
					}
				}
			}
			user=mdao.getUserByCon(conuser);
			msgBean=MsgBean.success();
			msgBean.add("user", user);
			return msgBean;
		}else {
			msgBean=MsgBean.success();
			User user=mdao.getUserById(new Long(1));
			if(MyUtil.isnull(user.getPassword())) {
				user.setPassword("0");//0没密码，1有密码
			}else {
				user.setPassword("1");
			}
			user.setPassword(null);
			msgBean.add("user", user);
			return msgBean;
		}
	}
	/**
	 * 修改用户信息(传入user id 和修改的信息)
	 * editUser
	 */
	@RequestMapping("editUser")
	@ResponseBody
	public MsgBean editUser(User user,MultipartFile file,String oldPassword) {
		MsgBean msgBean;
		System.out.println(user);
		user.setAvatarUrl(user.getAvatarUrl());
		user.setNickName(user.getNickName());
		user.setSex(user.getSex());
		user.setZone(user.getZone());
		user.setSignature(user.getSignature());
		user.setPassword(user.getPassword());
		user.setPhoneNumber(user.getPhoneNumber());
		user.setUnionId(user.getUnionId());
		try {
			if(file!=null&&!file.isEmpty()) {
				System.out.println(123);
				ImgCompress imgCompress=new ImgCompress();
				String img=imgCompress.Compress(file, 1.0);
				user.setAvatarUrl(img);
			}
			if(!MyUtil.isnull(user.getPassword())) {
				System.out.println(11);
				User nuser=mdao.getUserById(user.getId());
				if(!MyUtil.isnull(oldPassword)&&!nuser.getPassword().equals(oldPassword)) {
					msgBean=MsgBean.fail();
					msgBean.setMsg("旧密码错误！");
					return msgBean;
				}
			}
			if(!MyUtil.isnull(user.getUnionId())) {//绑定微信
				User conUser=new User();
				conUser.setUnionId(user.getUnionId());
				User oUser=mdao.getUserByCon(conUser);
				if(oUser!=null) {
					mdao.removeUnionId(user.getUnionId());
					User u=mdao.getUserById(user.getId());
					if(u.getAvatarUrl()!=null) {
						user.setAvatarUrl(null);
					}
					if(u.getNickName()!=null) {
						user.setNickName(null);
					}
					if(u.getSex()!=null) {
						user.setSex(null);
					}
					int res=mdao.editUser(user);
					msgBean=MsgBean.success();
					msgBean.add("user", mdao.getUserById(user.getId()));
					msgBean.setCode(101);
					msgBean.setMsg("新手机号绑定成功，旧手机："+oUser.getPhoneNumber()+"已解绑！");
					return msgBean;
				}else {
					User u=mdao.getUserById(user.getId());
					if(u.getAvatarUrl()!=null||!u.getAvatarUrl().equals("/images/logo_shang1.png")) {
						user.setAvatarUrl(null);
					}
					if(u.getNickName()!=null) {
						user.setNickName(null);
					}
					if(u.getSex()!=null) {
						user.setSex(null);
					}
					int res=mdao.editUser(user);
					msgBean=MsgBean.success();
					msgBean.add("user", mdao.getUserById(user.getId()));
					msgBean.setCode(102);
					msgBean.setMsg("绑定成功！");
					return msgBean;
				}
			}
			if(!MyUtil.isnull(user.getOfficialOpenId())) {//绑定QQ
				User conUser=new User();
				conUser.setOfficialOpenId(user.getOfficialOpenId());
				User oUser=mdao.getUserByCon(conUser);
				if(oUser!=null) {
					mdao.removeOfficialOpenId(user.getOfficialOpenId());
					User u=mdao.getUserById(user.getId());
					if(u.getAvatarUrl()!=null||!u.getAvatarUrl().equals("/images/logo_shang1.png")) {
						user.setAvatarUrl(null);
					}
					if(u.getNickName()!=null) {
						user.setNickName(null);
					}
					if(u.getSex()!=null) {
						user.setSex(null);
					}
					int res=mdao.editUser(user);
					msgBean=MsgBean.success();
					msgBean.add("user", mdao.getUserById(user.getId()));
					msgBean.setCode(101);
					msgBean.setMsg("新手机号绑定成功，旧手机："+oUser.getPhoneNumber()+"已解绑！");
					return msgBean;
				}else {
					User u=mdao.getUserById(user.getId());
					if(u.getAvatarUrl()!=null) {
						user.setAvatarUrl(null);
					}
					if(u.getNickName()!=null) {
						user.setNickName(null);
					}
					if(u.getSex()!=null) {
						user.setSex(null);
					}
					int res=mdao.editUser(user);
					msgBean=MsgBean.success();
					msgBean.add("user", mdao.getUserById(user.getId()));
					msgBean.setCode(102);
					msgBean.setMsg("绑定成功！");
					return msgBean;
				}
			}
			int res=mdao.editUser(user);
			msgBean=MsgBean.success();
			msgBean.add("user", mdao.getUserById(user.getId()));
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
		
	}
	/**
	 * 得到关注列表 id是用户id
	 * getMyGuanzhu
	 */
	@RequestMapping("getMyGuanzhu")
	@ResponseBody
	public MsgBean getMyGuanzhu(Long id,int pageNum) {
		MsgBean msgBean;
		try {
			int pageSize=8;
			int totalCount=mdao.getGZcount(id);//得到关注记录数
			if(totalCount==0) {
				msgBean=MsgBean.fail();
				msgBean.setCode(201);
				msgBean.setMsg("还未关注他人！");
				return msgBean;
			}else {
				int pageCount=(totalCount+pageSize-1)/pageSize;
				List<User> uList=mdao.getGZUbyPage(id,(pageNum-1)*pageSize,pageSize);
				List<Integer> gzState=new ArrayList<Integer>();
				for(User u:uList) {
					Guanzhu gz=mdao.getGZbyuId(u.getId(), id);
					if(gz!=null) {
						gzState.add(1);
					}else {
						gzState.add(0);
					}
				}
				msgBean=MsgBean.success();
				msgBean.add("uList", uList);
				msgBean.add("pageCount",pageCount);
				msgBean.add("gzState", gzState);
				return msgBean;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 得到粉丝列表
	 * getMyFans
	 */
	@RequestMapping("getMyFans")
	@ResponseBody
	public MsgBean getMyFans(Long id,int pageNum) {
		MsgBean msgBean;
		try {
			int pageSize=8;
			int totalCount=mdao.getFScount(id);//得到关注记录数
			if(totalCount==0) {
				msgBean=MsgBean.fail();
				msgBean.setCode(201);
				msgBean.setMsg("还没有粉丝！");
				return msgBean;
			}else {
				int pageCount=(totalCount+pageSize-1)/pageSize;
				List<User> uList=mdao.getFSUbyPage(id,(pageNum-1)*pageSize,pageSize);
				List<Integer> gzState=new ArrayList<Integer>();
				for(User u:uList) {
					Guanzhu gz=mdao.getGZbyuId(id, u.getId());
					if(gz!=null) {
						gzState.add(1);
					}else {
						gzState.add(0);
					}
				}
				msgBean=MsgBean.success();
				msgBean.add("uList", uList);
				msgBean.add("pageCount",pageCount);
				msgBean.add("gzState", gzState);
				return msgBean;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 点击进入用户的详情
	 * getUserDetail
	 */
	@RequestMapping("getUserDetail")
	@ResponseBody
	public MsgBean getUserDetail(Long id,Long uid,int pageNum) {
		MsgBean msgBean;
		try {
			User user=mdao.getUserById(id);
			int pageSize=8;
			int totalCount=mdao.getUserMCount(id);
			int pageCount=(totalCount+pageSize-1)/pageSize;
			List<Material> mList=mdao.getMyMPage(id,(pageNum-1)*pageSize,pageSize);
			msgBean=MsgBean.success();
			msgBean.add("user", user);
			FriendList fl=mdao.getOneFriend(uid,id);
			int fState;
			if(fl==null) {
				fState=0;//未添加好友
			}else {
				fState=1;//已添加好友
			}
			int gzState;
			Guanzhu gz=mdao.getGZbyuId(uid, id);
			if(gz==null) {
				gzState=0;
			}else {
				gzState=1;
			}
			List<Integer> zanList=new ArrayList<Integer>();
			List<Integer> scList=new ArrayList<Integer>();
			for(Material m:mList) {
				Zan zan=mdao.getZan(m.getId(),uid);
				if(zan==null) {
					zanList.add(0);//未点赞
				}else {
					zanList.add(1);
				}
				Shoucang sc=mdao.getSC(m.getId(),uid);
				if(sc==null) {
					scList.add(0);//未点赞
				}else {
					scList.add(1);
				}
			}
			if(MyUtil.isnull(user.getPassword())) {
				user.setPassword("0");//0没密码，1有密码
			}else {
				user.setPassword("1");
			}
			msgBean.add("fState", fState);
			msgBean.add("gzState", gzState);
			msgBean.add("zanList", zanList);
			msgBean.add("scList", scList);
			msgBean.add("mList", mList);
			msgBean.add("pageCount", pageCount);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 发送短信验证码
	 * sendMessage
	 */
	@RequestMapping("sendMessage")
	@ResponseBody
	public MsgBean sendMessage(String tel) {
		MsgBean msgBean;
		try {
			TencentUtil tu=new TencentUtil();
			Random r=new Random();
			String code="";
			for(int i=0;i<4;i++) {
				code+=r.nextInt(9);
			}
			String res= tu.sendCodeMessage(tel,code);
			JSONObject jo=JSONObject.parseObject(res);
			com.alibaba.fastjson.JSONArray ja=jo.getJSONArray("SendStatusSet");
			JSONObject jo1= ja.getJSONObject(0);
			//System.out.println(jo1);
			String rcode=jo1.getString("Code");
			//System.out.println(rcode);
			if(rcode.equals("Ok")) {
				codeMap.put(tel, code);
				msgBean=MsgBean.success();
				return msgBean;
			}else {
				msgBean=MsgBean.fail();
				return msgBean;
			}
			//测试
//			codeMap.put(tel, "1234");
//			msgBean=MsgBean.success();
//			msgBean.add("jo", jo);
//			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 验证验证码
	 * verifyCode
	 */
	@RequestMapping("verifyCode")
	@ResponseBody
	public MsgBean verifyCode(String tel,String code,String newpassword) {
		MsgBean msgBean;
		try {
			String mcode=codeMap.get(tel);
			if(mcode.equals(code)) {
				msgBean=MsgBean.success();
				User conuser=new User();
				conuser.setPhoneNumber(tel);
				User user=mdao.getUserByCon(conuser);
				if(user==null) {
					int i1=Integer.parseInt(tel.substring(0, 3));
					int i2=Integer.parseInt(tel.substring(3, 11));
					conuser.setUid(String.format("%08d", i2-i1));
					conuser.setNickName("user"+String.format("%08d", i2-i1));
					conuser.setAvatarUrl(this.defaultHeadUrl);
					mdao.addUser(conuser);
					user=mdao.getUserByCon(conuser);
					msgBean.setMsg("注册成功！");
					if(MyUtil.isnull(user.getPassword())) {
						user.setPassword("0");//0没密码，1有密码
					}else {
						user.setPassword("1");
					}
					msgBean.add("user", user);
				}else {
					if(!MyUtil.isnull(newpassword)) {
						User nuser=new User();
						nuser.setId(user.getId());
						nuser.setPassword(newpassword);
						int re= mdao.editUser(nuser);
						if(re>0) {
							msgBean.setMsg("修改密码成功！");
						}else {
							msgBean=MsgBean.fail();
						}
					}else {
						msgBean.setMsg("登入成功！");
						if(MyUtil.isnull(user.getPassword())) {
							user.setPassword("0");//0没密码，1有密码
						}else {
							user.setPassword("1");
						}
						msgBean.add("user", user);
						
					}
				}
			}else {
				msgBean=MsgBean.fail();
				msgBean.setMsg("验证码不正确！");
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
	 * 绑定手机号
	 */
	@RequestMapping("bindTel")
	@ResponseBody
	public MsgBean bindTel(Long uid,String tel,String password,String code) {
		MsgBean msgBean;
		try {
			String mcode=codeMap.get(tel);
			if(code.equals(mcode)) {
				User user=new User();
				user.setId(uid);
				user.setPhoneNumber(tel);
				if(MyUtil.isnull(password)) {
					mdao.editUser(user);
					msgBean=MsgBean.success();
					return msgBean;
				}else {
					User olduser=mdao.getUserById(uid);
					if(olduser.getPassword().equals(password)) {
						mdao.editUser(user);
						msgBean=MsgBean.success();
						return msgBean;
					}else {
						msgBean=MsgBean.fail();
						return msgBean;
					}
				}
			}else {
				msgBean=MsgBean.fail();
				msgBean.setMsg("验证码错误！");
				return msgBean;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
		
		
	}
	/**
	 * 我的发布
	 * myPublish
	 */
	@RequestMapping("myPublish")
	@ResponseBody
	public MsgBean myPublish(Long uid,int pageNum) {
		MsgBean msgBean;
		try {
			int pageSize=8;
			int totalCount=mdao.getUserMCount(uid);
			int pageCount=(totalCount+pageSize-1)/pageSize;
			List<Material> mList=mdao.getMyMPage(uid,(pageNum-1)*pageSize,pageSize);
			List<Integer> zanList=new ArrayList<Integer>();
			List<Integer> scList=new ArrayList<Integer>();
			for(Material m:mList) {
				Zan zan=mdao.getZan(m.getId(),uid);
				if(zan==null) {
					zanList.add(0);//未点赞
				}else {
					zanList.add(1);
				}
				Shoucang sc=mdao.getSC(m.getId(),uid);
				if(sc==null) {
					scList.add(0);//未点赞
				}else {
					scList.add(1);
				}
			}
			msgBean=MsgBean.success();
			msgBean.add("zanList", zanList);
			msgBean.add("scList", scList);
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
	 * 我的收藏
	 * myMCollect
	 */
	@RequestMapping("myMCollect")
	@ResponseBody
	public MsgBean myMCollect(Long uid,int pageNum) {
		MsgBean msgBean;
		try {
			int pageSize=8;
			int totalCount=mdao.getMyMCount(uid);
			int pageCount=(totalCount+pageSize-1)/pageSize; 
			List<Materialvo> cList=mdao.getMyMCollect(uid,(pageNum-1)*pageSize,pageSize);
			for(Materialvo m:cList) {
				Guanzhu guanzhu=mdao.getGZbyuId(uid,m.getUserId());
				if(m.getUserId().longValue()==uid.longValue()){
					m.setGzState(2);//本人发布的
				}else if(guanzhu==null){
					m.setGzState(0);
				}else {
					m.setGzState(1);
				}
				Zan zan=mdao.getZan(new Long(m.getmId()),uid);
				if(zan==null) {
					m.setZanState(0);//未点赞
				}else {
					m.setZanState(1);
				}
				Shoucang sc=mdao.getSC(new Long(m.getmId()),uid);
				if(sc==null) {
					m.setScState(0);//收藏
				}else {
					m.setScState(1);
				}
			}
			msgBean=MsgBean.success();
			msgBean.add("cList", cList);
			msgBean.add("pageCount", pageCount);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 反馈
	 * feedback
	 */
	@RequestMapping("feedback")
	@ResponseBody
	public MsgBean feedback(FeedBack fb,MultipartFile file) {
		MsgBean msgBean;
		try {
			if(file!=null&&!file.isEmpty()) {
				ImgCompress imgCompress=new ImgCompress();
				String imgPath=imgCompress.Compress(file, 1.00);
				fb.setImgPath(imgPath);
			}
			String createDate=TimeUtil.getThisTime();
			fb.setCreateDate(createDate);
			int rs= mdao.saveFeedBack(fb);
			msgBean=MsgBean.success();
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
		
	}
	public String replaceQuotation(String s) {
		if(s!=null) {
			s=s.replaceAll("\"", "");
			if(s.equals("")) {
				s=null;
			}
		}
		return s;
	}
	/**
	 * 根据用户id得到用户信息
	 * getUserByUid
	 */
	@RequestMapping("getUserByUid")
	@ResponseBody
	public MsgBean getUserByUid(Long uid) {
		MsgBean msgBean;
		try {
			User user=mdao.getUserById(uid);
			msgBean=MsgBean.success();
			msgBean.add("nickName", user.getNickName());
			msgBean.add("avatarUrl",user.getAvatarUrl());
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 获取版本号
	 * getVersion
	 */
	@RequestMapping("getVersion")
	@ResponseBody
	public Version getVersion() {
		Version version=mdao.getVersion();
		return version;
	}
	/**
	 * 存版本号
	 * setVersion
	 */
	@RequestMapping("setAPPVersion")
	@ResponseBody
	public MsgBean setAPPVersion(String versionNow,String versionNext,HttpServletRequest request) {
		MsgBean msgBean;
		 String ip = null;
		 System.out.println("111111111111111111111111");
	    //X-Forwarded-For：Squid 服务代理
	    String ipAddresses = request.getHeader("X-Forwarded-For");

	    if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
	        //Proxy-Client-IP：apache 服务代理
	        ipAddresses = request.getHeader("Proxy-Client-IP");
	    }

	    if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
	        //WL-Proxy-Client-IP：weblogic 服务代理
	        ipAddresses = request.getHeader("WL-Proxy-Client-IP");
	    }

	    if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
	        //HTTP_CLIENT_IP：有些代理服务器
	        ipAddresses = request.getHeader("HTTP_CLIENT_IP");
	    }

	    if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
	        //X-Real-IP：nginx服务代理
	        ipAddresses = request.getHeader("X-Real-IP");
	    }

	    //有些网络通过多层代理，那么获取到的ip就会有多个，一般都是通过逗号（,）分割开来，并且第一个ip为客户端的真实IP
	    if (ipAddresses != null && ipAddresses.length() != 0) {
	        ip = ipAddresses.split(",")[0];
	    }

	    //还是不能获取到，最后再通过request.getRemoteAddr();获取
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
	        ip = request.getRemoteAddr();
	    }
		System.out.println(ip);
		System.out.println(versionNow);
		System.out.println(versionNext);
		boolean re=false;
		if(versionNow!=null&&versionNext!=null) {
			re=mdao.setVersion(versionNow,versionNext);
		}
		if(re) {
			msgBean=MsgBean.success();
			return msgBean;
		}else {
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * getFontV2
	 * 得到字体的第二版本
	 */
	@RequestMapping("getFontV2")
	@ResponseBody
	public MsgBean getFontV2(int tableStart,int tableEnd,String tableName) {
		String bootPath1="E:\\www\\zujuan\\Public\\home\\fonts\\v1\\";
		String bootPath2="E:\\www\\zujuan\\Public\\home\\fonts\\v2\\";
		String requestPathHead=null;
		String houzui1=".woff";
		String houzui2=".ttf";
		String houzui3=".svg";
		String houzui4=".eot";
		String[] houzuis=new String[] {houzui1,houzui2,houzui3,houzui4};
		MsgBean msg=new MsgBean();
		try {
			for(int i=tableStart;i<=tableEnd;i++) {
				System.out.println(tableName+i);
				List<String> fList=mdao.getFontV2(tableName+i);
				for(String s:fList) {
					if(!MyUtil.isnull(s)) {
						JSONObject jo=JSON.parseObject(s);
						String fileName=jo.getString("name");
						String version=jo.getString("version_id");
						String bootPath=null;
						if(version.equals("v2")) {
							bootPath=bootPath2;
							requestPathHead="https://static.zujuanyi.com/fonts/v2/";
						}else if(version.equals("v1")) {
							bootPath=bootPath1;
							requestPathHead="https://static.zujuanyi.com/fonts/v1/";
						}
						File file=new File(bootPath+fileName);
						if(!file.exists()) {
							boolean cd=file.mkdir();
							if(cd) {
								for(String houzui:houzuis) {
									String requestPath=requestPathHead+fileName+"/"+fileName+houzui;
									URL url=new URL(requestPath);
									HttpURLConnection uc=(HttpURLConnection)url.openConnection();
									int state=uc.getResponseCode();
									if(state==200) {
										file=new File(bootPath+fileName+"\\"+fileName+houzui);
										if(!file.exists()) {
											InputStream is=uc.getInputStream();
											FileOutputStream fos=new FileOutputStream(file);
											int len=0;
											byte[] b=new byte[1024*256];
											while((len=is.read(b))!=-1) {
												fos.write(b,0,len);
											}
											fos.close();
										}
									}else if(state==404) {
										continue;
									}
								}
							}
						}else {
							for(String houzui:houzuis) {
								String requestPath=requestPathHead+fileName+"/"+fileName+houzui;
								URL url=new URL(requestPath);
								HttpURLConnection uc=(HttpURLConnection)url.openConnection();
								int state=uc.getResponseCode();
								if(state==200) {
									file=new File(bootPath+fileName+"\\"+fileName+houzui);
									if(!file.exists()) {
										InputStream is=uc.getInputStream();
										FileOutputStream fos=new FileOutputStream(file);
										int len=0;
										byte[] b=new byte[1024*256];
										while((len=is.read(b))!=-1) {
											fos.write(b,0,len);
										}
										fos.close();
									}
								}else if(state==404) {
									continue;
								}
							}
						}
//						System.out.println(jo.getString("name"));
//						System.out.println(jo.getString("version_id"));
					}
				}
			}
			msg=MsgBean.success();
			return msg;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg=MsgBean.fail();
			return msg;
		}
		
	}
	/**
	 * 数据库去重
	 * removeDul
	 */
	@RequestMapping("removeDul")
	@ResponseBody
	public MsgBean removeDul(int tableStart,int tableEnd,String tableName) {
		MsgBean msg=new MsgBean();
		try {
			for(int i=tableStart;i<=tableEnd;i++) {
				System.out.println(tableName+i);
				long startTime = System.currentTimeMillis();
				List<Integer> dulQids=mdao.getDulQids(tableName+i);
				for(int id:dulQids) {
					List<Zujuanquestion> dulRecs=mdao.getDulRecs(tableName+i,id);
					for(int j=0;j<dulRecs.size();j++) {
						for(int n=dulRecs.size()-1;n>j;n--) {
							if(dulRecs.get(j).getCatetreerec()==dulRecs.get(n).getCatetreerec()) {
								int res=mdao.delDulQ(tableName+i,dulRecs.get(n).getRec());
								dulRecs.remove(n);
							}
						}
					}
				}
				long endTime = System.currentTimeMillis();
				System.out.println("Time is：" + (endTime - startTime) + " 毫秒");
			}
			msg=MsgBean.success();
			return msg;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg=MsgBean.fail();
			return msg;
		}		
	}
	/**
	 * 得到指定路径下的所有图片
	 * getImgByPath
	 */
	@RequestMapping("getImgByPath")
	@ResponseBody
	public MsgBean getImgByPath(String path) {
		MsgBean msg;
		try {
			File file=new File(path);
			if(file.exists()&&file.isDirectory()) {
				File[] fs=file.listFiles();
				List<String> filePaths=new ArrayList<String>();
				for(File f:fs) {
					if(f.isFile()) {
						filePaths.add(f.getAbsolutePath());
						System.out.println(f);
					}
				}
				msg=MsgBean.success();
				msg.add("filePaths", filePaths);
				return msg;
			}else {
				msg=MsgBean.fail();
				msg.setMsg("路径不存在！");
				return msg;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg=MsgBean.fail();
			return msg;
		}
	}
	/**
	 * 得到catree表指定题库下题目数
	 * getQuestionCount
	 */
	@RequestMapping("getQuestionCount")
	@ResponseBody
	public MsgBean getQuestionCount(int tableStart,int tableEnd,String tableName) {
		MsgBean msg;
		try {
			int xdid=0;
			int chidid=0;
			for(int i=tableStart;i<=tableEnd;i++) {
				System.out.println(tableName+i);
				switch (i) {
					case 1:
						xdid=1;
						chidid=2;
						break;
					case 2:
						xdid=1;
						chidid=3;
						break;
					case 3:
						xdid=1;
						chidid=4;
						break;
					case 4:
						xdid=1;
						chidid=5;
						break;
					case 5:
						xdid=1;
						chidid=9;
						break;
					case 6:
						xdid=2;
						chidid=2;
						break;
					case 7:
						xdid=2;
						chidid=3;
						break;
					case 8:
						xdid=2;
						chidid=4;
						break;
					case 9:
						xdid=2;
						chidid=5;
						break;
					case 10:
						xdid=3;
						chidid=2;
						break;
					case 11:
						xdid=3;
						chidid=3;
						break;
					case 12:
						xdid=3;
						chidid=4;
						break;
					case 13:
						xdid=3;
						chidid=6;
						break;
					case 14:
						xdid=2;
						chidid=6;
						break;
					case 15:
						xdid=2;
						chidid=7;
						break;
					case 16:
						xdid=3;
						chidid=7;
						break;
					case 17:
						xdid=2;
						chidid=8;
						break;
					case 18:
						xdid=2;
						chidid=9;
						break;
					case 19:
						xdid=2;
						chidid=10;
						break;
					case 20:
						xdid=2;
						chidid=11;
						break;
					case 21:
						xdid=2;
						chidid=20;
						break;
					case 22:
						xdid=2;
						chidid=21;
						break;
					case 23:
						xdid=3;
						chidid=8;
						break;
					case 24:
						xdid=3;
						chidid=9;
						break;
					case 25:
						xdid=3;
						chidid=10;
						break;
					case 26:
						xdid=3;
						chidid=11;
						break;
					case 27:
						xdid=3;
						chidid=14;
						break;
					case 28:
						xdid=3;
						chidid=15;
						break;
					default:
						break;
				}
				List<Catetree> versions=mdao.getQCList(xdid,chidid,0);
				for(Catetree v:versions) {
					//List<Catetree>
					List<Catetree> glades=mdao.getQCList(xdid, chidid, v.getId());
					int versionsCount=0;
					for(Catetree g:glades) {
						List<Catetree> chapters=mdao.getQCList(xdid, chidid, g.getId());
						int gladesCount=0;
						for(Catetree c:chapters) {
							if(c.getHasChild().equals("true")) {
								List<Catetree> texts=mdao.getQCList(xdid, chidid, c.getId());
								int chaptersCount=0;
								for(Catetree t:texts) {
									if(t.getHasChild().equals("true")) {
										List<Catetree> textChild=mdao.getQCList(xdid, chidid, t.getId());
										int textsCount=0;
										for(Catetree tc:textChild) {
											int totalCount=mdao.getQuestionCount(xdid,chidid,tc.getRec(),tableName+i);
											textsCount+=totalCount;
											mdao.updateQC(totalCount,tc.getRec());
										}
										chaptersCount+=textsCount;
										mdao.updateQC(textsCount,t.getRec());
									}else {
										int totalCount=mdao.getQuestionCount(xdid,chidid,t.getRec(),tableName+i);
										chaptersCount+=totalCount;
										mdao.updateQC(totalCount,t.getRec());
									}
								}
								gladesCount+=chaptersCount;
								mdao.updateQC(chaptersCount,c.getRec());
							}else {
								int totalCount=mdao.getQuestionCount(xdid,chidid,c.getRec(),tableName+i);
								gladesCount+=totalCount;
								mdao.updateQC(totalCount,c.getRec());
							}
						}
						versionsCount+=gladesCount;
						mdao.updateQC(gladesCount,g.getRec());
					}
					mdao.updateQC(versionsCount,v.getRec());
				}
			}
			msg=MsgBean.success();
			return msg;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg=MsgBean.fail();
			return msg;
		}
	}
	/**
	 * 将image下图片复制缩略图
	 * getMiniImage
	 */
	@RequestMapping("getMiniImage")
	@ResponseBody
	public MsgBean getMiniImage(String filePath) {
		MsgBean msgBean;
		try {
			File file=new File(filePath);
			compressMniniImage(file);
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
	 * 将image下图片png转jpg
	 * getMiniImage
	 */
	@RequestMapping("getJPGImage")
	@ResponseBody
	public MsgBean getJPGImage(String filePath) {
		MsgBean msgBean;
		try {
			File file=new File(filePath);
			compressJPGImage();
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
	 * 将image下图片缩放
	 * getMiniImage
	 */
	@RequestMapping("getScaleImage")
	@ResponseBody
	public MsgBean getScaleImage(String filePath) {
		MsgBean msgBean;
		try {
			File file=new File(filePath);
			compressScaleImage(file);
			msgBean=MsgBean.success();
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	public void compressJPGImage() {
		List<Material> ms=mdao.getAllMaterial();
		
		for (int i=0;i<ms.size();i++) {
			Material material=ms.get(i);
			if(!MyUtil.isnull(material.getImgPath())) {
				String[] paths=material.getImgPath().split(",");
				for (String path : paths) {
					InputStream miniIs =null;
					try {
						System.out.println(path);
						String fileName=(path.split("\\."))[0];
						File jpgfile=new File("C:"+fileName+".jpg");
						File pngfile=new File("C:"+fileName+".png");
						File minijpgfile=new File("C:"+fileName+"mini.jpg");
						File minipngfile=new File("C:"+fileName+"mini.png");
						if(!jpgfile.exists()) {
							BufferedImage bi=ImageIO.read(pngfile);
							int width=bi.getWidth();
							int height=bi.getHeight();
							ByteArrayOutputStream minios = new ByteArrayOutputStream();
							ImageIO.write(bi,"jpg" , minios);
							miniIs=new ByteArrayInputStream(minios.toByteArray());
							Thumbnails.of(miniIs).scale(1.0).toFile(jpgfile);
						}
						if(!minijpgfile.exists()) {
							BufferedImage bi=ImageIO.read(minipngfile);
							ByteArrayOutputStream minios = new ByteArrayOutputStream();
							ImageIO.write(bi,"jpg" , minios);
							miniIs=new ByteArrayInputStream(minios.toByteArray());
							Thumbnails.of(miniIs).scale(1.0).toFile(minijpgfile);
						}
					} catch (IOException e) {
						e.printStackTrace();
					}finally {
						if(miniIs!=null){
							try {
								miniIs.close();
							} catch (IOException e) {
								e.printStackTrace();
							}
						}
					}
				}
				String toPaths=material.getImgPath().replaceAll(".png", ".jpg");
				mdao.upImagePath(material.getId(),toPaths);
			}
		}
	}
	public void compressScaleImage(File file) {
		if(file.isDirectory()) {
			File[] files=file.listFiles();
			for(File f :files) {
				compressScaleImage(f);
			}
		}else {
			String fileName=file.getAbsolutePath();
			if(!fileName.contains("mini.")) {
				InputStream miniIs =null;
				try {
					BufferedImage bi=ImageIO.read(file);
					int width=bi.getWidth();
					int height=bi.getHeight();
					ByteArrayOutputStream minios = new ByteArrayOutputStream();
					ImageIO.write(bi,fileName.split("\\.")[1] , minios);
					miniIs=new ByteArrayInputStream(minios.toByteArray());
					if(width>800) {
						double minib=(double)800/(double)width;
						Thumbnails.of(miniIs).scale(minib).toFile(fileName);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}finally {
					if(miniIs!=null){
						try {
							miniIs.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
	}
	public void compressMniniImage(File file) {
		if(file.isDirectory()) {
			File[] files=file.listFiles();
			for(File f :files) {
				compressMniniImage(f);
			}
		}else {
			String fileName=file.getAbsolutePath();
			if(!fileName.contains("mini.")) {
				String miniFileName=fileName.split("\\.")[0]+"mini."+fileName.split("\\.")[1];
				File dest=new File(miniFileName);
				if(!dest.exists()) {
					InputStream miniIs =null;
					try {
						BufferedImage bi=ImageIO.read(file);
						int width=bi.getWidth();
						int height=bi.getHeight();
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
						ImageIO.write(bi,fileName.split("\\.")[1] , minios);
						miniIs=new ByteArrayInputStream(minios.toByteArray());
						Thumbnails.of(miniIs).scale(minib).toFile(miniFileName);
					} catch (IOException e) {
						try {
							// 失败了再用springmvc自带的方式
							dest.createNewFile();
						} catch (IOException e1) {
							e1.printStackTrace();
						}
					}finally {
						if(miniIs!=null){
							try {
								miniIs.close();
							} catch (IOException e) {
								e.printStackTrace();
							}
						}
					}
				}
			}
		}
	}
	@RequestMapping("getK12Config")
	@ResponseBody
	public K12Config getK12Config() {
		K12Config kc=mdao.getK12Config();
		return kc;
	}
}
