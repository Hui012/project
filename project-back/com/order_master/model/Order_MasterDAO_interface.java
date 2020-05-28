package com.order_master.model;

import java.util.List;
import java.util.Set;

public interface Order_MasterDAO_interface {
	public Order_MasterVO select(String order_Master_ID);
	public List<Order_MasterVO> selectAll();
	public void insert(Order_MasterVO order_Master);
	public void update(Order_MasterVO order_Master);
	public void delete(String order_Master_ID);
	public Set<Order_MasterVO> selecyByMember(String member_ID);
}
