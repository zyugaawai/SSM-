package cn.tf.ecps.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cn.tf.ecps.dao.EbFeatureDao;
import cn.tf.ecps.dao.EbItemDao;
import cn.tf.ecps.po.EbFeature;
import cn.tf.ecps.po.EbItem;
import cn.tf.ecps.utils.QueryCondition;

@Repository
public class EbFeatureDaoImpl extends SqlSessionDaoSupport implements EbFeatureDao {

	String ns = "cn.tf.ecps.mapper.EbFeatureMapper.";



	public List<EbFeature> selectCommFeature() {
		return this.getSqlSession().selectList(ns+"selectCommFeature");
	}

	public List<EbFeature> selectSpecFeature() {
		return this.getSqlSession().selectList(ns+"selectSpecFeature");
	}

	public List<EbFeature> selectIsSelectFeature() {
		return this.getSqlSession().selectList(ns+"selectIsSelectFeature");
	}

	public List<EbFeature> selectCommFeatureByItemId(Long itemId) {
		return this.getSqlSession().selectList(ns+"selectCommFeatureByItemId",itemId);
	}
	
	
}

