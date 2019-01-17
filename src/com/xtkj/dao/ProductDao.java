package com.xtkj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.xtkj.DBManager.DBManager;
import com.xtkj.pojo.Product;
import com.xtkj.pojo.User;

public class ProductDao {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rst = null;
	
	public static void addProducts(String imgurl,String title,String phone,double price,int quantity,String isshow) {
		try {
			con = DBManager.getCon(con);
			pst = con.prepareStatement("insert pinfo ( imgurl , title , phone , price , quantity , isshow ) values (?,?,?,?,?,?)");
			pst.setString(1, imgurl);
			pst.setString(2, title);
			pst.setString(3, phone);
			pst.setDouble(4, price);
			pst.setInt(5, quantity);
			pst.setString(6, isshow);
			pst.execute();
		} catch (Exception e) {
			System.out.println("添加产品写入数据库异常！！！");
		}finally{
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
	}
	
	public static ArrayList<Product> showProducts() {
		ArrayList<Product> products = new ArrayList<Product>();
		try {
			con = DBManager.getCon(con);
			pst = con.prepareStatement("select * from pinfo where isshow = 1");
			rst = pst.executeQuery();
			Product product = null;
			while (rst.next()) {
				product = new Product();
				product.setNo(rst.getInt("no"));
				product.setTitle(rst.getString("title"));
				product.setImgurl(rst.getString("imgurl"));
				product.setQuantity(rst.getInt("quantity"));
				product.setIsshow(rst.getString("isshow"));
				product.setPhone(rst.getString("phone"));
				product.setPrice(rst.getDouble("price"));
				products.add(product);
			}
		} catch (Exception e) {
			System.out.println("查询产品数据库异常！！！");
			e.printStackTrace();
		}finally{
			DBManager.closeRst(rst);
			DBManager.closePst(pst);
			DBManager.closeCon(con);
		}
		return products;
	}
	
}
