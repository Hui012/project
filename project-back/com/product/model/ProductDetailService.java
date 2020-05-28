package com.product.model;

import java.util.List;

public class ProductDetailService {
	private ProductDetailDAO dao;
	
	public ProductDetailService() {
		dao = new ProductDetailDAO_JDBC();
	}
	
	public ProductDetailVO insert(ProductDetailVO productDetailVO, ProductVO productVO) {
		if(productDetailVO != null && productVO!= null) {
			ProductDetailVO pd = dao.insert(productDetailVO, productVO);
			return pd;
		}
		return null;
	}
	
	public Integer update(ProductDetailVO productDetailVO) {
		if(productDetailVO != null) {
			Integer count = dao.update(productDetailVO);
			return count;
		}
		return new Integer(-1);
	}
	
	public Integer delete(ProductDetailVO productDetailVO) {
		if(productDetailVO != null) {
			Integer count = dao.delete(productDetailVO.getProduct_Detail_ID());
			return count;
		}
		return new Integer(-1);
	}
	
	public ProductDetailVO select(ProductDetailVO productDetailVO) {
		if(productDetailVO != null) {
			ProductDetailVO productDetail = dao.select(productDetailVO.getProduct_Detail_ID());
			return productDetail;
		}
		return null;
	}
	
	public List<ProductDetailVO> getAll() {
		return dao.getAll();
	}
	

	public static void main(String[] args) {
		ProductDetailService service = new ProductDetailService();
//		ProductVO productVO = new ProductVO();
//		ProductDetailVO productDetailVO = new ProductDetailVO();
//		productDetailVO.setProduct_Detail_ID("PDID000001");
//		productDetailVO.setProduct_ID("PID000001");
//		productDetailVO.setProduct_Detail_Spc("8人房");
//		productDetailVO.setProduct_Detail_Money(30000);
//		productDetailVO.setProduct_Detail_Instock(100);
//		productDetailVO.setProduct_Detail_Saftystock(5);
//		productDetailVO.setProduct_Detail_Date(utils.ChangeDateFormate.ChangeDateFormate_Dash("2020-02-30"));
//
//		System.out.println(service.insert(productDetailVO, productVO));
//		System.out.println(service.update(productDetailVO));
////		System.out.println(service.delete(productDetailVO));
//		System.out.println(service.select(productDetailVO));
//		service.getAll().forEach(System.out::println);

	}
}
