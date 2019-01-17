package com.xtkj.dao;

import java.sql.*;
import java.util.ArrayList;

import com.xtkj.DBManager.DBManager;
import com.xtkj.pojo.User;

public class UserDao {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rst = null;
	//登陆时检查用户账号密码
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
			System.out.println("登陆验证异常！！！");
		}finally{
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
		return flag;
	}
	//注册用户写入数据库
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
			System.out.println("注册用户写入数据库异常！！！");
		}finally{
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
	}
	//提供userList，传入1展示管理员，2展示普通用户
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
			System.out.println("登陆验证异常！！！");
			e.printStackTrace();
		}finally{
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
		return users;
	}
	
	//改变管理员，传入1则设置该用户为管理员，2则删掉该管理员
	public static void changeAdmin(String account,int i) {
		try {
			con = DBManager.getCon(con);
			pst = con.prepareStatement("update user set type = ? where account = ?");
			pst.setInt(1, i);
			pst.setString(2, account);
			pst.execute();
		} catch (Exception e) {
			System.out.println("改变管理员写入数据库异常！！！");
		}finally{
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
	}
	
	//修改用户信息
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
				System.out.println("用户写入数据库异常！！！");
				e.printStackTrace();
			}finally{
				DBManager.closeRst(rst);
				DBManager.closePst(pst);
				DBManager.closeCon(con);
			}
		}
		
		//修改vip信息
				public static void updateVip(String psw,int type,int no) {
					try {
						con = DBManager.getCon(con);
						pst = con.prepareStatement("update user set password = ? , type = ? where no = ?");
						pst.setString(1, psw);
						pst.setInt(2, type);
						pst.setInt(3, no);
						pst.execute();
					} catch (Exception e) {
						System.out.println("修改vip写入数据库异常！！！");
						e.printStackTrace();
					}finally{
						DBManager.closeRst(rst);
						DBManager.closePst(pst);
						DBManager.closeCon(con);
					}
				}
				
				//修改个人密码
				public static void updatePsw(String psw,String account) {
					try {
						con = DBManager.getCon(con);
						pst = con.prepareStatement("update user set password = ?  where account = ?");
						pst.setString(1, psw);
						pst.setString(2, account);
						pst.execute();
					} catch (Exception e) {
						System.out.println("修改密码写入数据库异常！！！");
						e.printStackTrace();
					}finally{
						DBManager.closeRst(rst);
						DBManager.closePst(pst);
						DBManager.closeCon(con);
					}
				}
}
