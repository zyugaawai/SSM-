package cn.tf.ecps.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tf.ecps.po.EbCart;

public interface EbCartService {
	/**
	 * 添加购物车
	 * @param skuId
	 * @param quantity
	 * @param request
	 * @param response
	 */
	public void addCart(Long skuId, Integer quantity, 
			HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 查询购物车
	 * 
	 * @param request
	 * @param response
	 */
	public List<EbCart> selectCart(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 
	 * 修改购物车
	 * 
	 * @param skuId
	 * @param quantity
	 * @param request
	 * @param response
	 */
	public void updateCart(Long skuId, Integer quantity, 
			HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 删除购物车
	 * 
	 * @param skuId
	 * @param request
	 * @param response
	 */
	public void delCart(Long skuId,
			HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 清空购物车
	 * 
	 * @param request
	 * @param response
	 */
	public void clearCart(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 验证购物车的库存
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	public String validCart(HttpServletRequest  request,HttpServletResponse response);
	
	
	
}
