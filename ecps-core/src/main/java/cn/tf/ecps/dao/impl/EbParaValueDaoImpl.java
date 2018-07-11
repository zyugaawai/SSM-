package cn.tf.ecps.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cn.tf.ecps.dao.EbParaValueDao;
import cn.tf.ecps.po.EbParaValue;



@Repository
public class EbParaValueDaoImpl extends SqlSessionDaoSupport implements EbParaValueDao {

	String ns = "cn.tf.ecps.mapper.EbParaValueMapper.";

	public void saveParaValue(List<EbParaValue> paraList, Long itemId) {
		//获得到连接
		SqlSession session = this.getSqlSession();
		for(EbParaValue ev : paraList){
			ev.setItemId(itemId);
			session.insert(ns+"insert", ev);
		}
	}

	
	
}
