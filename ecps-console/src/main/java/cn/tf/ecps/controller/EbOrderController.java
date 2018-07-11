package cn.tf.ecps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tf.ecps.po.TaskBean;
import cn.tf.ecps.service.EbOrderService;

@Controller
@RequestMapping("/order")
public class EbOrderController {
	
	
	@Autowired
	private EbOrderService orderService;
	
	
	
	@RequestMapping("/toIndex.do")
	public String toIndex(){
		
		return "order/index";
	}
	
	@RequestMapping("/listOrderPay.do")
	public String listOrderPay(String assignee,Short isCall,Model model){
		List<TaskBean> tbList = orderService.selectOrderPay(assignee, isCall);
		model.addAttribute("tbList",tbList);
		model.addAttribute("isCall",isCall);
		
		return "order/orderPay/orderPay";
	}
	
	@RequestMapping("/viewDetail.do")
	public String viewDetail(String taskId, Long orderId, Model model){
		TaskBean tb = orderService.selectTaskOrderBeanById(orderId, taskId);
		model.addAttribute("tb", tb);
		return "order/orderPay/detail";
	}
	
	/**
	 * 查询外呼单的明细
	 * @param taskId
	 * @param orderId
	 * @param model
	 * @return
	 */
	@RequestMapping("/viewDetailCall.do")
	public String viewDetailCall(String taskId, Long orderId, Model model){
		TaskBean tb = orderService.selectTaskOrderBeanById(orderId, taskId);
		model.addAttribute("tb", tb);
		return "order/orderCall/detail";
	}
	
	
	@RequestMapping("/noPaidCall.do")
	public String viewDetail(Long orderId, Model model){
		orderService.noPaidCall(orderId);
		return "redirect:listOrderPay.do?assignee=noPaidOrderer&isCall=0";
	}
	
	@RequestMapping("/completeTask.do")
	public String completeTask(Long orderId, String taskId, String outcome, Model model){
		orderService.completeTask(orderId, taskId, outcome);
		return "redirect:listOrderCall.do?assignee=paidOrderer";
	}
	
	/**
	 * 查询外呼单
	 * @param assignee
	 * @param model
	 * @return
	 */
	@RequestMapping("/listOrderCall.do")
	public String listOrderCall(String assignee, Model model){
		List<TaskBean> tbList = orderService.selectOrderCall(assignee);
		model.addAttribute("tbList", tbList);
		return "order/orderCall/orderCall";
	}
	
}
