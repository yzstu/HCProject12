package com.xtkj.dao;

import java.sql.*;
import java.util.ArrayList;

import com.xtkj.DBManager.DBManager;
import com.xtkj.pojo.User;

public class UserDao {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rst = null;
	//��½ʱ����û��˺�����
	public static int checkAccount(String account, String psw) {
		int flag = 3;
		try {
			con = DBManager.getCon(con);
			pst = con
					.prepareStatement("select * from user where account = ? and password = ?");
			pst.setString(1, account);
			pst.setString(2, psw);
			rst = pst.executeQuery();
			while (rst.next()) {
				flag = rst.getInt("type");
			}
		} catch (Exception e) {
			System.out.println("��½��֤�쳣������");
		}finally{
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
		return flag;
	}
	//ע���û�д�����ݿ�
	public static void addUser(String account,String password,String photourl,String name,String phone,String address) {
		try {
			con = DBManager.getCon(con);
			pst = con.prepareStatement("insert user ( account , password , photourl , name , phone , address ) values (?,?,?,?,?,?)");
			pst.setString(1, account);
			pst.setString(2, password);
			pst.setString(3, photourl);
			pst.setString(4, name);
			pst.setString(5, phone);
			pst.setString(6, address);
			pst.execute();
		} catch (Exception e) {
			System.out.println("ע���û�д�����ݿ��쳣������");
		}finally{
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
	}
	//�ṩuserList������1չʾ����Ա��2չʾ��ͨ�û�
	public static ArrayList<User> showUser(int i) {
		ArrayList<User> users = new ArrayList<User>();
		try {
			con = DBManager.getCon(con);
			pst = con.prepareStatement("select * from user where type = "+i);
			rst = pst.executeQuery();
			User user = null;
			while (rst.next()) {
				user = new User();
				user.setNo(rst.getInt("no"));
				user.setAccount(rst.getString("account"));
				user.setPassword(rst.getString("password"));
				user.setPhotourl(rst.getString("photourl"));
				user.setName(rst.getString("name"));
				user.setPhone(rst.getString("phone"));
				user.setAddress(rst.getString("address"));
				user.setMoney(rst.getDouble("money"));
				user.setSignData(rst.getTimestamp("signdata"));
				users.add(user);
			}
		} catch (Exception e) {
			System.out.println("��½��֤�쳣������");
			e.printStackTrace();
		}finally{
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
		return users;
	}
	
	//�ı����Ա������1�����ø��û�Ϊ����Ա��2��ɾ���ù���Ա
	public static void changeAdmin(String account,int i) {
		try {
			con = DBManager.getCon(con);
			pst = con.prepareStatement("update user set type = ? where account = ?");
			pst.setInt(1, i);
			pst.setString(2, account);
			pst.execute();
		} catch (Exception e) {
			System.out.println("�ı����Աд�����ݿ��쳣������");
		}finally{
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
	}
	
	//�޸��û���Ϣ
		public static void updateUser(String account,String password,String photourl,String name,String phone,double money) {
			try {
				con = DBManager.getCon(con);
				pst = con.prepareStatement("update user set password = ? , photourl = ? , name = ? , phone = ? , money = ? where account = ?");
				pst.setString(1, password);
				pst.setString(2, photourl);
				pst.setString(3, name);
				pst.setString(4, phone);
				pst.setDouble(5, money);
				pst.setString(6, account);
				pst.execute();
			} catch (Exception e) {
				System.out.println("�û�д�����ݿ��쳣������");
				e.printStackTrace();
			}finally{
				DBManager.closeRst(rst);
				DBManager.closePst(pst);
				DBManager.closeCon(con);
			}
		}
		
		//�޸�vip��Ϣ
				public static void updateVip(String psw,int type,int no) {
					try {
						con = DBManager.getCon(con);
						pst = con.prepareStatement("update user set password = ? , type = ? where no = ?");
						pst.setString(1, psw);
						pst.setInt(2, type);
						pst.setInt(3, no);
						pst.execute();
					} catch (Exception e) {
						System.out.println("�޸�vipд�����ݿ��쳣������");
						e.printStackTrace();
					}finally{
						DBManager.closeRst(rst);
						DBManager.closePst(pst);
						DBManager.closeCon(con);
					}
				}
				
				//�޸ĸ�������
				public static void updatePsw(String psw,String account) {
					try {
						con = DBManager.getCon(con);
						pst = con.prepareStatement("update user set password = ?  where account = ?");
						pst.setString(1, psw);
						pst.setString(2, account);
						pst.execute();
					} catch (Exception e) {
						System.out.println("�޸�����д�����ݿ��쳣������");
						e.printStackTrace();
					}finally{
						DBManager.closeRst(rst);
						DBManager.closePst(pst);
						DBManager.closeCon(con);
					}
				}
}
