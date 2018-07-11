package cn.tf.ecps.dao;

import java.util.List;

import cn.tf.ecps.po.EbParaValue;



public interface EbParaValueDao {
	
	
	
	public void saveParaValue(List<EbParaValue> paraList, Long itemId);
	
	
}
