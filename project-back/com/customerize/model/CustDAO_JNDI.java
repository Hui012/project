package com.customerize.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.common.Common;

public class CustDAO_JNDI implements CustDAO {
	private static final String url = "jdbc:oracle:thin:@//localhost:1521/XE";
	private static final String username = "TDA101G1";
	private static final String password = "123456";
	
	private static final String insert = "INSERT INTO CUSTOMERIZE_SCHEDULE (CUST_SCHEDULE_ID, MEMBER_ID"
			+ ", CUST_SCHEDULE_NAME, CUST_SCHEDULE_CLICK_RECORD, CUST_SCHEDULE_START_TIME, CUST_SCHEDULE_END_TIME"
			+ ", CUST_SCHEDULE_TOTAL_DAY, CUST_SCHEDULE_SHARE, CUST_SCHEDULE_STATE, CUST_SCHEDULE_IMG)"
			+ " VALUES(('CID'||LPAD(to_char(SEQ_CUST_SCHEDULE_ID.NEXTVAL),6,'0'))"
			+ ", ?, '請輸入標題', 0, ?, ?, ?, 0, 1, ?)";
	
	private static final String update = "UPDATE CUSTOMERIZE_SCHEDULE SET MEMBER_ID=?,CUST_SCHEDULE_NAME=?"
			+ ", CUST_SCHEDULE_CLICK_RECORD=?, CUST_SCHEDULE_START_TIME=?, CUST_SCHEDULE_END_TIME=?"
			+ ", CUST_SCHEDULE_TOTAL_DAY=?, CUST_SCHEDULE_SHARE=?, CUST_SCHEDULE_STATE=?"
			+ ", CUST_SCHEDULE_LAST_TIMESTAMP=CURRENT_TIMESTAMP, CUST_SCHEDULE_IMG=? WHERE CUST_SCHEDULE_ID=?";
	
	private static final String delete = "DELETE FROM CUSTOMERIZE_SCHEDULE WHERE CUST_SCHEDULE_ID=?";
	
	private static final String select = "SELECT CUST_SCHEDULE_ID, MEMBER_ID, CUST_SCHEDULE_NAME"
			+ ", CUST_SCHEDULE_CLICK_RECORD, CUST_SCHEDULE_START_TIME, CUST_SCHEDULE_END_TIME"
			+ ", CUST_SCHEDULE_TOTAL_DAY, CUST_SCHEDULE_SHARE, CUST_SCHEDULE_STATE, CUST_SCHEDULE_LAST_TIMESTAMP"
			+ ", CUST_SCHEDULE_IMG FROM CUSTOMERIZE_SCHEDULE WHERE CUST_SCHEDULE_ID =?";
	
	private static final String getAll = "SELECT CUST_SCHEDULE_ID, MEMBER_ID, CUST_SCHEDULE_NAME"
			+ ", CUST_SCHEDULE_CLICK_RECORD, CUST_SCHEDULE_START_TIME, CUST_SCHEDULE_END_TIME"
			+ ", CUST_SCHEDULE_TOTAL_DAY, CUST_SCHEDULE_SHARE, CUST_SCHEDULE_STATE, CUST_SCHEDULE_LAST_TIMESTAMP"
			+ ", CUST_SCHEDULE_IMG FROM CUSTOMERIZE_SCHEDULE";
	
