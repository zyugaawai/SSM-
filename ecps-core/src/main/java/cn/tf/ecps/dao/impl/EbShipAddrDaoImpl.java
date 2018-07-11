package cn.tf.ecps.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cn.tf.ecps.dao.EbShipAddrDao;
import cn.tf.ecps.dao.EbSkuDao;
import cn.tf.ecps.dao.TsPtlUserDao;
import cn.tf.ecps.po.EbShipAddr;
import cn.tf.ecps.po.EbShipAddrBean;
import cn.tf.ecps.po.EbSku;
import cn.tf.ecps.po.EbSpecValue;
import cn.tf.ecps.po.TsPtlUser;



@Repository
public class EbShipAddrDaoImpl extends SqlSessionDaoSupport implements EbShipAddrDao {

	String ns = "cn.tf.ecps.mapper.EbShipAddrMapper.";

	public List<EbShipAddrBean> selectAddrByUserId(Long userId) {
		return this.getSqlSession().selectList(ns+"selectAddrByUserId",userId);
	}


	public EbShipAddr selectAddrById(Long shipAddrId) {
		return this.getSqlSession().selectOne(ns+"selectByPrimaryKey",shipAddrId);
	}


	public void saveAddr(EbShipAddr addr) {
		this.getSqlSession().insert(ns+"insert",addr);
	}


	public void updateAddr(EbShipAddr addr) {
	 this.getSqlSession().update(ns+"updateByPrimaryKeySelective",addr);	
	}


	public void updateDefaultAddr(Long userId) {
		this.getSqlSession().update(ns+"updateDefaultAddr",userId);	
	}


	public int  deleteAddr(Long id) {
		return this.getSqlSession().delete(ns+"deleteByPrimaryKey",id);	
		
	}
	
}
