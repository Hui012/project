package com.product.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.common.Common;

public class ProductDetailDAO_JDBC implements ProductDetailDAO {
	private static final String INSERT_SQL = "INSERT INTO PRODUCT_DETAIL (PRODUCT_DETAIL_ID, PRODUCT_ID, PRODUCT_DETAIL_SPC, PRODUCT_DETAIL_MONEY, PRODUCT_DETAIL_INSTOCK, PRODUCT_DETAIL_SAFTYSTOCK, PRODUCT_DETAIL_DATE) VALUES (('PDID'||LPAD(TO_CHAR(SEQ_PRODUCT_DETAIL_ID.NEXTVAL),6,'0')),?,?,?,?,?,?)";
	private static final String UPDATE_SQL = "UPDATE PRODUCT_DETAIL SET PRODUCT_ID=?, PRODUCT_DETAIL_SPC=?, PRODUCT_DETAIL_MONEY=?, PRODUCT_DETAIL_INSTOCK=?, PRODUCT_DETAIL_SAFTYSTOCK=?, PRODUCT_DETAIL_DATE=? WHERE PRODUCT_DETAIL_ID = ?";
	private static final String DELETE_SQL = "DELETE FROM PRODUCT_DETAIL WHERE PRODUCT_DETAIL_ID = ?";
	private static final String GET_ONE_SQL = "SELECT PRODUCT_DETAIL_ID, PRODUCT_ID, PRODUCT_DETAIL_SPC, PRODUCT_DETAIL_MONEY, PRODUCT_DETAIL_INSTOCK, PRODUCT_DETAIL_SAFTYSTOCK, PRODUCT_DETAIL_DATE FROM PRODUCT_DETAIL WHERE PRODUCT_DETAIL_ID = ?";
	private static final String GET_ALL_SQL = "SELECT PRODUCT_DETAIL_ID, PRODUCT_ID, PRODUCT_DETAIL_SPC, PRODUCT_DETAIL_MONEY, PRODUCT_DETAIL_INSTOCK, PRODUCT_DETAIL_SAFTYSTOCK, PRODUCT_DETAIL_DATE FROM PRODUCT_DETAIL ORDER BY PRODUCT_DETAIL_ID DESC";

