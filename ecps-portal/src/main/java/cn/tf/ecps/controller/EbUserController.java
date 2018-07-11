package cn.tf.ecps.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tf.ecps.po.EbArea;
import cn.tf.ecps.po.EbBrand;
import cn.tf.ecps.po.EbFeature;
import cn.tf.ecps.po.EbItem;
import cn.tf.ecps.po.EbShipAddr;
import cn.tf.ecps.po.EbShipAddrBean;
import cn.tf.ecps.po.TsPtlUser;
import cn.tf.ecps.service.EbAreaService;
import cn.tf.ecps.service.EbBrandService;
import cn.tf.ecps.service.EbFeatureService;
import cn.tf.ecps.service.EbItemService;
import cn.tf.ecps.service.EbShipAddrService;
import cn.tf.ecps.service.TsPtlUserService;
import cn.tf.ecps.utils.ECPSUtil;
import cn.tf.ecps.utils.MD5;

@Controller
@RequestMapping("/user")
public class EbUserController {

	@Autowired
	private TsPtlUserService userService;
	
	@Autowired
	private EbShipAddrService addrService;
	@Autowired
	private EbAreaService areaService;

	// 进入主页面
	@RequestMapping("/toLogin.do")
	public String toLogin(Model model) {
		return "passport/login";
	}
	/**
	 * 生成验证码图片
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/getImage.do")
	public void getImage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
	        BufferedImage img = new BufferedImage(68, 22,  
	  
	        BufferedImage.TYPE_INT_RGB);  
	  
	        // 得到该图片的绘图对象    
	  
	        Graphics g = img.getGraphics();  
	  
	        Random r = new Random();  
	  
	        Color c = new Color(200, 150, 255);  
	  
	        g.setColor(c);  
	  
	        // 填充整个图片的颜色    
	  
	        g.fillRect(0, 0, 68, 22);  
	  
	        // 向图片中输出数字和字母    
	  
	        StringBuffer sb = new StringBuffer();  
	  
	        char[] ch = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();  
	  
	        int index, len = ch.length;  
	  
	        for (int i = 0; i < 4; i++) {  
	  
	            index = r.nextInt(len);  
	  
	            g.setColor(new Color(r.nextInt(88), r.nextInt(188), r.nextInt  
	  
	            (255)));  
	  
	            g.setFont(new Font("Arial", Font.BOLD | Font.ITALIC, 22));  
	            // 输出的  字体和大小                      
	  
	            g.drawString("" + ch[index], (i * 15) + 3, 18);  
	            //写什么数字，在图片 的什么位置画    
	  
	            sb.append(ch[index]);  
	  
	        }  
	        //把图片上的 值存储到session中，以便于验证
	        request.getSession().setAttribute("piccode", sb.toString());  
	  
	        ImageIO.write(img, "JPG", response.getOutputStream());  
	}
	
	
	@RequestMapping("/login.do")
	public String login(HttpSession session,String username,String password,String captcha,Model model){
		//获得正确d 验证码
		String relCap=(String) session.getAttribute("piccode");
		if(!StringUtils.equalsIgnoreCase(captcha, relCap)){
			model.addAttribute("tip","cap_error");
			return "passport/login";
		}
		password=new MD5().GetMD5Code(password);
		Map<String, String> map=new HashMap<String, String>();
		map.put("username", username);
		map.put("password", password);
		TsPtlUser user = userService.selectUserByUserPass(map);
		if(user == null){
			model.addAttribute("tip", "userpass_error");
			return "passport/login";
		}
		session.setAttribute("user", user);
		return "redirect:/item/toIndex.do";
	}
	
	//判断用户是否登录
	@RequestMapping("/getUser.do")
	public void getUser(HttpSession session,PrintWriter out){
		TsPtlUser user=(TsPtlUser) session.getAttribute("user");
		JSONObject json=new JSONObject();
		json.accumulate("user", user);  //自动转换为json字符串
		String result=json.toString();
		out.write(result);
	}
	//跳转到个人中心
	@RequestMapping("/login/toPersonIndex.do")
	public String toPersonIndex(Model model) {
		return "person/index";
	}
	
	//查询用户的收货地址
	@RequestMapping("/login/toAddr.do")
	public String toAddr(HttpSession session,Model model) {
		TsPtlUser user=(TsPtlUser) session.getAttribute("user");
		List<EbShipAddrBean> addrList = addrService.selectAddrByUserId(user.getPtlUserId());
		model.addAttribute("addrList",addrList);
		//查询省市级联的地址
		List<EbArea> aList = areaService.selectAreaByParentId(0l);
		model.addAttribute("aList",aList);
		return "person/deliverAddress";
	}
	
	//
	@RequestMapping("/loadOption.do")
	public void loadOption(Long parentId,HttpServletResponse response){
		List<EbArea> aList = areaService.selectAreaByParentId(parentId);
		JSONObject json=new JSONObject();
		json.accumulate("aList", aList);  //自动转换为json字符串
		String result=json.toString();
		ECPSUtil.printJSON(result, response);

	}
	
	/**
	 * 根据收货地址id查询收货地址
	 * @param shipAddrId
	 * @param response
	 */
	@RequestMapping("/login/getAddrById.do")
	public void getAddrById(Long shipAddrId, HttpServletResponse response){
		EbShipAddr addr = addrService.selectAddrById(shipAddrId);
		JSONObject jo = new JSONObject();
		jo.accumulate("addr", addr);
		String result = jo.toString();
		ECPSUtil.printJSON(result, response);
	}
	
	//保存或修改
	@RequestMapping("/login/saveOrUpdateAddr.do")
	public String saveOrUpdateAddr(HttpSession session,EbShipAddr addr){
		if(addr.getDefaultAddr()==null){
			addr.setDefaultAddr((short)0);
		}
		TsPtlUser user=(TsPtlUser) session.getAttribute("user");
		addr.setPtlUserId(user.getPtlUserId());
		addrService.saveOrUpdateAddr(addr,user);
		//重定向时，同一个controller中有两个方法有共同的一段路径，就不需要指定，例如这里/login就可以省略
		return "redirect:toAddr.do";
	}
	
		//删除
	@RequestMapping("/login/deleteAddr.do")
	public String deleteAddr(Long id){

		int result=addrService.deleteAddr(id);
		if(result>0){
			return "redirect:toAddr.do";
		}
		return null;
	}
	
	//生成订单时用户登陆校验
	@RequestMapping("/loginAjax.do")
	public void loginAjax(HttpSession session,String username,String password,String captcha,
			PrintWriter out){
		//获得正确d 验证码
		String relCap=(String) session.getAttribute("piccode");
		if(!StringUtils.equalsIgnoreCase(captcha, relCap)){
			out.write("cap_error");
			return ;
		}
		password=new MD5().GetMD5Code(password);
		Map<String, String> map=new HashMap<String, String>();
		map.put("username", username);
		map.put("password", password);
		TsPtlUser user = userService.selectUserByUserPass(map);
		if(user == null){
			out.write("userpass_error");
			return;
		}
		session.setAttribute("user", user);
		out.write("success");
	}
	
	

}
