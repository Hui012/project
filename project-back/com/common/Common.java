package com.common;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Common {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	public static final String USER = "TDA101G1";
	public static final String PWD = "123456";
	
	private static DataSource dataSource;
	
	public static DataSource getDataSource() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TDA101G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return dataSource;
	}

	
}
