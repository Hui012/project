package com.customerizedetail.model;

import java.util.List;

public interface CustDetailDAO {
	public CustDetailVO insert(CustDetailVO custDetailVO);
	public CustDetailVO update(CustDetailVO custDetailVO);
	public boolean delete(String cust_Schedule_Detail_ID);
	public CustDetailVO select(String cust_Schedule_Detail_ID);
	public List<CustDetailVO> getAll();
}
