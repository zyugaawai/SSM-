package cn.tf.ecps.service;

import java.util.List;

import cn.tf.ecps.po.EbBrand;




public interface EbBrandService {
	
	/*//保存
	public void saveBrand(EbBrand brand);
	//查询
	public List<EbBrand> selectBrandAll();
	//通过商品名查询
	public List<EbBrand> validBrandName(String brandName);*/
	
	public void saveBrand(EbBrand brand);
	
	public List<EbBrand> selectBrandAll();
	
	public List<EbBrand> validBrandName(String brandName);

	//删除
	public int deleteBrand(Long id);

	//编辑品牌
	public EbBrand selectBrandByNo(Long id);

	public int updateBrand(EbBrand brand);

	//根据id查询商品品牌
	public EbBrand selectItemByNo(Long id);
	
	
 
}
