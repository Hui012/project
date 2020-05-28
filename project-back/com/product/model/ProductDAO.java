package com.product.model;

import java.util.List;

public interface ProductDAO {
	public ProductVO insert(ProductVO productVO);
	public Integer update(ProductVO productVO);
	public Integer delete(String product_ID);
	public ProductVO select(String product_ID);
	public List<ProductVO> getAll();
}
