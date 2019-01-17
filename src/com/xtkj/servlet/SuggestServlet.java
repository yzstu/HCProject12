package com.xtkj.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xtkj.dao.SuggestDao;

public class SuggestServlet extends HttpServlet {

	
	public SuggestServlet() {
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
		String account = request.getParameter("account");
		String suggest = request.getParameter("suggest");
		SuggestDao.addSuggest(account, suggest);
		String msg = "上传成功，谢谢您的建议！！！";
		request.getRequestDispatcher("HC/contact.jsp?msg="+msg).forward(request, response);
	}

}
