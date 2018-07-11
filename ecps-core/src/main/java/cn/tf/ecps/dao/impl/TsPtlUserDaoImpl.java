package cn.tf.ecps.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cn.tf.ecps.dao.EbSkuDao;
import cn.tf.ecps.dao.TsPtlUserDao;
import cn.tf.ecps.po.EbSku;
import cn.tf.ecps.po.EbSpecValue;
import cn.tf.ecps.po.TsPtlUser;



@Repository
public class TsPtlUserDaoImpl extends SqlSessionDaoSupport implements TsPtlUserDao {

	String ns = "cn.tf.ecps.mapper.TsPtlUserMapper.";



	public TsPtlUser selectUserByUserPass(Map<String, String> map) {
		return this.getSqlSession().selectOne(ns+"selectUserByUserPass",map);
	}

	
	
}
