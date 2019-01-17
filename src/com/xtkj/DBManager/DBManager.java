package com.xtkj.DBManager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBManager {
	private static final String driver = "com.mysql.jdbc.Driver";
	// 数据库地址
	private static final String url = "jdbc:mysql://localhost:3306/hcproject";
	// 用户名
	private static final String user = "root";
	// 密码
	private static final String password = "root";

	/* 建立连接对象 */
	public static Connection getCon(Connection con) {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	/* 关闭con */
	public static void closeCon(Connection con) {
		try {
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*关闭操作对象*/
	public static void closePst(PreparedStatement pst) {
		try {
			if (pst!=null) {
				pst.close();
				pst=null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*关闭结果对象*/
public static void closeRst(ResultSet rst) {
	try {
		if (rst!=null) {
			rst.close();
			rst=null;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
}
}
