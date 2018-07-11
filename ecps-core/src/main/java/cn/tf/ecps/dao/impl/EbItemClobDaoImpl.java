package cn.tf.ecps.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cn.tf.ecps.dao.EbFeatureDao;
import cn.tf.ecps.dao.EbItemClobDao;
import cn.tf.ecps.dao.EbItemDao;
import cn.tf.ecps.po.EbFeature;
import cn.tf.ecps.po.EbItem;
import cn.tf.ecps.po.EbItemClob;
import cn.tf.ecps.utils.QueryCondition;

@Repository
public class EbItemClobDaoImpl extends SqlSessionDaoSupport implements EbItemClobDao {

	String ns = "cn.tf.ecps.mapper.EbItemClobMapper.";


	public void saveItemClob(EbItemClob itemClob) {
		this.getSqlSession().insert(ns+"insert", itemClob);	
	}
	
	
}

