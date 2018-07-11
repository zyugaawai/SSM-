package cn.tf.ecps.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.compass.core.json.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tf.ecps.po.EbBrand;
import cn.tf.ecps.po.EbFeature;
import cn.tf.ecps.po.EbItem;
import cn.tf.ecps.po.EbSku;
import cn.tf.ecps.service.EbBrandService;
import cn.tf.ecps.service.EbFeatureService;
import cn.tf.ecps.service.EbItemService;
import cn.tf.ecps.service.EbSkuService;
import cn.tf.ecps.utils.ECPSUtil;
import cn.tf.ecps.utils.Page;
import cn.tf.ecps.utils.QueryCondition;

@Controller
@RequestMapping("/item")
public class EbItemController {

	@Autowired
	private EbItemService itemService;
	@Autowired
	private EbBrandService brandService;

	@Autowired
	private EbFeatureService featureService;
	@Autowired
	private EbSkuService skuService;

	// 进入主页面
	@RequestMapping("/toIndex.do")
	public String toIndex(Model model) {
		// 查询品牌
		List<EbBrand> bList = brandService.selectBrandAll();
		model.addAttribute("bList", bList);
		// 查询筛选属性
		List<EbFeature> fList = featureService.selectIsSelectFeature();
		model.addAttribute("fList", fList);

		return "index";
	}

	// 商品列表查询
	@RequestMapping("/listItem.do")
	public String listItem(String price, Long brandId, String paraList,Model model){
		
		List<EbItem> itemList = itemService.selectItemFont(price, brandId, paraList);
		model.addAttribute("itemList", itemList);
	
		return "phoneClassification";
	}
	
	//商品详情页
	@RequestMapping("/productDetail.do")
	public String productDetail(Long itemId,Model model) {
		EbItem item = itemService.selectItemDetailById(itemId);
		model.addAttribute("item",item);
		return "productDetail";
	}
	
	//最小单元
	@RequestMapping("/getSkuById.do")
	public void getSkuById(Long skuId,PrintWriter out){
		//EbSku sku = skuService.getSkuById(skuId);
		EbSku sku =skuService.getSkuByIdWithRedis(skuId);
		JSONObject json=new JSONObject();
		json.accumulate("sku", sku);
		String result=json.toString();
		out.write(result);
		
	}
	
	

}
