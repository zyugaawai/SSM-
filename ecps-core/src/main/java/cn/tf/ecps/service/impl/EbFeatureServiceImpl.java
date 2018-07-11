package cn.tf.ecps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.tf.ecps.dao.EbFeatureDao;
import cn.tf.ecps.dao.EbItemDao;

import cn.tf.ecps.po.EbFeature;
import cn.tf.ecps.po.EbItem;
import cn.tf.ecps.service.EbFeatureService;
import cn.tf.ecps.service.EbItemService;
import cn.tf.ecps.utils.Page;
import cn.tf.ecps.utils.QueryCondition;

@Service
public class EbFeatureServiceImpl implements EbFeatureService {

	@Autowired
	private EbFeatureDao featureDao;

	public List<EbFeature> selectCommFeature() {	
		return featureDao.selectCommFeature();
	}

	public List<EbFeature> selectSpecFeature() {
		return featureDao.selectSpecFeature();
	}

	public List<EbFeature> selectIsSelectFeature() {
		
		return featureDao.selectIsSelectFeature();
	}

	public List<EbFeature> selectCommFeatureByItemId(Long itemId) {
		return featureDao.selectCommFeatureByItemId(itemId);
	}

}
