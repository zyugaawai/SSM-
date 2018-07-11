package cn.tf.ecps.dao;

import cn.tf.ecps.po.EbOrder;

public interface EbOrderDao {
	
	public void saveOrder(EbOrder order);

	public void updateOrder(EbOrder order);

	public EbOrder getOrderById(Long orderId);

	public EbOrder selectOrderAndDetailById(Long orderId);

}
