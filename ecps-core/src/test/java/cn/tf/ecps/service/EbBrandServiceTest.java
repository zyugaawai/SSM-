package cn.tf.ecps.service;

import static org.junit.Assert.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.quartz.plugins.management.ShutdownHookPlugin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import redis.clients.jedis.Jedis;

import cn.tf.ecps.dao.EbItemDao;
import cn.tf.ecps.dao.EbSkuDao;
import cn.tf.ecps.po.EbBrand;
import cn.tf.ecps.po.EbItem;
import cn.tf.ecps.po.EbShipAddrBean;
import cn.tf.ecps.po.EbSku;
import cn.tf.ecps.po.EbSpecValue;
import cn.tf.ecps.utils.ECPSUtil;
import cn.tf.ecps.utils.FMutil;


/*@RunWith(SpringJUnit4ClassRunner.class)//指定juit的spring运行器
@ContextConfiguration(locations={"classpath:beans.xml"})//指定spring的文件
*/
public class EbBrandServiceTest {

	@Autowired
	private EbBrandService brandService;
	

/*	@Test
	public void testSaveBrand() {
		EbBrand brand=new EbBrand();
		brand.setBrandName("苹果8");
		brand.setBrandDesc("最新版");
		brand.setBrandSort(1);
		brand.setImgs("http://taotao.tianfang1314.cn");
		brand.setWebsite("http://taotao.tianfang1314.cn");
		brandService.saveBrand(brand);
	
	}*/
	@Autowired
	private EbItemService itemService;
	@Autowired
	private EbSkuDao  skuDao;
	

	//@Test
	public void testGeneraHtml() throws Exception {
		Map<String,Object>  map=new HashMap<String,Object> ();
		EbItem item=itemService.selectItemDetailById(3080);
		map.put("item", item);
		
		map.put("path", ECPSUtil.readProp("portal_path"));
		map.put("file_path", ECPSUtil.readProp("FILE_PATH"));
		FMutil fm=new FMutil();

	     fm.ouputFile("productDetail.ftl", item.getItemId()+".html", map);
	
	}
	

	
	//@Test
	public  void importDataRedis() {
		String host = ECPSUtil.readProp("redis_path");
		String port = ECPSUtil.readProp("redis_port");
		Jedis je = new Jedis(host, new Integer(port));
		for(int i = 3080; i <= 3089; i++){
			
			
			EbSku sku = skuDao.getSkuDetail(new Long(i));
			//把sku的Id放入skuList中
			je.lpush("skuList", sku.getSkuId()+"");
			//存储sku这条数据
			je.hset("sku:"+sku.getSkuId(), "skuId", sku.getSkuId()+"");
			je.hset("sku:"+sku.getSkuId(), "itemId", sku.getItemId()+"");
			je.hset("sku:"+sku.getSkuId(), "skuPrice", sku.getSkuPrice()+"");
			je.hset("sku:"+sku.getSkuId(), "stockInventory", sku.getStockInventory()+"");
			je.hset("sku:"+sku.getSkuId(), "marketPrice", sku.getMarketPrice()+"");
			
			//存储商品信息
			je.hset("sku:item:"+sku.getItem().getItemId(), "itemId", sku.getItem().getItemId()+"");
			je.hset("sku:item:"+sku.getItem().getItemId(), "itemName", sku.getItem().getItemName()+"");
			je.hset("sku:item:"+sku.getItem().getItemId(), "itemNo", sku.getItem().getItemNo()+"");
			je.hset("sku:item:"+sku.getItem().getItemId(), "imgs", sku.getItem().getImgs()+"");
			
			//sku中的规格组合存储到redis中
			List<EbSpecValue> specList = sku.getSpecList();
			
			for(EbSpecValue spec: specList){
				je.lpush("specList", spec.getSpecId()+"");
				je.hset("sku:"+spec.getSkuId()+"spec:"+spec.getSpecId(), "specId", spec.getSpecId()+"");
				je.hset("sku:"+spec.getSkuId()+"spec:"+spec.getSpecId(), "skuId", spec.getSkuId()+"");
				je.hset("sku:"+spec.getSkuId()+"spec:"+spec.getSpecId(), "specValue", spec.getSpecValue()+"");
			}
			
		}
		
		je.close();
		
	}
	
