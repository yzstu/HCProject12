package com.xtkj.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xtkj.dao.NewsDao;
import com.xtkj.pojo.News;

public class NewsSiteShowServlet extends HttpServlet {

	public NewsSiteShowServlet() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		this.doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		
	}
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		News news = new News();
		int no = Integer.parseInt(req.getParameter("no"));
		news = NewsDao.getNews(no);
		req.setAttribute("news", news);
		req.getRequestDispatcher("HC/newsite.jsp").forward(req, resp);
	}

}
