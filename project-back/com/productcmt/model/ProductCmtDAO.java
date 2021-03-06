package com.productcmt.model;

import java.util.List;

public interface ProductCmtDAO {
	public ProductCmtVO insert(ProductCmtVO productCMTVO);
	public ProductCmtVO update(ProductCmtVO productCMTVO);
	public boolean delete(String product_Cmt_ID);
	public ProductCmtVO select(String product_Cmt_ID);
	public List<ProductCmtVO> getAll();
}
