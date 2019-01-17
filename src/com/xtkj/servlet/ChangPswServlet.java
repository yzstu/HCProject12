package com.xtkj.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xtkj.dao.UserDao;

@SuppressWarnings("serial")
public class ChangPswServlet extends HttpServlet {

	public ChangPswServlet() {
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
		String psw = request.getParameter("newpsw");
		System.out.println(psw);
		UserDao.updatePsw(psw, account);
		request.setAttribute("msg", "ÃÜÂëÒÑÐÞ¸Ä");
		request.getRequestDispatcher("HCManager/changepwd.jsp").forward(request, response);
	}

}