	//@Test
	public void getDateFromRedis() throws Exception {
		Long skuId = 3082l;
		String host = ECPSUtil.readProp("redis_path");
		String port = ECPSUtil.readProp("redis_port");
		Jedis je = new Jedis(host, new Integer(port));
		String skuPrice = je.hget("sku:"+skuId, "skuPrice");
		String marketPrice = je.hget("sku:"+skuId, "marketPrice");
		String stockInventory = je.hget("sku:"+skuId, "stockInventory");
		String itemId = je.hget("sku:"+skuId, "itemId");
		EbSku sku = new EbSku();
		if(StringUtils.isNotBlank(marketPrice)&&!StringUtils.equals(marketPrice, "null")){
			sku.setMarketPrice(new BigDecimal(marketPrice));
		}
		sku.setSkuPrice(new BigDecimal(skuPrice));
		sku.setItemId(new Long(itemId));
		sku.setSkuId(skuId);
		sku.setStockInventory(new Integer(stockInventory));
		
		//获得sku对象中的商品
		String itemName=  je.hget("sku:item:"+itemId, "itemName");
		String itemNo=  je.hget("sku:item:"+itemId, "itemNo");
		String imgs=  je.hget("sku:item:"+itemId, "imgs");
		EbItem item = new EbItem();
		item.setItemId(new Long(itemId));
		item.setItemName(itemName);
		item.setItemNo(itemNo);
		item.setImgs(imgs);
		
		sku.setItem(item);
		//获得sku的规格信息
		List<String> array = je.lrange("specList", 0, -1);
		List<EbSpecValue> specList = new ArrayList<EbSpecValue>();
		//获得sku的规格信息
		for(String specId: array){
			
			String specValue = je.hget("sku:"+skuId+"spec:"+specId, "specValue");
			if(StringUtils.isNotBlank(specValue)){
				EbSpecValue spec = new EbSpecValue();
				spec.setSpecValue(specValue);
				spec.setSkuId(skuId);
				specList.add(spec);
			}
		}
		sku.setSpecList(specList);
		
	}
	
	@Autowired
	private EbShipAddrService addrService;
	
	//@Test
	public void importAddrList(){
		
		String host = ECPSUtil.readProp("redis_path");
		String port = ECPSUtil.readProp("redis_port");
		Jedis je = new Jedis(host, new Integer(port));
		
		List<EbShipAddrBean> addrList = addrService.selectAddrByUserId(3042l);
		for (EbShipAddrBean ebShipAddrBean : addrList) {
			//把用户id存进去
			je.lpush("ptl_user:3042l:addrList", ebShipAddrBean.getShipAddrId()+"");
			//把地址信息存储在hset中
			je.hset("ship_addr:"+ebShipAddrBean.getShipAddrId(),"shipAddrId",ebShipAddrBean.getShipAddrId()+"");
			je.hset("ship_addr:"+ebShipAddrBean.getShipAddrId(), "shipName", ebShipAddrBean.getShipName()+"");
			je.hset("ship_addr:"+ebShipAddrBean.getShipAddrId(), "province", ebShipAddrBean.getProvince()+"");
			je.hset("ship_addr:"+ebShipAddrBean.getShipAddrId(), "city", ebShipAddrBean.getCity()+"");
			je.hset("ship_addr:"+ebShipAddrBean.getShipAddrId(), "district", ebShipAddrBean.getDistrict()+"");
			je.hset("ship_addr:"+ebShipAddrBean.getShipAddrId(), "addr", ebShipAddrBean.getAddr()+"");
			je.hset("ship_addr:"+ebShipAddrBean.getShipAddrId(), "zipCode", ebShipAddrBean.getZipCode()+"");
			je.hset("ship_addr:"+ebShipAddrBean.getShipAddrId(), "phone", ebShipAddrBean.getPhone()+"");
			je.hset("ship_addr:"+ebShipAddrBean.getShipAddrId(), "defaultAddr", ebShipAddrBean.getDefaultAddr()+"");
			je.hset("ship_addr:"+ebShipAddrBean.getShipAddrId(), "provText", ebShipAddrBean.getProvText()+"");
			je.hset("ship_addr:"+ebShipAddrBean.getShipAddrId(), "cityText", ebShipAddrBean.getCityText()+"");
			je.hset("ship_addr:"+ebShipAddrBean.getShipAddrId(), "distText", ebShipAddrBean.getDistText()+"");
		}
	}
		
		
}
	
	
