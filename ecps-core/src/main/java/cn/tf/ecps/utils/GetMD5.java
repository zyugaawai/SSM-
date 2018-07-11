package cn.tf.ecps.utils;

import org.springframework.util.DigestUtils;

public class GetMD5 {
	
	public static  String getMD5(long seckillId) {
        String base = seckillId + "/" + ECPSUtil.readProp("slat");
        String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
        return md5;
  }


}
