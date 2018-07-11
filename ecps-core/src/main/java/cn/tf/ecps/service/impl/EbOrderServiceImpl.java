package cn.tf.ecps.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import cn.tf.ecps.dao.EbBrandDao;
import cn.tf.ecps.dao.EbOrderDao;
import cn.tf.ecps.dao.EbOrderDetailDao;
import cn.tf.ecps.dao.EbSkuDao;
import cn.tf.ecps.dao.TsPtlUserDao;
import cn.tf.ecps.exception.EbStockException;
import cn.tf.ecps.po.EbBrand;
import cn.tf.ecps.po.EbOrder;
import cn.tf.ecps.po.EbOrderDetail;
import cn.tf.ecps.po.EbSku;
import cn.tf.ecps.po.TaskBean;
import cn.tf.ecps.po.TsPtlUser;
import cn.tf.ecps.service.EbBrandService;
import cn.tf.ecps.service.EbCartService;
import cn.tf.ecps.service.EbOrderService;
import cn.tf.ecps.service.FlowService;
import cn.tf.ecps.service.TsPtlUserService;
import cn.tf.ecps.utils.MD5;


@Service
public class EbOrderServiceImpl implements EbOrderService {
	
	@Autowired
	private EbOrderDao orderDao;
	
	@Autowired
	private EbOrderDetailDao detailDao;
	
	@Autowired
	private EbSkuDao skuDao;

	@Autowired
	private EbCartService cartService;
	
	@Autowired
	private FlowService flowService;
	
	
	
	public String  saveOrder(EbOrder order, List<EbOrderDetail> detailList,
			HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> map = new HashMap<String,Object>();
		//保存订单并且返回orderId
		orderDao.saveOrder(order);
		for(EbOrderDetail detail: detailList){
			detail.setOrderId(order.getOrderId());
			detailDao.saveDetail(detail);
			
			
			map.put("skuId", detail.getSkuId());
			map.put("quantity", detail.getQuantity());
			int flag = skuDao.updateStock(map);
			
			if(flag == 0){
				throw new EbStockException("stock_error");
			}
			//修改redis中的数据库存
			skuDao.updateRedisStock(detail.getSkuId(), detail.getQuantity());
		}
		
		//String processInstanceId=flowService.startFlow(order.getOrderId());
		cartService.clearCart(request, response);
		return null /*processInstanceId*/;
	}



	public void updatePay(String processInstanceId, Long orderId) {
		EbOrder order=new EbOrder();
		order.setOrderId(orderId);
		order.setIsPaid((short)1);
		orderDao.updateOrder(order);
		//flowService.compeleteTaskByPid(processInstanceId, "付款");
		
	}



	public List<TaskBean> selectOrderPay(String assignee, Short isCall) {
		List<TaskBean> tbList = flowService.selectTaskByAssignee(assignee);
		List<TaskBean> tbList1 = new ArrayList<TaskBean>();
		
		for(TaskBean tb : tbList){
			//获得业务键，从而查询到订单
			String businessKey = tb.getBusinessKey();
			EbOrder order = orderDao.getOrderById(new Long(businessKey));
			if(isCall != null){
				if(order.getIsCall().shortValue() == isCall.shortValue()){
					tb.setOrder(order);
					tbList1.add(tb);
				}
			}else{
				tb.setOrder(order);
				tbList1.add(tb);
			}
			
		}
		
		return tbList1;
	}



	public TaskBean selectTaskOrderBeanById(Long orderId, String taskId) {
		EbOrder order = orderDao.selectOrderAndDetailById(orderId);
		TaskBean tb = flowService.selectTaskBeanByTId(taskId);
		tb.setOrder(order);
		return tb;
	}
	
	
	public void noPaidCall(Long orderId) {
		EbOrder order = new EbOrder();
		order.setOrderId(orderId);
		order.setIsCall((short)1);
		orderDao.updateOrder(order);
	}

	public List<TaskBean> selectOrderCall(String assignee) {
		List<TaskBean> tbList = flowService.selectTaskByAssignee(assignee);
		
		for(TaskBean tb : tbList){
			//获得业务键，从而查询到订单
			String businessKey = tb.getBusinessKey();
			EbOrder order = orderDao.getOrderById(new Long(businessKey));
			tb.setOrder(order);
		}
		
		return tbList;
		
	}

	public void completeTask(Long orderId, String taskId, String outcome) {
		EbOrder order = new EbOrder();
		order.setOrderId(orderId);
		order.setUpdateTime(new Date());
		orderDao.updateOrder(order);
		flowService.completeTaskByTid(taskId, outcome);
	}
	



}
