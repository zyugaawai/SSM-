package cn.tf.ecps.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import cn.tf.ecps.dao.EbAreaDao;
import cn.tf.ecps.dao.EbBrandDao;
import cn.tf.ecps.dao.EbShipAddrDao;
import cn.tf.ecps.dao.TsPtlUserDao;
import cn.tf.ecps.po.EbArea;
import cn.tf.ecps.po.EbBrand;
import cn.tf.ecps.po.EbShipAddrBean;
import cn.tf.ecps.po.TsPtlUser;
import cn.tf.ecps.service.EbAreaService;
import cn.tf.ecps.service.EbBrandService;
import cn.tf.ecps.service.EbShipAddrService;
import cn.tf.ecps.service.TsPtlUserService;
import cn.tf.ecps.utils.MD5;


@Service
public class EbAreaServiceImpl implements EbAreaService {
	
	@Autowired
	private EbAreaDao areaDao;

	public List<EbArea> selectAreaByParentId(Long areaId) {
		return areaDao.selectAreaByParentId(areaId);
	}
	

}
