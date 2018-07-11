package cn.tf.ecps.controller;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tf.ecps.po.EbBrand;
import cn.tf.ecps.service.EbBrandService;
import cn.tf.ecps.service.EbItemService;
import cn.tf.ecps.utils.ECPSUtil;
import cn.tf.ecps.utils.GetMD5;
import cn.tf.ecps.utils.Page;
import cn.tf.ecps.utils.QueryCondition;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Autowired
	private EbBrandService brandService;

	@Autowired
	private EbItemService itemService;

	
	//商品审核
	@RequestMapping("/listAudit.do")
	public String listAudit(QueryCondition qc, Model model) {
		List<EbBrand> bList = brandService.selectBrandAll();
		model.addAttribute("bList", bList);
		if (qc.getPageNo() == null) {
			qc.setPageNo(1);
		}

		Page page = itemService.selectItemByCondition(qc);
		model.addAttribute("page", page);
		model.addAttribute("qc", qc); // 把查询条件回显
		return "item/listAudit";
	}
	
	
	
	
		@RequestMapping("/auditItem.do")
		public String auditItem(String notes, Long itemId, Short auditStatus, Model model){
			itemService.auditItem(itemId, auditStatus, notes);
			return "redirect:listAudit.do?auditStatus=0&showStatus=1";
		}
		/**
		 * 商品上下架
		 * @param notes
		 * @param itemId
		 * @param showStatus
		 * @param model
		 * @return
		 */
		@RequestMapping("/showItem.do")
		public String showItem(String notes, Long itemId, Short showStatus, Model model){
			itemService.showItem(itemId, showStatus, notes);
			String flag = "1";
			if(showStatus == 1){
				flag = "0";
			}
			return "redirect:listItem.do?auditStatus=1&showStatus="+flag;
		}
		
	//调用服务
	@RequestMapping("/publish.do")
	public void publish(Long itemId,PrintWriter out){
		String wsPass=GetMD5.getMD5(itemId);
		String result = null;
		try {
			result = itemService.publishItem(itemId,wsPass);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		out.write(result);
	
	}
	
	
}
