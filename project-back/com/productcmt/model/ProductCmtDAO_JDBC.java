package com.productcmt.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class ProductCmtDAO_JDBC implements ProductCmtDAO {
	
	private static final String url = "jdbc:oracle:thin:@//localhost:1521/XE";
	private static final String username = "TDA101G1";
	private static final String password = "123456";
	
	private static final String insert = "INSERT INTO PRODUCT_CMT (PRODUCT_CMT_ID, PRODUCT_ID, MEMBER_ID "
			+ ", PRODUCT_CMT_GRADE, PRODUCT_CMT_INFO, PRODUCT_CMT_IMG1, PRODUCT_CMT_IMG2)"
			+ "VALUES(('CMT'||LPAD(to_char(SEQ_PRODUCT_CMT_ID.NEXTVAL),6,'0'))"
			+ ", ?, ?, ?, ?, ?, ?)";
	
	private static final String update = "UPDATE PRODUCT_CMT SET PRODUCT_ID=?, MEMBER_ID=?"
			+ ", PRODUCT_CMT_GRADE=?, PRODUCT_CMT_INFO=?, PRODUCT_CMT_IMG1=?, PRODUCT_CMT_IMG2=?"
			+ ", PRODUCT_CMT_TIMESTAMP=CURRENT_TIMESTAMP WHERE PRODUCT_CMT_ID=?";
	
	private static final String delete = "DELETE FROM PRODUCT_CMT WHERE PRODUCT_CMT_ID=?";
	
	private static final String select = "SELECT PRODUCT_CMT_ID, PRODUCT_ID, MEMBER_ID, PRODUCT_CMT_GRADE"
			+ ", PRODUCT_CMT_INFO, PRODUCT_CMT_IMG1, PRODUCT_CMT_IMG2, PRODUCT_CMT_TIMESTAMP "
			+ "FROM PRODUCT_CMT WHERE PRODUCT_CMT_ID=?";
	
	private static final String getAll = "SELECT PRODUCT_CMT_ID, PRODUCT_ID, MEMBER_ID, PRODUCT_CMT_GRADE"
			+ ", PRODUCT_CMT_INFO, PRODUCT_CMT_IMG1, PRODUCT_CMT_IMG2, PRODUCT_CMT_TIMESTAMP FROM PRODUCT_CMT"; 

	@Override
	public ProductCmtVO insert(ProductCmtVO productCMTVO) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String[] pk = {"PRODUCT_CMT_ID"};
		try {
			con = DriverManager.getConnection(url, username, password);
			con.setAutoCommit(false);
			ps = con.prepareStatement(insert, pk);
			ps.setString(1, productCMTVO.getProduct_ID());
			ps.setString(2, productCMTVO.getMember_ID());
			ps.setInt(3, productCMTVO.getProduct_Cmt_Grade());
			ps.setString(4, productCMTVO.getProduct_Cmt_Info());
			ps.setBytes(5, productCMTVO.getProduct_Cmt_Img1());
			ps.setBytes(6, productCMTVO.getProduct_Cmt_Img2());
			ps.executeUpdate();
			rs = ps.getGeneratedKeys();
			if(rs.next()){
				productCMTVO.setProduct_Cmt_ID(rs.getString(1)); 
		    }
			con.commit();;
			return productCMTVO;
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
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
	public ProductCmtVO update(ProductCmtVO productCMTVO) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = DriverManager.getConnection(url, username, password);
			con.setAutoCommit(false);
			ps = con.prepareStatement(update);
			ps.setString(1, productCMTVO.getProduct_ID());
			ps.setString(2, productCMTVO.getMember_ID());
			ps.setInt(3, productCMTVO.getProduct_Cmt_Grade());
			ps.setString(4, productCMTVO.getProduct_Cmt_Info());
			ps.setBytes(5, productCMTVO.getProduct_Cmt_Img1());
			ps.setBytes(6, productCMTVO.getProduct_Cmt_Img2());
			ps.setString(7, productCMTVO.getProduct_Cmt_ID());
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
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
		return productCMTVO;
	}

	@Override
	public boolean delete(String product_Cmt_ID) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = DriverManager.getConnection(url, username, password);
			con.setAutoCommit(false);
			ps = con.prepareStatement(delete);
			ps.setString(1, product_Cmt_ID);
			ps.executeUpdate();
			con.commit();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
	public ProductCmtVO select(String product_Cmt_ID) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ProductCmtVO cmtVO = null;
		try {
			con = DriverManager.getConnection(url, username, password);
			ps = con.prepareStatement(select);
			ps.setString(1, product_Cmt_ID);
			rs = ps.executeQuery();
			if(rs.next()) {
				cmtVO = new ProductCmtVO();
				cmtVO.setProduct_Cmt_ID(rs.getString(1));
				cmtVO.setProduct_ID(rs.getString(2));
				cmtVO.setMember_ID(rs.getString(3));
				cmtVO.setProduct_Cmt_Grade(rs.getInt(4));
				cmtVO.setProduct_Cmt_Info(rs.getString(5));
				cmtVO.setProduct_Cmt_Img1(rs.getBytes(6));
				cmtVO.setProduct_Cmt_Img1(rs.getBytes(7));
				cmtVO.setProduct_Cmt_Timestamp(rs.getTimestamp(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
		return cmtVO;
	}

	@Override
	public List<ProductCmtVO> getAll() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ProductCmtVO> cmtVOs = new ArrayList<>();
		ProductCmtVO cmtVO = null;
		try {
			con = DriverManager.getConnection(url, username, password);
			ps = con.prepareStatement(getAll);
			rs = ps.executeQuery();
			while(rs.next()) {
				cmtVO = new ProductCmtVO();
				cmtVO.setProduct_Cmt_ID(rs.getString(1));
				cmtVO.setProduct_ID(rs.getString(2));
				cmtVO.setMember_ID(rs.getString(3));
				cmtVO.setProduct_Cmt_Grade(rs.getInt(4));
				cmtVO.setProduct_Cmt_Info(rs.getString(5));
				cmtVO.setProduct_Cmt_Img1(rs.getBytes(6));
				cmtVO.setProduct_Cmt_Img1(rs.getBytes(7));
				cmtVO.setProduct_Cmt_Timestamp(rs.getTimestamp(8));
				cmtVOs.add(cmtVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
		return cmtVOs;
	}
}
