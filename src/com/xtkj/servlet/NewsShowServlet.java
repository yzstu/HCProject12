package com.xtkj.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xtkj.dao.NewsDao;
import com.xtkj.dao.UserDao;
import com.xtkj.pojo.News;

public class NewsShowServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public NewsShowServlet() {
		super();
	}
	ArrayList<News> newss = new ArrayList<News>();
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int i =  Integer.parseInt(req.getParameter("type"));
		newss = NewsDao.showNews();
        String p = req.getParameter("page");
        int page;
        try {
            //当前页数
            page = Integer.valueOf(p);
        } catch (NumberFormatException e) {
            page = 1;
        }
        //用户总数
        int totalNews = newss.size();
        //每页用户数
        int newssPerPage = 10;
        //总页数
        int totalPages = totalNews % newssPerPage == 0 ? totalNews / newssPerPage : totalNews / newssPerPage + 1;
        //本页起始用户序号
        int beginIndex = (page - 1) * newssPerPage;
        //本页末尾用户序号的下一个
        int endIndex = beginIndex + newssPerPage;
        if (endIndex > totalNews)
            endIndex = totalNews;
        req.setAttribute("totalNews", totalNews);
        req.setAttribute("newssPerPage", newssPerPage);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("beginIndex", beginIndex);
        req.setAttribute("endIndex", endIndex);
        req.setAttribute("page", page);
        req.setAttribute("newss", newss);
        if (i==1) {
        	req.setAttribute("account", req.getAttribute("account"));
        	req.getRequestDispatcher("HCManager/news.jsp").forward(req, resp);
		}else if (i==2) {
			req.getRequestDispatcher("HC/new.jsp").forward(req, resp);
		}
    }

}
