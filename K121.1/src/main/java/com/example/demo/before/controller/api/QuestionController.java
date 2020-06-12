package com.example.demo.before.controller.api;
/**
 * 
 * @author ymm
 * 题库接口
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.example.demo.dao.MDAO;
import com.example.demo.entity.Catetree;
import com.example.demo.entity.MsgBean;
import com.example.demo.entity.Questioncollect;
import com.example.demo.entity.Xueke;
import com.example.demo.entity.Zujuanquestion;
import com.example.demo.utils.ImgCompress;
import com.example.demo.utils.MyUtil;
import com.example.demo.utils.TimeUtil;

@Controller
@RequestMapping("api")
public class QuestionController {
	@Autowired
	MDAO mdao;
	
	/**
	 * 保存图片接口
	 * savaImage
	 */
	@RequestMapping("savaImage")
	@ResponseBody
	public MsgBean savaImage(MultipartFile file) {
		MsgBean msgBean;
		try {
			if(!file.isEmpty()) {
				ImgCompress imgCompress=new ImgCompress();
				String imgPath=imgCompress.Compress(file, 1.00);
				msgBean=MsgBean.success();
				msgBean.setMsg(imgPath);
				return msgBean;
			}else {
				msgBean=MsgBean.fail();
				msgBean.setMsg("请上传文件！");
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
	 * 得到科目（小学，中学，高中）
	 * 
	 */
	@RequestMapping("getSubject")
	@ResponseBody
	public MsgBean getSubject(String stage) {
//		MsgBean msgBean=new MsgBean();
//		try {
//			int parseId=0;
//			if(stage.equals("小学")) {
//				parseId=1;
//			}else if(stage.equals("初中")) {
//				parseId=2;
//			}else if(stage.equals("高中")) {
//				parseId=3;
//			}
//			System.out.println(parseId);
//			List<Subject> sList=mdao.getSubject(parseId);
//			msgBean=msgBean.success();
//			msgBean.add("sList", sList);
//			return msgBean;
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			msgBean=msgBean.fail();
//			return msgBean;
//		}
		MsgBean msgBean=new MsgBean();
		try {
			int parseId=0;
			if(stage.equals("小学")) {
				parseId=1;
			}else if(stage.equals("初中")) {
				parseId=2;
			}else if(stage.equals("高中")) {
				parseId=3;
			}
			System.out.println(parseId);
			List<Xueke> sList=mdao.getXueke(parseId);
			msgBean=msgBean.success();
			msgBean.add("sList", sList);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=msgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 得到课本
	 * @param subjectId
	 * getAllBooks
	 * versionName name
	 */
	@RequestMapping("getAllBooks")
	@ResponseBody
//	public MsgBean getAllBooks(int subjectId,int parseId) {
//		MsgBean msgBean=new MsgBean();
//		try {
//			List<Edition> eList=mdao.getEList(subjectId,parseId);
//			Map<String,List<Grade>> bMap=new HashMap<String,List<Grade>>();
//			for(Edition e:eList) {
//				List<Grade> gList=mdao.getGList(subjectId,parseId,e.getId());
//				bMap.put(e.getName(), gList);
//			}
//			msgBean=msgBean.success();
//			msgBean.add("eList", eList);
//			msgBean.add("bMap", bMap);
//			return msgBean;
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			msgBean=msgBean.fail();
//			return msgBean;
//		}
//	}
	public MsgBean getAllBooks(int xdid,int chidid) {
		MsgBean msgBean=new MsgBean();
		try {
			//如果题目数为0则不返回
			List<Catetree> eList=mdao.getCList(xdid,chidid);
			Map<String,List<Catetree>> bMap=new HashMap<String,List<Catetree>>();
			for(Catetree e:eList) {
				List<Catetree> gList=mdao.getGList(xdid,chidid,e.getId());
				bMap.put(e.getTitle(), gList);
			}
			msgBean=msgBean.success();
			msgBean.add("eList", eList);
			msgBean.add("bMap", bMap);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=msgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 得到章节
	 * getBookCategory
	 */
	@RequestMapping("getBookCategory")
	@ResponseBody
//	public MsgBean getBookCategory(Grade grade) {
//		MsgBean msgBean =new MsgBean();
//		try {
//			List<ChapterVo> cvList=mdao.getChapterVo(grade);
//			for(ChapterVo cv: cvList) {
//				List<Unit> uList=mdao.getUnit(grade,cv.getChapterOrder());
//				cv.setuList(uList);
//				Map<String,List<Chapter>> cMap=new HashMap<String, List<Chapter>>();
//				for(Unit u:uList) {
//					List<Chapter> cList=mdao.getChapter(grade,cv.getChapterOrder(),u.getUnitOrder());
//					cMap.put(u.getUnitOrder()+"", cList);
//				}
//				cv.setcMap(cMap);
//			}
//			msgBean=msgBean.success();
//			msgBean.add("cvList", cvList);
//			return msgBean;
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			msgBean=msgBean.fail();
//			return msgBean;
//		}
//	}
	public MsgBean getBookCategory(int xdid,int chidid,int chapterId) {
		MsgBean msgBean =new MsgBean();
		try {
			List<Catetree> cvListOld=mdao.getGList(xdid,chidid,chapterId);
			List<Catetree> cvList=new ArrayList<Catetree>();
			Map<String,List<Catetree>> cvMap=new HashMap<String,List<Catetree>>();
			for(Catetree c:cvListOld) {
				String tableName=null;
				if(xdid==1) {
					if(chidid==2) {
						tableName="zujuanquestion1";
					}else if(chidid==3) {
						tableName="zujuanquestion2";
					}else if(chidid==4) {
						tableName="zujuanquestion3";
					}else if(chidid==5) {
						tableName="zujuanquestion4";
					}else if(chidid==9) {
						tableName="zujuanquestion5";
					}
				}else if(xdid==2) {
					if(chidid==2) {
						tableName="zujuanquestion6";
					}else if(chidid==3) {
						tableName="zujuanquestion7";
					}else if(chidid==4) {
						tableName="zujuanquestion8";
					}else if(chidid==5) {
						tableName="zujuanquestion9";
					}else if(chidid==6) {
						tableName="zujuanquestion14";
					}else if(chidid==7) {
						tableName="zujuanquestion15";
					}else if(chidid==8) {
						tableName="zujuanquestion17";
					}else if(chidid==9) {
						tableName="zujuanquestion18";
					}else if(chidid==10) {
						tableName="zujuanquestion19";
					}else if(chidid==11) {
						tableName="zujuanquestion20";
					}else if(chidid==20) {
						tableName="zujuanquestion21";
					}else if(chidid==21) {
						tableName="zujuanquestion22";
					}
				}else if(xdid==3) {
					if(chidid==2) {
						tableName="zujuanquestion10";
					}else if(chidid==3) {
						tableName="zujuanquestion11";
					}else if(chidid==4) {
						tableName="zujuanquestion12";
					}else if(chidid==6) {
						tableName="zujuanquestion13";
					}else if(chidid==7) {
						tableName="zujuanquestion16";
					}else if(chidid==8) {
						tableName="zujuanquestion23";
					}else if(chidid==9) {
						tableName="zujuanquestion24";
					}else if(chidid==10) {
						tableName="zujuanquestion25";
					}else if(chidid==11) {
						tableName="zujuanquestion26";
					}else if(chidid==14) {
						tableName="zujuanquestion27";
					}else if(chidid==15) {
						tableName="zujuanquestion28";
					}
				}
				if(c.getHasChild().equals("false")) {
					if(tableName!=null) {
						int totalCount=c.getQuestionCount();
						//System.out.println(totalCount);
						if(totalCount>0) {
							cvList.add(c);
						}
					}
				}else if(c.getHasChild().equals("true")) {
					
					List<Catetree> listOld=mdao.getGList(xdid,chidid,c.getId());
					List<Catetree> list=new ArrayList<Catetree>();
					int count=0;
					for(Catetree c1:listOld) {
						if(c1.getHasChild().equals("false")) {
							if(tableName!=null) {
								int totalCount=c1.getQuestionCount();
								//System.out.println(totalCount);
								if(totalCount>0) {
									list.add(c1);
									count++;
								}
							}
						}else if(c1.getHasChild().equals("true")) {
							
							List<Catetree> listOld1=mdao.getGList(xdid,chidid,c1.getId());
							List<Catetree> list1=new ArrayList<Catetree>();
							int count1=0;
							for(Catetree c2:listOld1) {
								int totalCount=c2.getQuestionCount();
								//System.out.println(totalCount);
								if(totalCount>0) {
									list1.add(c2);
									count1++;
								}
							}
							if(count1>0) {
								list.add(c1);
								count++;
							}
							cvMap.put(c1.getTitle(), list1);
						}
					}
					if(count>0) {
						cvList.add(c);
					}
					cvMap.put(c.getTitle(), list);
				}			
			}
			msgBean=msgBean.success();
			msgBean.add("cvList", cvList);
			msgBean.add("cvMap", cvMap);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=msgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 得到该单元下的题目
	 * getQuestion
	 */
	@RequestMapping("getQuestion")
	@ResponseBody
//	public MsgBean getQuestion(int knowledgeId,int pageNum,int uid) {
//		MsgBean msgBean=new MsgBean();
//		try {
//			int pageSize=8;
//			int totalCount=mdao.getQuestionCount(knowledgeId);
//			int pageCount=(totalCount+pageSize-1)/pageSize;
//			List<Questions> qList=mdao.getQuestionByBC(knowledgeId,(pageNum-1)*pageSize,pageSize);
////			System.out.println(qList);
//			for(Questions q:qList) {
//				String title=this.getSimpleText(q.getTitle());
//				q.setTitle(title);
//				boolean scstate=mdao.getSCState(uid,q.getId());
//				if(scstate) {
//					q.setCollectState(1);
//				}else {
//					q.setCollectState(0);
//				}
//			}
//			msgBean=msgBean.success();
//			msgBean.add("pageCount", pageCount);
//			msgBean.add("totalCount", totalCount);
//			msgBean.add("qList", qList);
//			
//			return msgBean;
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			msgBean=msgBean.fail();
//			return msgBean;
//		}
//	}
	public MsgBean getQuestion(int xdid,int chidid,int catetreerec,int pageNum,int uid) {
		MsgBean msgBean=new MsgBean();
		try {
			int pageSize=8;
			String tableName=null;
			if(xdid==1) {
				if(chidid==2) {
					tableName="zujuanquestion1";
				}else if(chidid==3) {
					tableName="zujuanquestion2";
				}else if(chidid==4) {
					tableName="zujuanquestion3";
				}else if(chidid==5) {
					tableName="zujuanquestion4";
				}else if(chidid==9) {
					tableName="zujuanquestion5";
				}
			}else if(xdid==2) {
				if(chidid==2) {
					tableName="zujuanquestion6";
				}else if(chidid==3) {
					tableName="zujuanquestion7";
				}else if(chidid==4) {
					tableName="zujuanquestion8";
				}else if(chidid==5) {
					tableName="zujuanquestion9";
				}else if(chidid==6) {
					tableName="zujuanquestion14";
				}else if(chidid==7) {
					tableName="zujuanquestion15";
				}else if(chidid==8) {
					tableName="zujuanquestion17";
				}else if(chidid==9) {
					tableName="zujuanquestion18";
				}else if(chidid==10) {
					tableName="zujuanquestion19";
				}else if(chidid==11) {
					tableName="zujuanquestion20";
				}else if(chidid==20) {
					tableName="zujuanquestion21";
				}else if(chidid==21) {
					tableName="zujuanquestion22";
				}
			}else if(xdid==3) {
				if(chidid==2) {
					tableName="zujuanquestion10";
				}else if(chidid==3) {
					tableName="zujuanquestion11";
				}else if(chidid==4) {
					tableName="zujuanquestion12";
				}else if(chidid==6) {
					tableName="zujuanquestion13";
				}else if(chidid==7) {
					tableName="zujuanquestion16";
				}else if(chidid==8) {
					tableName="zujuanquestion23";
				}else if(chidid==9) {
					tableName="zujuanquestion24";
				}else if(chidid==10) {
					tableName="zujuanquestion25";
				}else if(chidid==11) {
					tableName="zujuanquestion26";
				}else if(chidid==14) {
					tableName="zujuanquestion27";
				}else if(chidid==15) {
					tableName="zujuanquestion28";
				}
			}
			if(tableName!=null) {
				int totalCount=mdao.getQuestionCount(xdid,chidid,catetreerec,tableName);
				int pageCount=(totalCount+pageSize-1)/pageSize;
				List<Zujuanquestion> qList=mdao.getQuestionByBC(xdid,chidid,catetreerec,tableName,(pageNum-1)*pageSize,pageSize);
//				System.out.println(qList);
				for(Zujuanquestion q:qList) {
//					String title=this.getSimpleText(q.getTitle());
					boolean scstate=mdao.getSCState(uid,q.getRec());
					if(scstate) {
						q.setCollectState(1);
					}else {
						q.setCollectState(0);
					}
					q.setExplanation(null);
					q.setKnowledge(null);
					q.setAnswer(null);
					if(MyUtil.isnull(q.getExplanationText())) {
						q.setExplanationText("0");
					}else {
						q.setExplanationText("1");
					}
					if(MyUtil.isnull(q.getKnowledgeText())) {
						q.setKnowledgeText("0");
					}else {
						q.setKnowledgeText("1");
					}
					if(MyUtil.isnull(q.getAnswerText())) {
						q.setAnswerText("0");
					}else {
						q.setAnswerText("1");
					}
					if(!MyUtil.isnull(q.getList())) {
						String s1=q.getList().replaceAll("\"\"\"\"","\"\"").replaceAll("'","’").replaceAll(":\"", ":\'").replaceAll("\",\r\n", "',\r\n").replaceAll("\"\r\n","\'\r\n").replaceAll(":\\[\"", ":\\[\'").replaceAll("\"\\]", "\'\\]");
						String[] ss= s1.split("'");
						String res="";
						for(int i=0;i<ss.length;i++) {
//							if(!ss[i].contains(":")) {
//								ss[i]=ss[i].replaceAll("\"", "“");
//							}
							if(i==ss.length-1) {
								res+=ss[i];
							}else{
								res=res+ss[i]+"'";
							}
						}
						q.setList(res);
						//com.alibaba.fastjson.JSONObject jo=JSON.parseObject(s2);
						//System.out.println(jo.get("A"));
					}
					if(!MyUtil.isnull(q.getOptions())) {
						//System.out.println(q.getOptions());
						String s1=q.getOptions().replaceAll("\"\"\"\"","\"\"").replaceAll("'","’").replaceAll("\":\"", "\":\'").replaceAll("\",\r\n", "',\r\n").replaceAll("\"\r\n","\'\r\n").replaceAll(":\\[\"", ":\\[\'").replaceAll("\"\\]", "\'\\]");
						int count=0;
						for(int i=0;i<s1.length();i++) {
							if("'".equals(s1.charAt(i))) {
								count++;
							}
						}
						String[] ss= s1.split("'");
						String res="";
						for(int i=0;i<ss.length;i++) {
//							if(!ss[i].contains(":")&&count>1) {
//								ss[i]=ss[i].replaceAll("\"", "“");
//							}
							if(i==ss.length-1) {
								res+=ss[i];
							}else{
								res=res+ss[i]+"'";
							}
						}
						q.setOptions(res);
						//System.out.println(s1+";"+s2);
						//System.out.println(q.getOptions());
						//com.alibaba.fastjson.JSONObject jo=JSON.parseObject(s2);
						//System.out.println(jo);
						//System.out.println(jo.getString("A"));
					}
					String regex="(&nbsp;)+";
					if(q.getQuestionText().matches(regex)) {
						q.setQuestionText("");
					}
				}
//				List<Zujuanquestion> qList1=new ArrayList<Zujuanquestion>();
//				int noetCount=0;
//				for(Zujuanquestion q:qList) {
//					if(q.getExplanationText().equals("1")) {
//						qList1.add(q);
//					}else {
//						noetCount++;
//					}
//				}
//				int pageCount=(totalCount+pageSize-1-noetCount)/pageSize;
				msgBean=MsgBean.success();
				msgBean.add("pageCount", pageCount);
				msgBean.add("totalCount", totalCount);
				msgBean.add("qList", qList);
			}else {
				msgBean=MsgBean.fail();
			}
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=msgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 收藏题目
	 * collectQuestion
	 */
	@RequestMapping("collectQuestion")
	@ResponseBody
	public MsgBean collectQuestion(int uid,int qid,int subjectId,int pharseId) {
		MsgBean msgBean=new MsgBean();
		try {
			String createDate=TimeUtil.getThisTime();
			Questioncollect qc=new Questioncollect(0, uid, qid, subjectId, pharseId,createDate);
			boolean res=mdao.addQC(qc);
			msgBean=msgBean.success();
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=msgBean.fail();
			return msgBean;
		}
		
	}
	/**
	 * 取消收藏
	 * cancelCollect
	 */
	@RequestMapping("cancelCollect")
	@ResponseBody
	public MsgBean cancelCollect(int uid,int qid) {
		MsgBean msgBean;
		try {
			boolean res=mdao.delQC(uid,qid);
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
	 * 我的收藏科目
	 * mycollect
	 */
	@RequestMapping("getmycollect")
	@ResponseBody
	public MsgBean getmycollect(int uid) {
//		MsgBean msgBean;
//		try {
//			List<Pharse> pList=mdao.getMyPharse(uid);
//			Map<String,List<Subject>> sMap=new HashMap<String, List<Subject>>();
//			for(Pharse p:pList) {
//				List<Subject> sList=mdao.getMySubject(uid,p.getPharseId());
//				sMap.put(p.getPharseId()+"", sList);
//			}
//			msgBean=MsgBean.success();
//			msgBean.add("pList", pList);
//			msgBean.add("sMap", sMap);
//			return msgBean;
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			msgBean=MsgBean.fail();
//			return msgBean;
//		}
		MsgBean msgBean;
		try {
			List<Integer> pList=new ArrayList<Integer>();
			Map<Integer,List<Xueke>> sMap=new HashMap<Integer, List<Xueke>>();
			for(int i=1;i<4;i++) {
				List<Xueke> sList=mdao.getMyXueke(uid,i);
				if(sList.size()>0) {
					pList.add(i);
					sMap.put(i, sList);
				}
			}
			msgBean=MsgBean.success();
			msgBean.add("pList", pList);
			msgBean.add("sMap", sMap);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
	}
	/**
	 * 我的收藏题目
	 * getmyCQ
	 */
	@RequestMapping("getmyCQ")
	@ResponseBody
	public MsgBean getmyCQ(int uid,int xdid,int chidid) {
		MsgBean msgBean;
		try {
			String tableName=null;
			if(xdid==1) {
				if(chidid==2) {
					tableName="zujuanquestion1";
				}else if(chidid==3) {
					tableName="zujuanquestion2";
				}else if(chidid==4) {
					tableName="zujuanquestion3";
				}else if(chidid==5) {
					tableName="zujuanquestion4";
				}else if(chidid==9) {
					tableName="zujuanquestion5";
				}
			}else if(xdid==2) {
				if(chidid==2) {
					tableName="zujuanquestion6";
				}else if(chidid==3) {
					tableName="zujuanquestion7";
				}else if(chidid==4) {
					tableName="zujuanquestion8";
				}else if(chidid==5||chidid==6||chidid==7) {
					tableName="zujuanquestion9";
				}
			}else if(xdid==3) {
				if(chidid==2) {
					tableName="zujuanquestion10";
				}else if(chidid==3) {
					tableName="zujuanquestion11";
				}else if(chidid==4) {
					tableName="zujuanquestion12";
				}else if(chidid==6||chidid==7) {
					tableName="zujuanquestion13";
				}
			}
			List<Zujuanquestion> qList=mdao.getmyCQ(uid,xdid,chidid,tableName);
			for(Zujuanquestion q:qList) {
				
				q.setCollectState(1);
			}
			msgBean=MsgBean.success();
			msgBean.add("qList", qList);
			return msgBean;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgBean=MsgBean.fail();
			return msgBean;
		}
		
	}
//	/**
//	 * 得到解析
//	 * getAnswer
//	 */
//	@RequestMapping("getAnswer")
//	@ResponseBody
//	public MsgBean getAnswer(int qid) {
//		MsgBean msgBean;
//		try {
//			Answer answer=mdao.getAnswer(qid);
//			String q=this.getSimpleText(answer.getContent());
//			answer.setContent(q);
//			msgBean=MsgBean.success();
//			msgBean.add("answer", answer);
//			return msgBean;
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			msgBean=MsgBean.fail();
//			return msgBean;
//		}
//		
//	}
	/**
	 * html剔除富文本标签，留下纯文本
	 * @param html
	 * @return
	 */
	public String getSimpleText(String html){
		String reg3 ="<br>|<br />";
		String reg = "<.+?>";//匹配html标签的正则表达式
		String reg1="&nbsp;";
		String reg2="\r\n";
		String msg=html.replaceAll(reg2, "").replaceAll(reg3,"\r\n").replaceAll(reg, "").replaceAll(reg1, "_");
		return msg;
	}

}
