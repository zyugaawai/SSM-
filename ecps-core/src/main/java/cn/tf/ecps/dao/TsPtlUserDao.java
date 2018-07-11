package cn.tf.ecps.dao;

import java.util.List;
import java.util.Map;

import cn.tf.ecps.po.EbSku;
import cn.tf.ecps.po.TsPtlUser;



public interface TsPtlUserDao {

	public TsPtlUser selectUserByUserPass(Map<String,String>  map);
	
	
}
