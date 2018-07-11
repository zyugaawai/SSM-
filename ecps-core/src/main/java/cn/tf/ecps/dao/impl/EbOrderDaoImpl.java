package cn.tf.ecps.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cn.tf.ecps.dao.EbOrderDao;
import cn.tf.ecps.po.EbOrder;



@Repository
public class EbOrderDaoImpl extends SqlSessionDaoSupport implements EbOrderDao {

	String ns = "cn.tf.ecps.mapper.EbOrderMapper.";

	public void saveOrder(EbOrder order) {
		this.getSqlSession().insert(ns+"insert", order);
	}

	public void updateOrder(EbOrder order) {
		this.getSqlSession().update(ns+"updateByPrimaryKeySelective", order);
		
	}

	public EbOrder getOrderById(Long orderId) {
		return this.getSqlSession().selectOne(ns+"selectByPrimaryKey", orderId);
		
	}

	public EbOrder selectOrderAndDetailById(Long orderId) {
		return this.getSqlSession().selectOne(ns+"selectOrderAndDetailById", orderId);
	}

	

	
}
