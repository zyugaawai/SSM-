package cn.tf.ecps.service.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import redis.clients.jedis.Jedis;



import cn.tf.ecps.dao.EbBrandDao;
import cn.tf.ecps.dao.EbShipAddrDao;
import cn.tf.ecps.dao.EbSkuDao;
import cn.tf.ecps.dao.TsPtlUserDao;
import cn.tf.ecps.po.EbBrand;
import cn.tf.ecps.po.EbShipAddr;
import cn.tf.ecps.po.EbShipAddrBean;
import cn.tf.ecps.po.EbSku;
import cn.tf.ecps.po.TsPtlUser;
import cn.tf.ecps.service.EbBrandService;
import cn.tf.ecps.service.EbShipAddrService;
import cn.tf.ecps.service.EbSkuService;
import cn.tf.ecps.service.TsPtlUserService;
import cn.tf.ecps.utils.ECPSUtil;
import cn.tf.ecps.utils.MD5;


@Service
public class EbSkuServiceImpl implements EbSkuService {
	
	@Autowired
	private EbSkuDao skuDao;

	public EbSku getSkuById(Long skuId) {
		return skuDao.getSkuById(skuId);
	}

	public EbSku getSkuByIdWithRedis(Long skuId) {
		
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
		return sku;
	}

	
	
	

}
