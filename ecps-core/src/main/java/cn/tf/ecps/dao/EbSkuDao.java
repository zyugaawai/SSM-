package cn.tf.ecps.dao;

import java.util.List;
import java.util.Map;

import cn.tf.ecps.po.EbSku;



public interface EbSkuDao {

	
	public EbSku getSkuById(Long skuId);

	public void saveSku(List<EbSku> skuList, Long itemId);

	public EbSku getSkuDetail(Long skuId);
	
	
	public EbSku getSkuDetailWithRedis(Long skuId);

	public int updateStock(Map<String, Object> map);
	//修改redis中的数据库存
	public void updateRedisStock(Long skuId, Integer quantity);
}
