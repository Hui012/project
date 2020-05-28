package com.product.model;

import java.util.List;

public class ProductService {
	private ProductDAO dao;

	public ProductService() {
		dao = new ProductDAO_JNDI();
	}

	public ProductVO insert(ProductVO productVO) {
		if (productVO != null) {
			ProductVO product = dao.insert(productVO);
			return product;
		}
		return null;
	}

	public Integer update(ProductVO productVO) {
		if (productVO != null) {
			Integer count = dao.update(productVO);
			return count;
		}
		return new Integer(-1);
	}

	public Integer delete(ProductVO productVO) {
		if (productVO != null) {
			Integer count = dao.delete(productVO.getProduct_ID());
			return count;
		}
		return new Integer(-1);
	}

	public ProductVO select(ProductVO productVO) {
		if (productVO != null) {
			ProductVO product = dao.select(productVO.getProduct_ID());
			return product;
		}
		return null;
	}

	public List<ProductVO> getAll() {
		return dao.getAll();
	}

	public static void main(String[] args) {
//		ProductService service = new ProductService();
//		ProductVO productVO = new ProductVO();
//		productVO.setProduct_Name("故宮博物院");
//		productVO.setProduct_Intro("中華民族藏品最多最完整的國家博物館");
//		productVO.setProduct_Staytime(4D);
//		productVO.setProduct_Address("111台北市士林區至善路二段221號");
//		productVO.setProduct_Latitutde(25.10235);
//		productVO.setProduct_Longitude(121.54849);
//		productVO.setProduct_County("台北市");
//		productVO.setProduct_Class("景點");
//		productVO.setProduct_Style("歷史人文");
//		productVO.setProduct_Seq(1);
//		productVO.setProduct_State(1);
//		productVO.setProduct_Sale_Rec((int) (Math.random() * 10000));
//		productVO.setProduct_Click_Rec((int) (Math.random() * 10000));
//		productVO.setProduct_Total_Schedule("國家級展覽中心，內藏中國各年代古蹟。不定時推出國外博物館特藏展");
//		productVO.setProduct_Info("國立故宮博物院，簡稱故宮");
//		productVO.setProduct_Img1("123".getBytes());
//		productVO.setProduct_Img2("123".getBytes());
//		productVO.setProduct_Img3("123".getBytes());
//		productVO.setProduct_Img4("123".getBytes());
//		productVO.setProduct_Img5("123".getBytes());
//		
////		System.out.println(service.delete(productVO));
//		System.out.println(service.insert(productVO));
//		System.out.println(service.update(productVO));
//		System.out.println(service.select(productVO));
//		service.getAll().forEach(System.out::println);

	}
}
