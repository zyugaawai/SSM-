package cn.tf.ecps.controller;

import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import cn.tf.ecps.exception.EbStockException;
import cn.tf.ecps.po.EbArea;
import cn.tf.ecps.po.EbCart;
import cn.tf.ecps.po.EbOrder;
import cn.tf.ecps.po.EbOrderDetail;
import cn.tf.ecps.po.EbShipAddr;
import cn.tf.ecps.po.EbShipAddrBean;
import cn.tf.ecps.po.EbSpecValue;
import cn.tf.ecps.po.TsPtlUser;
import cn.tf.ecps.service.EbAreaService;
import cn.tf.ecps.service.EbCartService;
import cn.tf.ecps.service.EbOrderService;
import cn.tf.ecps.service.EbShipAddrService;



@Controller
@RequestMapping("/order")
public class EbOrderController {
	
	@Autowired
	private EbShipAddrService addrService;
	@Autowired
	private EbCartService cartService;
	@Autowired
	private EbOrderService orderService;
	@Autowired
	private EbAreaService areaService;
	
	@RequestMapping("/toSubmitOrder.do")
	public String toSubmitOrder(HttpServletRequest request,HttpServletResponse response,
			HttpSession session,Model model){
		TsPtlUser  userId=(TsPtlUser) session.getAttribute("user");
		
		List<EbShipAddrBean> addrList = addrService.selectAddrByUserIdWithRedis(userId.getPtlUserId());
		model.addAttribute("addrList",addrList);
		
		//查询购物车的数据
		List<EbCart> cartList = cartService.selectCart(request, response);
		model.addAttribute("cartList",cartList);
		Integer itemNum=0;
		BigDecimal totalPrice = new BigDecimal(0);
		for (EbCart cart : cartList) {
			//计算商品数量
			itemNum = cart.getQuantity() + itemNum;
			//计算商品总金额，不会损失精度
			totalPrice = totalPrice.add(cart.getSku().getSkuPrice().multiply(new BigDecimal(cart.getQuantity())));
		}
		model.addAttribute("itemNum", itemNum);
		model.addAttribute("totalPrice", totalPrice);
		
		
		//查询省市级联的地址
		List<EbArea> aList = areaService.selectAreaByParentId(0l);
		model.addAttribute("aList",aList);
		
		
		return "shop/confirmProductCase";
	}
	
	//提交订单
	@RequestMapping("/submitOrder.do")
	public String submitOrder(Model model,String address,EbOrder order, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IllegalAccessException, Exception{
		TsPtlUser user = (TsPtlUser) session.getAttribute("user");
		
		order.setUsername(user.getUsername());
		//订单号使用时间戳
		order.setOrderNum(new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()));
		//如果address不等于add说明address传递过来的是shipAddrId
		if(!StringUtils.equals(address, "add")){
			//根据地址id在redis 中查询收货地址对象
			EbShipAddr addr = addrService.selectAddrByIdWithRedis(new Long(address));
			BeanUtils.copyProperties(order, addr);
		}
		order.setPtlUserId(user.getPtlUserId());
		//订单明细数据组装
		List<EbCart> cartList = cartService.selectCart(request, response);
		List<EbOrderDetail> detailList = new ArrayList<EbOrderDetail>();
		for(EbCart cart: cartList){
			EbOrderDetail detail = new EbOrderDetail();
			detail.setItemId(cart.getSku().getItem().getItemId());
			detail.setItemNo(cart.getSku().getItem().getItemNo());
			detail.setItemName(cart.getSku().getItem().getItemName());
			detail.setSkuId(cart.getSkuId());
			//组装商品规格信息
			String skuSpec = "";
			List<EbSpecValue> specList = cart.getSku().getSpecList();
			for(EbSpecValue spec: specList){
				skuSpec = skuSpec + spec.getSpecValue()+",";
			}
			skuSpec = skuSpec.substring(0, skuSpec.length() - 1);
			detail.setSkuSpec(skuSpec);
			detail.setSkuPrice(cart.getSku().getSkuPrice());
			detail.setMarketPrice(cart.getSku().getMarketPrice());
			detail.setQuantity(cart.getQuantity());
			detailList.add(detail);
		}
		
		try {
			String processInstanceId = orderService.saveOrder(order, detailList, request, response);
			
			//把流程实例的id存到session中以便于支付的时候来完成任务
			session.setAttribute("processInstanceId", processInstanceId);
			model.addAttribute("order", order);
		} catch (Exception e) {
			if(e instanceof EbStockException){
				model.addAttribute("tip", "stock_error");
			}
		}
		
		return "shop/confirmProductCase2";
	}
	
	/**
	 * 支付
	 * @param session
	 * @param orderId
	 * @param out
	 */
	@RequestMapping("/pay.do")
	public void pay(HttpSession session, Long orderId, PrintWriter out){
		String processInstanceId = (String) session.getAttribute("processInstanceId");
		orderService.updatePay(processInstanceId, orderId);
		out.write("success");
	}
	
	
	

}
