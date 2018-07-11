package cn.tf.ecps.service;

import java.util.List;

import cn.tf.ecps.po.EbArea;
import cn.tf.ecps.po.EbShipAddrBean;

public interface EbAreaService {
	
	public List<EbArea>  selectAreaByParentId(Long areaId);

}
