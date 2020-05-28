package com.customerizedetail.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.common.Common;


public class CustDetailDAO_JNDI implements CustDetailDAO{
	
	private static final String insert = "INSERT INTO CUSTOMERIZE_SCHEDULE_DETAIL "
			+ "VALUES(('CSD'||LPAD(to_char(SEQ_CUST_SCHEDULE_DETAIL_ID.NEXTVAL),6,'0'))"
			+ ", ?, ?, ?, ?, ?)";
	
//	private static final String addSchedule = ""
	
	private static final String update = "UPDATE CUSTOMERIZE_SCHEDULE_DETAIL SET CUST_SCHEDULE_ID=?, PRODUCT_ID=?"
			+ ", CUST_SCHEDULE_DETAIL_SEQ=?, CUST_SCHEDULE_DETAIL_DATE=?, CUST_SCHEDULE_DETAIL_INFO=?"
			+ " WHERE CUST_SCHEDULE_DETAIL_ID=?";
	
	private static final String delete = "DELETE FROM CUSTOMERIZE_SCHEDULE_DETAIL WHERE CUST_SCHEDULE_DETAIL_ID =?";
	
	private static final String select = "SELECT CUST_SCHEDULE_DETAIL_ID, CUST_SCHEDULE_ID ,PRODUCT_ID"
			+ ", CUST_SCHEDULE_DETAIL_SEQ, CUST_SCHEDULE_DETAIL_DATE, CUST_SCHEDULE_DETAIL_INFO "
			+ "FROM CUSTOMERIZE_SCHEDULE_DETAIL WHERE CUST_SCHEDULE_DETAIL_ID=?";
	
	private static final String getAll = "SELECT CUST_SCHEDULE_DETAIL_ID, CUST_SCHEDULE_ID ,PRODUCT_ID"
			+ ", CUST_SCHEDULE_DETAIL_SEQ, CUST_SCHEDULE_DETAIL_DATE, CUST_SCHEDULE_DETAIL_INFO "
			+ "FROM CUSTOMERIZE_SCHEDULE_DETAIL";
	
	
	public CustDetailVO insert(CustDetailVO custDetailVO) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String[] pk = {"CUST_SCHEDULE_DETAIL_ID"};
		try {
			con = Common.getDataSource().getConnection();
			con.setAutoCommit(false);
			ps = con.prepareStatement(insert, pk);
			ps.setString(1, custDetailVO.getCust_Schedule_ID());
			ps.setString(2, custDetailVO.getProduct_ID());
			ps.setInt(3, custDetailVO.getCust_Schedule_Detail_Seq());
			ps.setDate(4, custDetailVO.getCust_Schedule_Detail_Date());
			ps.setString(5, custDetailVO.getCust_Schedule_Detail_Info());
			ps.executeUpdate();
			rs = ps.getGeneratedKeys();
			if(rs.next()){
				custDetailVO.setCust_Schedule_Detail_ID(rs.getString(1)); 
		    }
			con.commit();
			return custDetailVO;
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.setAutoCommit(true);
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
	public CustDetailVO update(CustDetailVO custDetailVO) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = Common.getDataSource().getConnection();
			con.setAutoCommit(false);
			ps = con.prepareStatement(update);
			ps.setString(1, custDetailVO.getCust_Schedule_ID());
			ps.setString(2, custDetailVO.getProduct_ID());
			ps.setInt(3, custDetailVO.getCust_Schedule_Detail_Seq());
			ps.setDate(4, custDetailVO.getCust_Schedule_Detail_Date());
			ps.setString(5, custDetailVO.getCust_Schedule_Detail_Info());
			ps.setString(6, custDetailVO.getCust_Schedule_Detail_ID());
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.setAutoCommit(true);
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return custDetailVO;
	}

	@Override
	public boolean delete(String cust_Schedule_Detail_ID) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = Common.getDataSource().getConnection();
			con.setAutoCommit(false);
			ps = con.prepareStatement(delete);
			ps.setString(1, cust_Schedule_Detail_ID);
			ps.executeUpdate();
			con.commit();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.setAutoCommit(true);
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}

	@Override
	public CustDetailVO select(String cust_Schedule_Detail_ID) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		CustDetailVO custDetail = null; 
		try {
			con = Common.getDataSource().getConnection();
			ps = con.prepareStatement(select);
			ps.setString(1, cust_Schedule_Detail_ID);
			rs = ps.executeQuery();
			if(rs.next()) {
				custDetail = new CustDetailVO();
				custDetail.setCust_Schedule_Detail_ID(rs.getString(1));
				custDetail.setCust_Schedule_ID(rs.getString(2));
				custDetail.setProduct_ID(rs.getString(3));
				custDetail.setCust_Schedule_Detail_Seq(rs.getInt(4));
				custDetail.setCust_Schedule_Detail_Date(rs.getDate(5));
				custDetail.setCust_Schedule_Detail_Info(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return custDetail;
	}

	@Override
	public List<CustDetailVO> getAll() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<CustDetailVO> custDetails = new ArrayList<>(); 
		CustDetailVO custDetail = null; 
		try {
			con = Common.getDataSource().getConnection();
			ps = con.prepareStatement(getAll);
			rs = ps.executeQuery();
			while(rs.next()) {
				custDetail = new CustDetailVO();
				custDetail.setCust_Schedule_Detail_ID(rs.getString(1));
				custDetail.setCust_Schedule_ID(rs.getString(2));
				custDetail.setProduct_ID(rs.getString(3));
				custDetail.setCust_Schedule_Detail_Seq(rs.getInt(4));
				custDetail.setCust_Schedule_Detail_Date(rs.getDate(5));
				custDetail.setCust_Schedule_Detail_Info(rs.getString(6));
				custDetails.add(custDetail);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return custDetails;
	}
}
