package com.xtkj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.xtkj.DBManager.DBManager;
import com.xtkj.pojo.News;

public class NewsDao {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rst = null;
	//提供newsList
		public static ArrayList<News> showNews() {
			ArrayList<News> newss = new ArrayList<News>();
			try {
				con = DBManager.getCon(con);
				pst = con.prepareStatement("select * from news ");
				rst = pst.executeQuery();
				News news = null;
				while (rst.next()) {
					news = new News();
					news.setNo(rst.getInt("no"));
					news.setTitle(rst.getString("title"));
					news.setContent(rst.getString("content"));
					news.setAuthor(rst.getString("author"));
					news.setTime(rst.getTimestamp("time"));
					newss.add(news);
				}
			} catch (Exception e) {
				System.out.println("获取新闻列表异常！！！");
				e.printStackTrace();
			}finally{
				DBManager.closeRst(rst);
				DBManager.closePst(pst);
				DBManager.closeCon(con);
			}
			return newss;
		}
		
		
		public static void newsAdd(String title,String content,String author) {
			try {
				con = DBManager.getCon(con);
				pst = con.prepareStatement("insert news ( title , content , author ) values (?,?,?)");
				pst.setString(1, title);
				pst.setString(2, content);
				pst.setString(3, author);
				pst.execute();
			} catch (Exception e) {
				System.out.println("添加新闻时数据库异常！！！");
				e.printStackTrace();
			}finally{
				DBManager.closePst(pst);
				DBManager.closeCon(con);
			}
		}
		
		public static News getNews(int no) {
			try {
				News news = null;
				con = DBManager.getCon(con);
				pst = con.prepareStatement("select * from news where no = ? ");
				pst.setInt(1, no);
				rst = pst.executeQuery();
				while (rst.next()) {
					news = new News();
					news.setTitle(rst.getString("title"));
					news.setContent(rst.getString("content"));
					news.setAuthor(rst.getString("author"));
					news.setTime(rst.getTimestamp("time"));
					return news;
				}
			} catch (Exception e) {
				System.out.println("获取新闻列表异常！！！");
				e.printStackTrace();
			}finally{
				DBManager.closeRst(rst);
				DBManager.closePst(pst);
				DBManager.closeCon(con);
			}
			
			return null;
			
		}
}
