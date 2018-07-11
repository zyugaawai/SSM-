package cn.tf.ecps.service;

import java.util.List;

import cn.tf.ecps.po.EbBrand;
import cn.tf.ecps.po.EbItem;
import cn.tf.ecps.po.EbItemClob;
import cn.tf.ecps.po.EbParaValue;
import cn.tf.ecps.po.EbSku;
import cn.tf.ecps.utils.Page;
import cn.tf.ecps.utils.QueryCondition;



public interface EbItemService {
	
	
	public Page selectItemByCondition(QueryCondition qc);

	//删除商品
	public int deleteGoods(Long id);

	//通过itm_no查询
	public EbItem selectItemByNo(Long id);
	//保存商品信息
	public void saveItem(EbItem item,EbItemClob  itemClob,
			List<EbParaValue> paraList,List<EbSku> skuList);
	//商品审核
	public void auditItem(Long itemId,Short auditStatus,String notes);

	public void showItem(Long itemId, Short showStatus, String notes);

	public List<EbItem> selectItemFont(String price, Long brandId,
			String paraList);
	//商品详情查询
	public EbItem selectItemDetailById(long itemId);
	
	//调用接口
	public String publishItem(Long itemId,String password);

	public List<EbItem> selectItemFont(String price, Long brandId,
			String paraList, Object startNum, Object endNum);
 
}
