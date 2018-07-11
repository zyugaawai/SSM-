package cn.tf.ecps.dao;

import java.util.List;

import cn.tf.ecps.po.EbArea;
import cn.tf.ecps.po.EbShipAddrBean;

public interface EbAreaDao {
	
	public List<EbArea>  selectAreaByParentId(Long areaId);

}
