package com.xtkj.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xtkj.dao.UserDao;

public class VerificationServle extends HttpServlet {

	
	public VerificationServle() {
		super();
	}

	
	public void destroy() {
		super.destroy();
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
		String psw = request.getParameter("password");
		String validateCode = request.getParameter("validateCode");
 		String imageMask = (String) request.getSession().getAttribute("imageMask");
 		if (imageMask.equals(validateCode)) {
 			int i = UserDao.checkAccount(account,psw);
			if (i==0) {
				request.setAttribute("account", account);
				request.getRequestDispatcher("HCManager/index.jsp?type=0").forward(request, response);
			}else if (i==1) {
				request.setAttribute("account", account);
				request.getRequestDispatcher("HCManager/index.jsp?type=1").forward(request, response);
			}else if (i==2) {
				request.getSession().setAttribute("account", account);
				request.getRequestDispatcher("HC/index.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "账号或密码错误");
				request.getRequestDispatcher("login,jsp").forward(request, response);
			}

		}
	}

	
	public void init() throws ServletException {
		
	}

}
