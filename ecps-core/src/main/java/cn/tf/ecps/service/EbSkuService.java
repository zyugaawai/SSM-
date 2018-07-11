package cn.tf.ecps.service;

import java.util.List;

import cn.tf.ecps.po.EbSku;



public interface EbSkuService {

	
	public EbSku getSkuById(Long skuId);
	
	public EbSku getSkuByIdWithRedis(Long skuId);
	
}
