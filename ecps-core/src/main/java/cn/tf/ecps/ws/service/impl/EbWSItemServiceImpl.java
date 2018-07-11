package cn.tf.ecps.ws.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import cn.tf.ecps.dao.EbItemDao;
import cn.tf.ecps.po.EbItem;
import cn.tf.ecps.service.EbItemService;
import cn.tf.ecps.utils.ECPSUtil;
import cn.tf.ecps.utils.FMutil;
import cn.tf.ecps.utils.GetMD5;
import cn.tf.ecps.ws.service.EbWSItemService;

@Service
public class EbWSItemServiceImpl  implements EbWSItemService {

	@Autowired
	private EbItemService itemService;
	
	
	public String publishItem(Long itemId, String password) {
		String isOK="success";
		
		String wsPass=GetMD5.getMD5(itemId);
		if(StringUtils.equals(password, wsPass)){
			//发布
			Map<String,Object>  map=new HashMap<String,Object> ();
			EbItem item=itemService.selectItemDetailById(itemId);
			map.put("item", item);
			
			map.put("path", ECPSUtil.readProp("portal_path"));
			map.put("file_path", ECPSUtil.readProp("FILE_PATH"));
			FMutil fm=new FMutil();
			try {
				fm.ouputFile("productDetail.ftl", item.getItemId()+".html", map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			isOK="fail";
		}
		
		return isOK;
	}
}
