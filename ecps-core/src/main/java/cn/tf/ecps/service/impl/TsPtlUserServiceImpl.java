package cn.tf.ecps.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import cn.tf.ecps.dao.EbBrandDao;
import cn.tf.ecps.dao.TsPtlUserDao;
import cn.tf.ecps.po.EbBrand;
import cn.tf.ecps.po.TsPtlUser;
import cn.tf.ecps.service.EbBrandService;
import cn.tf.ecps.service.TsPtlUserService;
import cn.tf.ecps.utils.MD5;


@Service
public class TsPtlUserServiceImpl implements TsPtlUserService {
	
	@Autowired
	private TsPtlUserDao tsPtlUserDao;

	public TsPtlUser selectUserByUserPass(Map<String, String> map) {
		return tsPtlUserDao.selectUserByUserPass(map);
	}
	
	

}
