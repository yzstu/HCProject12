package com.xtkj.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xtkj.dao.NewsDao;

public class NewsAddServlet extends HttpServlet {
	public NewsAddServlet() {
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
		request.setCharacterEncoding("utf-8");
		String author = request.getParameter("account");
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		System.out.println(author);
		NewsDao.newsAdd(title, content, author);
		request.setAttribute("account", author);
		request.getRequestDispatcher("newsShowServlet?type=1").forward(request, response);
	}

}
