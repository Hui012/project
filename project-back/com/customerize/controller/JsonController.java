package com.customerize.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.customerizedetail.model.CustDetailService;
import com.customerizedetail.model.CustDetailVO;
import com.product.model.ProductService;
import com.product.model.ProductVO;

@WebServlet("/project/JsonController")
public class JsonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("application/json; charset=UTF-8");
		res.addHeader("Access-Control-Allow-Origin", "*");
		PrintWriter out = res.getWriter();
		System.out.println("進來了 JsonController");

		String loadProduct = req.getParameter("loadProduct");
		System.out.println(loadProduct);
		if("loadProduct".equals(loadProduct)) {
			ProductService dao = new ProductService();
			System.out.println(dao.getAll());
			Map<String, List<ProductVO>> allProducts = new HashMap<>();
			List<ProductVO> products = dao.getAll();
			allProducts.put("products", products);
			JSONObject json = new JSONObject(allProducts);
			out.println(json);
		}
		
		
		String insertSchedule = req.getParameter("insertSchedule");
		System.out.println(insertSchedule);
		if("insertSchedule".equals(insertSchedule)) {
			try {
				CustDetailService dao = new CustDetailService();
				CustDetailVO detail = new CustDetailVO();
				Map<String, CustDetailVO> details = new HashMap<>();
				String cid = req.getParameter("cid");
				String insertData = req.getParameter("insertData");
				JSONArray jsonArray1 = new JSONArray(insertData);
				for (int i = 0; i < jsonArray1.length(); i++) {
					JSONArray jsonArray2 = (JSONArray) jsonArray1.get(i);
					for (int j = 0; j < jsonArray2.length(); j++) {
						JSONObject json = jsonArray2.getJSONObject(j);
						detail.setProduct_ID(json.getString("product_ID"));
						detail.setCust_Schedule_Detail_Info(json.getString("schedule_info"));
						detail.setCust_Schedule_ID(cid);
						detail.setCust_Schedule_Detail_Seq(Integer.parseInt(json.getString("sort")));
						detail.setCust_Schedule_Detail_Date(Date.valueOf("2020-07-30"));
						details.put("Day", dao.insert(detail));
						System.out.println(details);
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
		}
		
		
//		String updateSchedule = req.getParameter("updateSchedule");
//		System.out.println(updateSchedule);
//		if("updateSchedule".equals(updateSchedule)) {
//			CustDetailService dao = new CustDetailService();
//			System.out.println(dao.getAll());
//			
//		}
		
		String alwaysUpdate = req.getParameter("alwaysUpdate");
		System.out.println(alwaysUpdate);
		if("alwaysUpdate".equals(alwaysUpdate)) {
			try {
				String data = req.getParameter("data");
				JSONArray jsonArray = new JSONArray(data); 	//將陣列的字串轉為陣列物件
				CustDetailService dao = new CustDetailService();
				CustDetailVO bean = new CustDetailVO();
				Map<String, CustDetailVO> custDetails = new HashMap<>();
				for (int i = 0; i < jsonArray.length(); i++) {
					JSONObject json_cust = jsonArray.getJSONObject(i);
					bean.setCust_Schedule_ID(json_cust.getString("cust_Schedule_ID"));
					bean.setProduct_ID(json_cust.getString("product_ID"));
					bean.setCust_Schedule_Detail_Info(json_cust.getString("cust_Schedule_Detail_Info"));
					bean.setCust_Schedule_Detail_Seq(json_cust.getInt("cust_Schedule_Detail_Seq"));
					bean.setCust_Schedule_Detail_Date(Date.valueOf(json_cust.getString("cust_Schedule_Detail_Date")));
					
					CustDetailVO result = dao.insert(bean);
					custDetails.put("custDetails", result);
					JSONObject json = new JSONObject(custDetails);
					out.println(json);

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
