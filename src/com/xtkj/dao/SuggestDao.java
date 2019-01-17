package com.xtkj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.xtkj.DBManager.DBManager;
import com.xtkj.pojo.Suggest;
import com.xtkj.pojo.User;

public class SuggestDao {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rst = null;
	public static void addSuggest(String account,String suggest) {
		try {
			con = DBManager.getCon(con);
			pst = con.prepareStatement("insert suggest ( account , suggest ) values (?,?)");
			pst.setString(1, account);
			pst.setString(2, suggest);
			pst.execute();
			
		} catch (SQLException e) {
			System.out.println("写入‘评论’时出现异常！");
			e.printStackTrace();
		}finally{
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
	}
	public static ArrayList<Suggest> showSuggest() {
		ArrayList<Suggest> suggests = new ArrayList<Suggest>();
		try {
			con = DBManager.getCon(con);
			pst = con.prepareStatement("select * from suggest");
			rst = pst.executeQuery();
			Suggest suggest = null;
			while (rst.next()) {
				suggest = new Suggest();
				suggest.setAccount(rst.getString("account"));
				suggest.setSuggest(rst.getString("suggest"));
				suggest.setTime(rst.getTimestamp("time"));
				suggests.add(suggest);
			}
		} catch (Exception e) {
			System.out.println("登陆验证异常！！！");
		}finally{
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
		return suggests;
	}
}
