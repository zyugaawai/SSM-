package cn.tf.ecps.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cn.tf.ecps.dao.EbAreaDao;
import cn.tf.ecps.dao.EbShipAddrDao;
import cn.tf.ecps.dao.EbSkuDao;
import cn.tf.ecps.dao.TsPtlUserDao;
import cn.tf.ecps.po.EbArea;
import cn.tf.ecps.po.EbShipAddrBean;
import cn.tf.ecps.po.EbSku;
import cn.tf.ecps.po.EbSpecValue;
import cn.tf.ecps.po.TsPtlUser;



@Repository
public class EbAreaDaoImpl extends SqlSessionDaoSupport implements EbAreaDao {

	String ns = "cn.tf.ecps.mapper.EbAreaMapper.";

	public List<EbArea> selectAreaByParentId(Long areaId) {
		return this.getSqlSession().selectList(ns+"selectAreaByParentId",areaId);
	}

	
	
}
