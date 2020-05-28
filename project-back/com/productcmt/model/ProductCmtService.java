package com.productcmt.model;

import java.util.List;

public class ProductCmtService {
	private ProductCmtDAO dao;

	public ProductCmtService() {
		dao = new ProductCmtDAO_JDBC();
	}
	
	public ProductCmtVO insert(ProductCmtVO productCmtVO) {
		ProductCmtVO cmtVO = null;
		if(productCmtVO != null) {
			cmtVO = dao.insert(productCmtVO);
		}
		return cmtVO;
	}
	
	public ProductCmtVO update(ProductCmtVO productCmtVO) {
		ProductCmtVO cmtVO = null;
		if(productCmtVO != null) {
			cmtVO = dao.update(productCmtVO);
		}
		return cmtVO;
	}
	
	public boolean delete(ProductCmtVO productCmtVO) {
		boolean cmtVO = false;
		if(productCmtVO != null) {
			cmtVO = dao.delete(productCmtVO.getProduct_Cmt_ID());
		}
		return cmtVO;
	}
	
	public ProductCmtVO select(ProductCmtVO productCmtVO) {
		return dao.select(productCmtVO.getProduct_Cmt_ID());
	}
	
	public List<ProductCmtVO> getAll() {
		return dao.getAll();
	}
	
	public static void main(String[] args) {
		ProductCmtService service = new ProductCmtService();
		ProductCmtVO VO = new ProductCmtVO();
		VO.setProduct_Cmt_ID("CMT000010");
		VO.setProduct_ID("PID000002");
		VO.setMember_ID("MID000000");
		VO.setProduct_Cmt_Grade(3);
		VO.setProduct_Cmt_Info("456786´ú54645656¸Õ´ú¸Õ12454567863");
		//service.delete(VO);
		System.out.println(service.update(VO));
		//System.out.println(service.insert(VO));
		//System.out.println(service.getAll());
		//System.out.println(service.select(VO));
	}
}
