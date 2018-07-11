package cn.tf.ecps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import cn.tf.ecps.dao.EbBrandDao;
import cn.tf.ecps.po.EbBrand;
import cn.tf.ecps.service.EbBrandService;


@Service
public class EbBrandServiceImpl implements EbBrandService {
	
	@Autowired
	private EbBrandDao brandDao;
	
	public void saveBrand(EbBrand brand) {
		brandDao.saveBrand(brand);
	}

	public List<EbBrand> selectBrandAll() {
		return brandDao.selectBrandAll();
	}

	public List<EbBrand> validBrandName(String brandName) {
		return brandDao.validBrandName(brandName);
	}

	//删除
	public int deleteBrand(Long id) {
		return brandDao.deleteBrand(id);
		
	}

	public EbBrand selectBrandByNo(Long id) {
		return brandDao.selectBrandByNo(id);
	}

	public int updateBrand(EbBrand brand) {
		return brandDao.updateBrand(brand);
		
	}

	public EbBrand selectItemByNo(Long id) {
		return brandDao.selectBrandByNo(id);
	}   

	

}
