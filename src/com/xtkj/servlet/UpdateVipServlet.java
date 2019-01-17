package com.xtkj.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xtkj.dao.UserDao;

@SuppressWarnings("serial")
public class UpdateVipServlet extends HttpServlet {

	
	public UpdateVipServlet() {
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
		int no = Integer.parseInt(request.getParameter("no"));
		String psw = request.getParameter("password");
		int type =Integer.parseInt(request.getParameterValues("styleshoice2")[0]);
		UserDao.updateVip(psw, type, no);
		request.getRequestDispatcher("userShowServlet?type=2").forward(request, response);
	}

}
