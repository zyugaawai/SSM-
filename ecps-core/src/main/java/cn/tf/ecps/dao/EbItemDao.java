package cn.tf.ecps.dao;

import java.util.List;
import java.util.Map;

import cn.tf.ecps.po.EbItem;
import cn.tf.ecps.utils.QueryCondition;

public interface EbItemDao {
	public List<EbItem>  selectItemByCondition(QueryCondition qc);
	
	public Integer selectItemByConditionCount(QueryCondition qc);

	public int deleteGoods(Long id);

	public EbItem selectItemByNo(Long id);
	
	public void saveItem(EbItem item);
	
	public void updateItem(EbItem item);

	public List<EbItem> listItem(Map<String, Object> map);
	
	public EbItem selectItemDetailById(long itemId);

}
