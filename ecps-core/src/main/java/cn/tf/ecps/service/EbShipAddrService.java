package cn.tf.ecps.service;

import java.util.List;

import cn.tf.ecps.po.EbShipAddr;
import cn.tf.ecps.po.EbShipAddrBean;
import cn.tf.ecps.po.TsPtlUser;

public interface EbShipAddrService {
	
	public List<EbShipAddrBean>  selectAddrByUserId(Long userId);

	public EbShipAddr selectAddrById(Long shipAddrId);
	
	public void saveOrUpdateAddr(EbShipAddr addr, TsPtlUser user);

	public int  deleteAddr(Long shipAddrId);
	
	public List<EbShipAddrBean>  selectAddrByUserIdWithRedis(Long userId);

	public EbShipAddr selectAddrByIdWithRedis(Long shipAddrId);
	
}
