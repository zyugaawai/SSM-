package cn.tf.ecps.dao;

import java.util.List;

import cn.tf.ecps.po.EbShipAddr;
import cn.tf.ecps.po.EbShipAddrBean;

public interface EbShipAddrDao {
	
	public List<EbShipAddrBean>  selectAddrByUserId(Long userId);

	public EbShipAddr selectAddrById(Long shipAddrId);
	
	public void saveAddr(EbShipAddr addr);
	
	public void updateAddr(EbShipAddr addr);
	
	//更新默认收货地址
	public void updateDefaultAddr(Long userId);

	public int deleteAddr(Long id);
}
