package cn.tf.ecps.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cn.tf.ecps.dao.EbOrderDetailDao;
import cn.tf.ecps.po.EbOrderDetail;

import redis.clients.jedis.Jedis;



@Repository
public class EbOrderDetailDaoImpl extends SqlSessionDaoSupport implements EbOrderDetailDao {

	String ns = "cn.tf.ecps.mapper.EbOrderDetailMapper.";

	public void saveDetail(EbOrderDetail detail) {
		this.getSqlSession().insert(ns+"insert", detail);
	}



	
}
