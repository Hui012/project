package com.customerize.model;

import java.util.List;

public interface CustDAO {
	public CustVO insert(CustVO custVO);
	public CustVO update(CustVO custVO);
	public boolean delete(String cust_Schedule_ID);
	public CustVO select(String cust_Schedule_ID);
	public List<CustVO> getAll();
}
