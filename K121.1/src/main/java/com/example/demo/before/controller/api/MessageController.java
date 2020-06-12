package com.example.demo.before.controller.api;

import java.net.Socket;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.SpringbootExampleApplication;
import com.example.demo.dao.MDAO;
import com.example.demo.entity.ApplyAddFriend;
import com.example.demo.entity.ChatList;
import com.example.demo.entity.FriendList;
import com.example.demo.entity.Message;
/**
 * 
 * @author ymm
 * 消息处理
 */
import com.example.demo.entity.MsgBean;
import com.example.demo.entity.User;
import com.example.demo.entity.vo.ApplyAddFriendVo;
import com.example.demo.entity.vo.DynamicVo;
import com.example.demo.entity.vo.MessageVo;
import com.example.demo.utils.ImgCompress;
import com.example.demo.utils.TimeUtil;
@Controller
@RequestMapping("api")
public class MessageController {
	public String localIp="http://175.24.18.66";
	@Autowired
	MDAO mdao;
	/**
	 * 发现动态
	 * 
	 */
	@RequestMapping("getDynamic")
	@ResponseBody
	public MsgBean getDynamic(int type,Long uid) {
		MsgBean msgBean;
		List<DynamicVo> dList=new ArrayList<DynamicVo>();
		try {
			if(type==1) {//收藏
				dList=mdao.getSCDynamic(uid);
			}else if(type==2) {//点赞
				dList=mdao.getDZDynamic(uid);
			}else if(type==3) {//打印
				dList=mdao.getPRDynamic(uid);
			}else if(type==4) {//粉丝
				dList=mdao.getFSDynamic(uid);
			}else {
				msgBean=MsgBean.fail();
				msgBean.setMsg("type未匹配");
				return msgBean;
			}
			msgBean=MsgBean.success();
			msgBean.add("dList", dList);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
		
	}
	/**
	 * 我的好友
	 * myFriend
	 */
	@RequestMapping("myFriend")
	@ResponseBody
	public MsgBean myFriend(Long uid) {
		MsgBean msgBean;
		try {
			List<FriendList> fList=mdao.getFList(uid);
			msgBean=MsgBean.success();
			msgBean.add("fList", fList);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 得到推荐好友
	 * getTJFriend
	 */
	@RequestMapping("getTJFriend")
	@ResponseBody
	public MsgBean getTJFriend(Long uid) {
		MsgBean msgBean;
		try {
			int countUser=mdao.getCountUser();//得到总用户数
			List<FriendList> fList=mdao.getFList(uid);
			List<Integer> iidList=new ArrayList<Integer>();
			for(FriendList fl:fList) {
				iidList.add(fl.getFid());
			}
			iidList.add(uid.intValue());
			List<User> tjList=new ArrayList<User>();
			Random random=new Random();
			int iFcount=iidList.size();
			if((countUser-iFcount)<=50) {
				List<User> allUser=mdao.getAllTJFList1(iidList);
				int tsize=allUser.size();
				for(int i=0;i<10;i++) {
					int n=random.nextInt(tsize--);
					tjList.add(allUser.get(n));
					allUser.remove(n);
				}
			}else {
				int pageStart=random.nextInt(countUser-50);
				List<User> allUser=mdao.getAllTJFList2(pageStart,iidList);
				int tsize=allUser.size();
				for(int i=0;i<10;i++) {
					int n=random.nextInt(tsize--);
					tjList.add(allUser.get(n));
					allUser.remove(n);
				}
			}
			msgBean=MsgBean.success();
			msgBean.add("tjList", tjList);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 添加好友
	 * addFriend
	 */
	@RequestMapping("addFriend")
	@ResponseBody
	public MsgBean addFriend(int auid,int uid) {//auid被添加对象，uid用户
		MsgBean msgBean;
		try {
			ApplyAddFriend aaf=new ApplyAddFriend();
			aaf.setUid(uid);
			aaf.setAuid(auid);
			aaf.setState(0);
			String now=TimeUtil.getThisTime();
			aaf.setApplayDate(now);
			int re= mdao.addAAF(aaf);
			if(re!=0) {
				Socket socket=SpringbootExampleApplication.socketMap.get(auid+"");
				if(socket!=null&&socket.isConnected()&&!socket.isClosed()) {	
					socket.getOutputStream().write(("addFriend,"+uid).getBytes());
				}
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
	 * 审核好友申请
	 * checkAAF
	 */
	@RequestMapping("checkAAF")
	@ResponseBody
	public MsgBean checkAAF(int uid,int auid,int type) {//type=0拒绝，1同意
		System.out.println(uid+":"+auid+":"+"type");
		MsgBean msgBean;
		try {
			if(type==0) {
				mdao.checkAAF(auid,uid,2);
			}else if(type==1) {
				int re=mdao.checkAAF(auid,uid,1);
				if(re>0) {
					mdao.addFriendList(uid,auid,TimeUtil.getThisTime());
					mdao.addFriendList(auid,uid,TimeUtil.getThisTime());
				}
			}else {
				msgBean=MsgBean.fail();
				return msgBean;
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
	 * 删除好友
	 * delFL
	 */
	@RequestMapping("delFL")
	@ResponseBody
	public MsgBean delFL(int uid,int fid) {//好友
		MsgBean msgBean;
		try {
			mdao.delFL(uid,fid);
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
	 * 搜索ppid添加好友
	 * searchFriend
	 */
	@RequestMapping("searchFriend")
	@ResponseBody
	public MsgBean searchFriend(String ppid,int uid) {
		MsgBean msgBean;
		try {
			User conUser=new User();
			conUser.setUid(ppid);
			User user=mdao.getUserByCon(conUser);
			if(user==null) {
				msgBean=MsgBean.fail();
				msgBean.setMsg("未搜索到结果");
				return msgBean;
			}else {
				List<FriendList> fList=mdao.getFList(new Long(uid));
				int type=2;
				if(user.getId().intValue()==uid) {
					type=0;//本人
				}
				for(FriendList fl:fList) {
					if(fl.getFid()==user.getId().intValue()) {
						type=1;
					}
				}
				msgBean=MsgBean.success();
				msgBean.add("resUser", user);
				msgBean.add("type", type);
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
	 * 发送消息
	 * sendMessage
	 */
	@RequestMapping("sendChat")
	@ResponseBody
	public MsgBean sendChat(MultipartFile file,int uid,int toUid) {
		MsgBean msgBean;
		try {
			if(!file.isEmpty()) {
				Message message=new Message();
				message.setUid(uid);
				message.setToUid(toUid);
				ImgCompress ic=new ImgCompress();
				String imgPath=ic.Compress(file, 1.00);
				message.setImgPath(imgPath);
				message.setState(0);
				message.setSendTime(TimeUtil.getThisTime());
				ChatList cl1=new ChatList();
				cl1.setUid(uid);
				cl1.setToUid(toUid);
				cl1.setState(0);
				cl1.setSendTime(TimeUtil.getThisTime());
				ChatList cl2=new ChatList();
				cl2.setUid(toUid);
				cl2.setToUid(uid);
				cl2.setState(0);
				cl2.setSendTime(TimeUtil.getThisTime());
				boolean re1=mdao.addChatList(cl1);
				boolean re2=mdao.addChatList(cl2);
				if(!re1) {
					mdao.editChatList(cl1);
				}
				if(!re2) {
					mdao.editChatList(cl2);
				}
				mdao.addMessage(message);
				msgBean=MsgBean.success();
				msgBean.add("imgurl", this.localIp+imgPath);
				msgBean.add("sendTime", TimeUtil.getThisTime());
				return msgBean;
			}else {
				msgBean=MsgBean.fail();
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
	 * 得到最新消息
	 * getFlashMessage
	 */
	@RequestMapping("getFlashMessage")
	@ResponseBody
	public MsgBean getFlashMessage(int uid) {
		MsgBean msgBean;
		try {
			List<ApplyAddFriendVo> aafList=mdao.getAAFList(uid);
			List<MessageVo> allMessageList=mdao.getAllMessageList(uid);
//			List<MessageVo> messageList=mdao.getUMSender(uid);
			for(MessageVo m:allMessageList) {
//				String lastDate=mdao.getLastChatDate(m.getUid(),m.getTouid());
//				m.setLastDate(lastDate);
				int mcount=mdao.getMCount(uid,m.getTouid());
				m.setCount(mcount);
			}
			msgBean=MsgBean.success();
			msgBean.add("aafList", aafList);
			msgBean.add("messageList", allMessageList);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}	
	}
	/**
	 * 得到最新一条聊天记录
	 * getFlashMessage
	 */
	@RequestMapping("getNewChatMessage")
	@ResponseBody
	public MsgBean getNewChatMessage(int uid,int touid) {
		MsgBean msgBean;
		try {
			Message msg=mdao.getNewChatMessage(uid,touid);
			msgBean=MsgBean.success();
			msgBean.add("msg", msg);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}	
	}
	/**
	 * 聊天记录
	 * getChat
	 */
	@RequestMapping("getChat")
	@ResponseBody
	public MsgBean getChat(int uid,int touid,int pageNum) {
		MsgBean msgBean;
		try {
			int pageSize=8;
			int totolCount=mdao.getChatCount(uid,touid);
			int pageCount=(totolCount+pageSize-1)/pageSize;
			List<Message> mList=mdao.getChat(uid,touid,(pageNum-1)*pageSize,pageSize);
			msgBean=MsgBean.success();
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
	 * 删除聊天记录
	 * getChat
	 */
	@RequestMapping("RemoveChat")
	@ResponseBody
	public MsgBean RemoveChat(int uid,int touid) {
		MsgBean msgBean;
		try {
			mdao.removeChat(uid,touid);
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
	 * 修改消息状态
	 * readMessage
	 */
	@RequestMapping("readMessage")
	@ResponseBody
	public MsgBean readMessage(int uid,int touid) {
		MsgBean msgBean;
		try {
			mdao.editAllMessageState(uid,touid,1);
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