	@Override
	public ProductDetailVO insert(ProductDetailVO productDetailVO, ProductVO productVO) {
		try (Connection conn = DriverManager.getConnection(Common.URL, Common.USER, Common.PWD);
				PreparedStatement ps = conn.prepareStatement(INSERT_SQL, new String[] { "PRODUCT_DETAIL_ID" });) {
			try {
				conn.setAutoCommit(false);

				ps.setString(1, productDetailVO.getProduct_ID());
				ps.setString(2, productDetailVO.getProduct_Detail_Spc());
				ps.setInt(3, productDetailVO.getProduct_Detail_Money());
				ps.setInt(4, productDetailVO.getProduct_Detail_Instock());
				ps.setInt(5, productDetailVO.getProduct_Detail_Saftystock());
				ps.setDate(6, productDetailVO.getProduct_Detail_Date());
				ps.executeUpdate();

				conn.commit();
			} catch (SQLException e) {
				conn.rollback();
				e.printStackTrace();
			} finally {
				conn.setAutoCommit(true);
			}
			try (ResultSet rs = ps.getGeneratedKeys();) {
				if (rs.next()) {
					productDetailVO.setProduct_Detail_ID(rs.getString(1));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productDetailVO;
	}

	@Override
	public Integer update(ProductDetailVO productDetailVO) {
		Integer couunt = null;
		try (Connection conn = DriverManager.getConnection(Common.URL, Common.USER, Common.PWD);
				PreparedStatement ps = conn.prepareStatement(UPDATE_SQL);) {
			try {
				conn.setAutoCommit(false);

				ps.setString(1, productDetailVO.getProduct_ID());
				ps.setString(2, productDetailVO.getProduct_Detail_Spc());
				ps.setInt(3, productDetailVO.getProduct_Detail_Money());
				ps.setInt(4, productDetailVO.getProduct_Detail_Instock());
				ps.setInt(5, productDetailVO.getProduct_Detail_Saftystock());
				ps.setDate(6, productDetailVO.getProduct_Detail_Date());
				ps.setString(7, productDetailVO.getProduct_Detail_ID());
				couunt = ps.executeUpdate();

				conn.commit();
			} catch (SQLException e) {
				conn.rollback();
				e.printStackTrace();
			} finally {
				conn.setAutoCommit(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return couunt;
	}

	@Override
	public Integer delete(String productdetail_ID) {
		Integer couunt = null;
		try (Connection conn = DriverManager.getConnection(Common.URL, Common.USER, Common.PWD);
				PreparedStatement ps = conn.prepareStatement(DELETE_SQL);) {
			try {
				conn.setAutoCommit(false);
				ps.setString(1, productdetail_ID);
				couunt = ps.executeUpdate();
				conn.commit();
			} catch (SQLException e) {
				conn.rollback();
				e.printStackTrace();
			} finally {
				conn.setAutoCommit(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return couunt;
	}

	@Override
	public ProductDetailVO select(String productdetail_ID) {
		ProductDetailVO product_DetailVO = null;
		try (Connection conn = DriverManager.getConnection(Common.URL, Common.USER, Common.PWD);
				PreparedStatement ps = conn.prepareStatement(GET_ONE_SQL);) {
			ps.setString(1, productdetail_ID);
			try (ResultSet rs = ps.executeQuery();) {
				while (rs.next()) {
					product_DetailVO = new ProductDetailVO();
					product_DetailVO.setProduct_Detail_ID(rs.getString("PRODUCT_DETAIL_ID"));
					product_DetailVO.setProduct_ID(rs.getString("PRODUCT_ID"));
					product_DetailVO.setProduct_Detail_Spc(rs.getString("PRODUCT_DETAIL_SPC"));
					product_DetailVO.setProduct_Detail_Money(rs.getInt("PRODUCT_DETAIL_MONEY"));
					product_DetailVO.setProduct_Detail_Instock(rs.getInt("PRODUCT_DETAIL_INSTOCK"));
					product_DetailVO.setProduct_Detail_Saftystock(rs.getInt("PRODUCT_DETAIL_SAFTYSTOCK"));
					product_DetailVO.setProduct_Detail_Date(rs.getDate("PRODUCT_DETAIL_DATE"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return product_DetailVO;
	}

	@Override
	public List<ProductDetailVO> getAll() {
		List<ProductDetailVO> list = new ArrayList<ProductDetailVO>();
		ProductDetailVO product_DetailVO = null;
		try (Connection conn = DriverManager.getConnection(Common.URL, Common.USER, Common.PWD);
				PreparedStatement ps = conn.prepareStatement(GET_ALL_SQL);) {
			try (ResultSet rs = ps.executeQuery();) {
				while (rs.next()) {
					product_DetailVO = new ProductDetailVO();
					product_DetailVO.setProduct_Detail_ID(rs.getString("PRODUCT_DETAIL_ID"));
					product_DetailVO.setProduct_ID(rs.getString("PRODUCT_ID"));
					product_DetailVO.setProduct_Detail_Spc(rs.getString("PRODUCT_DETAIL_SPC"));
					product_DetailVO.setProduct_Detail_Money(rs.getInt("PRODUCT_DETAIL_MONEY"));
					product_DetailVO.setProduct_Detail_Instock(rs.getInt("PRODUCT_DETAIL_INSTOCK"));
					product_DetailVO.setProduct_Detail_Saftystock(rs.getInt("PRODUCT_DETAIL_SAFTYSTOCK"));
					product_DetailVO.setProduct_Detail_Date(rs.getDate("PRODUCT_DETAIL_DATE"));
					list.add(product_DetailVO);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static void main(String[] args) {
		ProductDetailDAO_JDBC dao = new ProductDetailDAO_JDBC();

////insert
//		ProductDetailVO productDetailVO_insert = new ProductDetailVO();
//		ProductVO productVO = new ProductVO();
//		productVO.setProduct_ID("PID000001");
//		productDetailVO_insert.setProduct_Detail_Spc("8人房");
//		productDetailVO_insert.setProduct_Detail_Money(3000);
//		productDetailVO_insert.setProduct_Detail_Instock(100);
//		productDetailVO_insert.setProduct_Detail_Saftystock(5);
//		productDetailVO_insert.setProduct_Detail_Date(utils.ChangeDateFormate.ChangeDateFormate_Dash("2020-02-30"));
//		System.out.println(dao.insert(productDetailVO_insert, productVO));
//
////update
//		ProductDetailVO productDetailVO_update = new ProductDetailVO();
//		productDetailVO_update.setProduct_Detail_ID("PDID000001");
//		productDetailVO_update.setProduct_ID("PID000001");
//		productDetailVO_update.setProduct_Detail_Spc("8人房");
//		productDetailVO_update.setProduct_Detail_Money(30000);
//		productDetailVO_update.setProduct_Detail_Instock(100);
//		productDetailVO_update.setProduct_Detail_Saftystock(5);
//		productDetailVO_update.setProduct_Detail_Date(utils.ChangeDateFormate.ChangeDateFormate_Dash("2020-02-30"));
//		System.out.println(dao.update(productDetailVO_update));
//
////delete
//		System.out.println(dao.delete("PDID000005"));
//		
////select
//		System.out.println(dao.select("PDID000001").getProduct_Detail_Date().getClass());
//		
//
////getAll
//		dao.getAll().forEach(System.out::println);

	}
}
