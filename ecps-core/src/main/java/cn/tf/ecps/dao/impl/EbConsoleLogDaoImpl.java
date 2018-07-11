package cn.tf.ecps.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cn.tf.ecps.dao.EbConsoleLogDao;
import cn.tf.ecps.dao.EbSkuDao;
import cn.tf.ecps.po.EbConsoleLog;
import cn.tf.ecps.po.EbSku;
import cn.tf.ecps.po.EbSpecValue;



@Repository
public class EbConsoleLogDaoImpl extends SqlSessionDaoSupport implements EbConsoleLogDao {

	String ns = "cn.tf.ecps.mapper.EbConsoleLogMapper.";

	public void saveLog(EbConsoleLog log) {
		this.getSqlSession().insert(ns+"insert",log);
		
	}

	
	
}
