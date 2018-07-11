package cn.tf.ecps.service;

import java.util.List;

import cn.tf.ecps.po.EbFeature;

public interface EbFeatureService {
	// 查询普通属性 
		public List<EbFeature>  selectCommFeature();
		
		//查询特殊属性
		public List<EbFeature>  selectSpecFeature();

		public List<EbFeature> selectIsSelectFeature();

		public List<EbFeature> selectCommFeatureByItemId(Long itemId);

}
