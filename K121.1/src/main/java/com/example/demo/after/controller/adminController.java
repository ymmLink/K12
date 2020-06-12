package com.example.demo.after.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.dao.DAOImpl;
import com.example.demo.dao.MDAO;
import com.example.demo.entity.AdminEntity;
import com.example.demo.entity.MsgBean;
import com.example.demo.utils.ImgCompress;
import com.example.demo.utils.Request;

@Component
@Controller
@RequestMapping("admin")
public class adminController extends DAOImpl<AdminEntity>{

//	@Autowired
//	private IdentityDao identityDao;
	@Autowired
	private MDAO mdao;
	//申请登入
	@RequestMapping("/doLogin")
	@ResponseBody
	public int doLogin(ModelMap modelMap,AdminEntity admin, HttpServletRequest req,RedirectAttributes redirectAttributes) {
		
		int isLogin= 0;
		if (StringUtils.isNoneBlank(admin.getAccount(),admin.getPassword())) {
			List<AdminEntity> AdminEntitys = findByString1("account",admin.getAccount());
			if(AdminEntitys.size()>0) {
				AdminEntity adminEntity=AdminEntitys.get(0);
				String passWord = adminEntity.getPassword();
				if (adminEntity != null && passWord.equals(admin.getPassword())) {
					isLogin = 1;
					update(adminEntity);
					Request.setAdmin(req, adminEntity);
				} 
			}
		}else {
			isLogin=2;
		}
		return isLogin;
	}
	//登入
	@RequestMapping("/login")
	public String login(ModelMap modelMap,HttpServletRequest request) {
		AdminEntity admin=Request.getAdmin(request);
		if(admin!=null) {
			modelMap.addAttribute("admin", admin);
			return "/admin/index";
		}else {
			return "/admin/login";
		}
	}
	/**
	 * goRight
	 * 欢迎页面
	 */
	@RequestMapping("goRight")
	public String goRight(ModelMap modelMap,HttpServletRequest request) {
		AdminEntity admin=Request.getAdmin(request);
		modelMap.addAttribute("admin", admin);
		return "/admin/right";
	}
	/**
	 * 登出
	 * @return
	 */
	@RequestMapping("getLoginOut")
	public String getLoginOut(HttpServletRequest request) {
		Request.removeAdmin(request);
		return "redirect:/admin/login";
	}
	/**
	 * toAdminPage
	 * 管理员页面
	 */
	@RequestMapping("toAdminPage")
	public String toAdminPage(ModelMap modelMap,HttpServletRequest request) {
		AdminEntity admin=Request.getAdmin(request);
		modelMap.addAttribute("admin", admin);
		return "/admin/user/adminPage";
	}
	/**
	 * saveAdmin
	 * 保存修改管理员
	 */
	@RequestMapping("saveAdmin")
	@ResponseBody
	public String saveAdmin(AdminEntity admin,MultipartFile file,HttpServletRequest req) {
		if(!file.isEmpty()) {
			ImgCompress imgCompress=new ImgCompress();
			String img=imgCompress.Compress(file, 1.00);
			admin.setImg(img);
		}
		boolean res=mdao.saveAdmin(admin);
		if(res) {
			List<AdminEntity> AdminEntitys = findByString1("account",admin.getAccount());
			if(AdminEntitys.size()>0) {
				AdminEntity adminEntity=AdminEntitys.get(0);
				Request.setAdmin(req, adminEntity);
			}
			return "success";
		}else {
			return "fail";
		}
	}
	/**
	 * addAdminPage
	 * 跳转添加管理员页面
	 */
	@RequestMapping("addAdminPage")
	public String addAdminPage() {
		return "redirect:/admin/user/addAdminPage";
	}
	/**
	 * addAdmin
	 * 添加管理员
	 */
	@RequestMapping("addAdmin")
	@ResponseBody
	public String addAdmin(AdminEntity admin,MultipartFile file,HttpServletRequest req) {
		if(!file.isEmpty()) {
			ImgCompress imgCompress=new ImgCompress();
			String img=imgCompress.Compress(file, 1.00);
			admin.setImg(img);
		}
		boolean res=mdao.addAdmin(admin);
		if(res) {
			return "success";
		}else {
			return "fail";
		}
	}
	
//	//退出登入
//	@RequestMapping("/logout")
//	public String logout(ModelMap modelMap, HttpServletRequest req) {
//		AdminEntity admin = Request.getAdmin(req);
//		Request.removeAdmin(req);
//		if(admin.getSwitchover()==0) {
//			modelMap.addAttribute("loginErr", "");// 提示优化
//			return "redirect:/admin/login";
//		}else {
//			AdminEntity admin1 =findById(1L);
//			admin1.setSwitchover(0);
//			Request.setAdmin(req, admin1);
//			return "redirect:/admin/index";
//		}
//		
//	}
//	//admin信息设置
//	@RequestMapping("/shezhi")
//	public String shezhi(ModelMap modelMap, HttpServletRequest req) {
//		AdminEntity admin = Request.getAdmin(req);
//		System.out.println(admin);
//	
//		modelMap.addAttribute("admin", admin);
//		return "/admin/admin/shezhi";
//	}
//	//admin修改
//	@RequestMapping("/update")
//	public String update(ModelMap modelMap,AdminEntity admin, HttpServletRequest req,MultipartFile file,RedirectAttributes redirectAttributes) throws IOException {
//		if (file == null) {
//			try {
//				AdminEntity admin1 = findById(admin.getId());
//				admin.setImg(admin1.getImg());
//				update(admin);
//				Request.removeAdmin(req);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		} else {
//			try {
//				ImgCompress imgCompress=new ImgCompress();
//				String url=imgCompress.Compress(file,0.75);//使用以下方法压缩图片
//		    	System.err.println(url );
//		    	admin.setImg(url);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			update(admin);
//			Request.removeAdmin(req);
//		}
//		AdminEntity a=new AdminEntity();
//		String url=admin.getImg();
//		a.setAddTime(admin.getAddTime());
//		a.setAuthotity(admin.getAuthotity());
//		a.setId(admin.getId());
//		a.setIdentity(admin.getIdentity());
//		a.setImg(url);
//		a.setName(admin.getName());
//		a.setPassword(admin.getPassword());
//		a.setPhone(admin.getPhone());
//		a.setQianming(admin.getQianming());
//		a.setSwitchover(admin.getSwitchover());
//		Request.setAdmin(req, a);
//		Request.setAdmin(req, a);
//		return "redirect:/admin/shezhi";
//	}
//	//分管理员列表
//	@RequestMapping("/point")
//	public String point(ModelMap modelMap, HttpServletRequest req,Integer page) {
//		if(page==null || page<1) {
//			page=1;
//		}
//		String sql="from "+AdminEntity.class.getName()+" where identity=1";
//		int size=20;
//		PageBean<AdminEntity> pbs=pageHql(sql,page,size);
//		int allpage=(int)(pbs.getTotalCount()+size-1)/size;
//		System.out.println(allpage);
//		String s=this.checkpage(page,allpage);
//		AdminEntity admin=Request.getAdmin(req);
//		modelMap.addAttribute("admin", admin);
//		modelMap.addAttribute("admins", pbs.getDatas());
//		modelMap.addAttribute("page", page);
//		modelMap.addAttribute("allpage", allpage);
//		modelMap.addAttribute("min", s.split(",")[0]);
//		modelMap.addAttribute("max", s.split(",")[1]);
//		return "/admin/admin/point";
//	}
//	//跳转添加分管理员
//	@RequestMapping("/toadd")
//	public String toadd(ModelMap modelMap, HttpServletRequest req) {
////		List<IdEntity> ids=identityDao.findAll();
////		modelMap.addAttribute("ids", ids);
//		
//		return "/admin/admin/addAdmin";
//	}
//	//跳转修改分管理员
//	@RequestMapping("/toedit")
//	public String toedit(ModelMap modelMap, HttpServletRequest req,Long id) {
////		List<IdEntity> ids=identityDao.findAll();
////		modelMap.addAttribute("ids", ids);
//		AdminEntity admin=this.findById(id);
//		modelMap.addAttribute("tAdmin", admin);
//	
//		return "/admin/admin/addAdmin";
//	}
//	//添加分管理员
//	@RequestMapping("/add")
//	public String add(Model model,AdminEntity admin,MultipartFile file,RedirectAttributes redirectAttributes) {
//		System.out.println(admin);
//		try {
//			java.util.Date date=new Date();
//			SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd HH-mm-ss");
//			String addTime=sdf.format(date);
//			ImgCompress imgCompress=new ImgCompress();
//			String url=imgCompress.Compress(file,0.5);//使用以下方法压缩图片
//			admin.setImg(url);
//	    	admin.setAddTime(addTime);
//	    	admin.setIdentity(1);
//			save(admin);
//	    	redirectAttributes.addFlashAttribute("isAdd", "添加成功");
//		} catch (Exception e) {
//			redirectAttributes.addFlashAttribute("isAdd", "添加失败");
//			e.printStackTrace();
//		}
//		return "redirect:/admin/point";
//	}
//	//验证管理员账号
//	@RequestMapping("/checkName")
//	@ResponseBody
//	public String checkName(HttpServletRequest req) {
//		String msg="0";
//		String name=req.getParameter("name");
//		if(name!=null) {
//			List<AdminEntity> AdminEntitys = findByString1("name",name);
//			if(AdminEntitys.size()>0) {
//				msg="1";
//			}
//		}
//		return msg;
//	}
//	//分管理员查询
//	@RequestMapping("/searchTeam")
//	public String searchTeam(Model model,String key,String keyword) {
//		List<AdminEntity> teams=findByString(key, keyword);
//		model.addAttribute("admins", teams);
//		model.addAttribute("page", 1);
//		model.addAttribute("allpage", 1);
//		model.addAttribute("min", 1);
//		model.addAttribute("max", 1);
//		return "/admin/admin/point";
//	}
//	//切换登入
//	@RequestMapping("/switchover")
//	public String switchover(Long id,HttpServletRequest req) {
//		AdminEntity ad=findById(id);
//		ad.setSwitchover(1);
//		Request.removeAdmin(req);
//		Request.setAdmin(req, ad);
//		return "/admin/index";
//	}
////	//切换登入
////	@RequestMapping("/identity")
////	public String identity(Model model,HttpServletRequest req) {
////		List<IdEntity> ids=identityDao.findAll();
////		model.addAttribute("ids", ids);
////		return "/admin/admin/identity";
////	}
////	//验证部门账号
////	@RequestMapping("/checkIdEntityName")
////	@ResponseBody
////	public String checkIdEntityName(HttpServletRequest req) {
////		String msg="0";
////		String name=req.getParameter("name");
////		if(name!=null) {
////			List<IdEntity> ids = identityDao.findByIdentity(name);
////			if(ids.size()>0) {
////				msg="1";
////			}
////		}
////		return msg;
////	}
////	//跳转添加部门
////	@RequestMapping("/toadd1")
////	public String toadd1(ModelMap modelMap, HttpServletRequest req) {
////		return "/admin/admin/addidentity";
////	}
////	//添加部门
////	@RequestMapping("/addidentity")
////	public String addidentity(Model model,IdEntity ids,HttpServletRequest req) {
////		identityDao.save(ids);
////		return "redirect:/admin/identity";
////	}
//	@RequestMapping("addmedical")
//	public String addmedical(){
//		return "admin/addmedical";
//	}
//	//分页
//	public String checkpage(Integer page,Integer allpage){
//		if(page==null || page<1){
//			page=1;
//		}
//		if(allpage==null || allpage<1){
//			allpage=1;
//		}
//		int min=0;
//		int max=0;
//		try {
//			page=Math.min(page, allpage);		
//			min=Math.max(1, page-2);
//			max=Math.min(page+2, allpage);
//			if(page-2<=0){
//				if(allpage>=5){
//					max=5;
//				}else{
//					max=allpage;
//				}
//			}
//			if(page+2>=allpage){
//				min=allpage-4;
//				if(min<=0){
//					min=1;
//				}
//					}
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//				String str=min+","+max;
//				return str;
//			}
//	public String getIpAddr(HttpServletRequest request) {  
//	    String ip = request.getHeader("x-forwarded-for");  
//	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
//	        ip = request.getHeader("Proxy-Client-IP");  
//	    }  
//	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
//	        ip = request.getHeader("WL-Proxy-Client-IP");  
//	    }  
//	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
//	        ip = request.getRemoteAddr();  
//	    }  
//	    return ip;  
//	}  
}
