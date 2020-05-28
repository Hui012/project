package com.order.model;

import java.util.List;

import com.order_master.model.Order_MasterVO;
import com.product.model.ProductDetailVO;

public interface OrderDetailDAO {
	public OrderDetailVO insert(OrderDetailVO orderDetailVO, Order_MasterVO orderMasterVO, ProductDetailVO productDetailVO);
	public Integer update(OrderDetailVO orderDetailVO);
	public Integer delete(String orderDetailVO_ID);
	public OrderDetailVO select(String orderDetailVO_ID);
	public List<OrderDetailVO> getAll();
}
