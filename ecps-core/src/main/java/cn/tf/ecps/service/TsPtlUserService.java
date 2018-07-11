package cn.tf.ecps.service;

import java.util.List;
import java.util.Map;

import cn.tf.ecps.po.EbSku;
import cn.tf.ecps.po.TsPtlUser;



public interface TsPtlUserService {

	public TsPtlUser selectUserByUserPass(Map<String,String>  map);
	
	
}