	@Override
	public CustVO insert(CustVO custVO) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String[] pk = {"CUST_SCHEDULE_ID", "cust_Schedule_Last_Timestamp"};
		try {
			con = Common.getDataSource().getConnection();
			con.setAutoCommit(false);
			ps = con.prepareStatement(insert, pk);
			ps.setString(1, custVO.getMember_ID());
//			ps.setString(1, custVO.getCust_Schedule_Name());
//			ps.setInt(1, custVO.getCust_Schedule_Click_Record());
			ps.setDate(2, custVO.getCust_Schedule_Start_Time());
			ps.setDate(3, custVO.getCust_Schedule_End_Time());
			ps.setInt(4, custVO.getCust_Schedule_Total_Day());
//			ps.setInt(6, custVO.getCust_Schedule_Share());
//			ps.setInt(8, custVO.getCust_Schedule_State());
			ps.setBytes(5, custVO.getCust_Schedule_Img());
			ps.executeUpdate();
			rs = ps.getGeneratedKeys();
			if(rs.next()){
				custVO.setCust_Schedule_ID(rs.getString(1)); 
				custVO.setCust_Schedule_Last_Timestamp(rs.getTimestamp(2)); 
		    }
			con.commit();
			return custVO;
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
	@Override
	public CustVO update(CustVO custVO) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = Common.getDataSource().getConnection();
			con.setAutoCommit(false);
			ps = con.prepareStatement(update);
			ps.setString(1, custVO.getMember_ID());
			ps.setString(2, custVO.getCust_Schedule_Name());
			ps.setInt(3, custVO.getCust_Schedule_Click_Record());
			ps.setDate(4, custVO.getCust_Schedule_Start_Time());
			ps.setDate(5, custVO.getCust_Schedule_End_Time());
			ps.setInt(6, custVO.getCust_Schedule_Total_Day());
			ps.setInt(7, custVO.getCust_Schedule_Share());
			ps.setInt(8, custVO.getCust_Schedule_State());
			ps.setBytes(9, custVO.getCust_Schedule_Img());
			ps.setString(10, custVO.getCust_Schedule_ID());
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
				} catch (SQLException se) {
					se.printStackTrace();
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
		return custVO;
	}

	@Override
	public boolean delete(String cust_Schedule_ID) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = Common.getDataSource().getConnection();
			con.setAutoCommit(false);
			ps = con.prepareStatement(delete);
			ps.setString(1, cust_Schedule_ID);
			ps.executeUpdate();
			con.commit();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException se) {
					se.printStackTrace();
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
	public CustVO select(String cust_Schedule_ID) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		CustVO cust = null;
		try {
			con = Common.getDataSource().getConnection();
			ps = con.prepareStatement(select);
			ps.setString(1, cust_Schedule_ID);
			rs = ps.executeQuery();
			if(rs.next()) {
				cust = new CustVO();
				cust.setCust_Schedule_ID(rs.getString(1));
				cust.setMember_ID(rs.getString(2));
				cust.setCust_Schedule_Name(rs.getString(3));
				cust.setCust_Schedule_Click_Record(rs.getInt(4));
				cust.setCust_Schedule_Start_Time(rs.getDate(5));
				cust.setCust_Schedule_End_Time(rs.getDate(6));
				cust.setCust_Schedule_Total_Day(rs.getInt(7));
				cust.setCust_Schedule_Share(rs.getInt(8));
				cust.setCust_Schedule_State(rs.getInt(9));
				cust.setCust_Schedule_Last_Timestamp(rs.getTimestamp(10));
				cust.setCust_Schedule_Img(rs.getBytes(11));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException se) {
					se.printStackTrace();
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
		return cust;
	}

	@Override
	public List<CustVO> getAll() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<CustVO> custs = new ArrayList<CustVO>();
		try {
			con = Common.getDataSource().getConnection();
			ps = con.prepareStatement(getAll);
			rs = ps.executeQuery();
			while(rs.next()) {
				CustVO cust = new CustVO();
				cust.setCust_Schedule_ID(rs.getString(1));
				cust.setMember_ID(rs.getString(2));
				cust.setCust_Schedule_Name(rs.getString(3));
				cust.setCust_Schedule_Click_Record(rs.getInt(4));
				cust.setCust_Schedule_Start_Time(rs.getDate(5));
				cust.setCust_Schedule_End_Time(rs.getDate(6));
				cust.setCust_Schedule_Total_Day(rs.getInt(7));
				cust.setCust_Schedule_Share(rs.getInt(8));
				cust.setCust_Schedule_State(rs.getInt(9));
				cust.setCust_Schedule_Last_Timestamp(rs.getTimestamp(10));
				cust.setCust_Schedule_Img(rs.getBytes(11));
				custs.add(cust);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException se) {
					se.printStackTrace();
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
		return custs;
	}
}
