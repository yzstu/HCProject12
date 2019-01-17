package com.xtkj.dao;

import java.sql.*;
import java.util.ArrayList;

import com.xtkj.DBManager.DBManager;
import com.xtkj.pojo.Advertising;

public class AdvertisingDao {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rst = null;

	// ��ӹ��
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
			System.out.println("ע���û�д�����ݿ��쳣������");
			e.printStackTrace();
		} finally {
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
	}

	// �ṩadvList
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
			System.out.println("��½��֤�쳣������");
			e.printStackTrace();
		} finally {
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
		return advs;
	}

	// �޸Ĺ��
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
			System.out.println("�޸Ĺ��д�����ݿ��쳣������");
			e.printStackTrace();
		} finally {
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
	}

	// �ı����Ա������1�����ø��û�Ϊ����Ա��2��ɾ���ù���Ա
	public static void deleteAdv(int no) {
		try {
			con = DBManager.getCon(con);
			pst = con
					.prepareStatement("delete from advertising where no =?");
			pst.setInt(1, no);
			pst.execute();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("�ı����Աд�����ݿ��쳣������");
		} finally {
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
	}
}
