package com.xtkj.dao;

import java.sql.*;
import java.util.ArrayList;

import com.xtkj.DBManager.DBManager;
import com.xtkj.pojo.Advertising;

public class AdvertisingDao {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rst = null;

	// 添加广告
	public static void addAd(String imgurl, String name, String url,
			int isshow, int priority) {
		try {
			con = DBManager.getCon(con);
			pst = con
					.prepareStatement("insert advertising ( imgurl , name , url  , isshow , priority ) values (?,?,?,?,?)");
			pst.setString(1, imgurl);
			pst.setString(2, name);
			pst.setString(3, url);
			pst.setInt(4, isshow);
			pst.setInt(5, priority);
			pst.execute();
		} catch (Exception e) {
			System.out.println("注册用户写入数据库异常！！！");
			e.printStackTrace();
		} finally {
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
	}

	// 提供advList
	public static ArrayList<Advertising> showAdvs() {
		ArrayList<Advertising> advs = new ArrayList<Advertising>();
		try {
			con = DBManager.getCon(con);
			pst = con.prepareStatement("select * from advertising");
			rst = pst.executeQuery();
			Advertising adv = null;
			while (rst.next()) {
				adv = new Advertising();
				adv.setNo(rst.getInt("no"));
				adv.setImgurl(rst.getString("imgurl"));
				adv.setName(rst.getString("name"));
				adv.setIsshow(rst.getInt("isshow"));
				adv.setUrl(rst.getString("url"));
				adv.setPriority(rst.getInt("priority"));
				advs.add(adv);
			}
		} catch (Exception e) {
			System.out.println("登陆验证异常！！！");
			e.printStackTrace();
		} finally {
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
		return advs;
	}

	// 修改广告
	public static void changeAd(String imgurl, String name, String url,
			int isshow, int priority, int no) {
		try {
			con = DBManager.getCon(con);
			pst = con
					.prepareStatement("update advertising set imgurl = ? , name = ?, url  = ?, isshow = ?, priority= ? where no = ? ");
			pst.setString(1, imgurl);
			pst.setString(2, name);
			pst.setString(3, url);
			pst.setInt(4, isshow);
			pst.setInt(5, priority);
			pst.setInt(6, no);
			pst.execute();
		} catch (Exception e) {
			System.out.println("修改广告写入数据库异常！！！");
			e.printStackTrace();
		} finally {
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
	}

	// 改变管理员，传入1则设置该用户为管理员，2则删掉该管理员
	public static void deleteAdv(int no) {
		try {
			con = DBManager.getCon(con);
			pst = con
					.prepareStatement("delete from advertising where no =?");
			pst.setInt(1, no);
			pst.execute();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("改变管理员写入数据库异常！！！");
		} finally {
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
	}
}
