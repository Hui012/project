package com.customerize.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customerize.model.CustService;
import com.customerize.model.CustVO;


@WebServlet("/project/CustController")
public class CustController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");

		System.out.println("進來了 CustController");
		String selected_schedule = req.getParameter("selected_schedule");
		String selected_style = req.getParameter("selected_style");
		String date = req.getParameter("date");
		String people = req.getParameter("people");
		String first_location = req.getParameter("first_location");
		String[] selected_locations = req.getParameterValues("location");
//		for(String selected_location: selected_locations) {
//			System.out.println(selected_location);
//		}
		System.out.println(date);
		System.out.println(people);
		System.out.println(first_location);
		System.out.println(selected_schedule);
		System.out.println(selected_style);
//		List lists = new ArrayList();
//		lists.addAll(Arrays.asList(selected_locations));
//		System.out.println(lists);
		CustVO custVO = new CustVO(); 
		custVO.setCust_Schedule_Start_Time(Date.valueOf("2020-07-26"));
		custVO.setCust_Schedule_End_Time(Date.valueOf("2020-07-30"));
		custVO.setCust_Schedule_Total_Day(5);
		CustService dao = new CustService();
		CustVO result = dao.insert(custVO);
	
//		req.setAttribute("list", lists);
		req.getSession().setAttribute("date", date);
		res.sendRedirect("schedule.jsp");
		//getRequestDispatcher("/project/schedule.html").forward(req, res);
		
	}

	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
