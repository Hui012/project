package com.product.model;

import java.util.List;

public interface ProductDetailDAO {
	public ProductDetailVO insert(ProductDetailVO ProductDetailVO, ProductVO productVO);
	public Integer update(ProductDetailVO productDetailVO);
	public Integer delete(String productDetail_ID);
	public ProductDetailVO select(String productDetail_ID);
	public List<ProductDetailVO> getAll();
}
