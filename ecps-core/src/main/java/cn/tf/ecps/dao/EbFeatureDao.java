package cn.tf.ecps.dao;

import java.util.List;

import cn.tf.ecps.po.EbFeature;

public interface EbFeatureDao {
	// 查询普通属性 
	public List<EbFeature>  selectCommFeature();
	
	//查询特殊属性
	public List<EbFeature>  selectSpecFeature();
	
	//查询筛选属性
	public List<EbFeature>  selectIsSelectFeature();

	public List<EbFeature> selectCommFeatureByItemId(Long itemId);
	

}
