package cn.tf.ecps.dao.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import redis.clients.jedis.Jedis;

import cn.tf.ecps.dao.EbSkuDao;
import cn.tf.ecps.po.EbItem;
import cn.tf.ecps.po.EbSku;
import cn.tf.ecps.po.EbSpecValue;
import cn.tf.ecps.utils.ECPSUtil;



@Repository
public class EbSkuDaoImpl extends SqlSessionDaoSupport implements EbSkuDao {

	String ns = "cn.tf.ecps.mapper.EbSkuMapper.";
	String ns1 = "cn.tf.ecps.mapper.EbSpecValueMapper.";

	public void saveSku(List<EbSku> skuList, Long itemId) {
		SqlSession session = this.getSqlSession();
		for(EbSku sku : skuList){
			//设置itemId
			sku.setItemId(itemId);
			//保存sku并且返回skuId
			session.insert(ns+"insert", sku);
			List<EbSpecValue> specList = sku.getSpecList();
			for(EbSpecValue sv : specList){
				//设置skuId外键
				sv.setSkuId(sku.getSkuId());
				session.insert(ns1+"insert", sv);
			}
		}
	}

	public EbSku getSkuById(Long skuId) {
		return this.getSqlSession().selectOne(ns+"selectByPrimaryKey",skuId);
	}

	public EbSku getSkuDetail(Long skuId) {
		return this.getSqlSession().selectOne(ns+"getSkuDetail",skuId);
	}

	public EbSku getSkuDetailWithRedis(Long skuId) {
		String host=ECPSUtil.readProp("redis_path");
		String port=ECPSUtil.readProp("redis_port");
		Jedis  jedis=new Jedis(host,new Integer(port));
		
		String skuPrice=jedis.hget("sku:"+skuId, "skuPrice");
		String marketPrice = jedis.hget("sku:"+skuId, "marketPrice");
		String stockInventory = jedis.hget("sku:"+skuId, "stockInventory");
		String itemId = jedis.hget("sku:"+skuId, "itemId");
		EbSku sku = new EbSku();
		if(StringUtils.isNotBlank(marketPrice)&&!StringUtils.equals(marketPrice, "null")){
			sku.setMarketPrice(new BigDecimal(marketPrice));
		}
		sku.setSkuPrice(new BigDecimal(skuPrice));
		sku.setItemId(new Long(itemId));
		sku.setSkuId(skuId);
		sku.setStockInventory(new Integer(stockInventory));
		
		//获得sku对象中的商品
		String itemName=  jedis.hget("sku:item:"+itemId, "itemName");
		String itemNo=  jedis.hget("sku:item:"+itemId, "itemNo");
		String imgs=  jedis.hget("sku:item:"+itemId, "imgs");
		EbItem item = new EbItem();
		item.setItemId(new Long(itemId));
		item.setItemName(itemName);
		item.setItemNo(itemNo);
		item.setImgs(imgs);
		
		sku.setItem(item);
		List<EbSpecValue> specList = new ArrayList<EbSpecValue>();
		//获得sku的规格信息
		List<String> array = jedis.lrange("specList", 0, -1);
		for(String specId: array){
			
			String specValue = jedis.hget("sku:"+skuId+"spec:"+specId, "specValue");
			if(StringUtils.isNotBlank(specValue)){
				EbSpecValue spec = new EbSpecValue();
				spec.setSpecValue(specValue);
				spec.setSkuId(skuId);
				specList.add(spec);
			}
		}
		sku.setSpecList(specList);
		return sku;
	}

	public int updateStock(Map<String, Object> map) {
		return this.getSqlSession().update(ns+"updateStock", map);
	}

	/**
	 * 在redis中set方法时单线程，不以避免并发的问题
	 */
	public void updateRedisStock(Long skuId, Integer quantity) {
		String host = ECPSUtil.readProp("redis_path");
		String port = ECPSUtil.readProp("redis_port");
		Jedis je = new Jedis(host, new Integer(port));
		je.hset("sku:"+skuId, "stockInventory", new Integer(je.hget("sku:"+skuId,"stockInventory")) - quantity+"");
	}

}

