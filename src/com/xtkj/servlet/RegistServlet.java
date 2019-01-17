package com.xtkj.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.xtkj.DBManager.DBManager;
import com.xtkj.dao.UserDao;

public class RegistServlet extends HttpServlet {

	public RegistServlet() {
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
		String type = request.getParameter("type");
		response.setContentType("text/html");
		String path="images\\photo\\";	
		//创建smartUpload对象
		SmartUpload smartUpload = new SmartUpload();
		//初始化该对象
		smartUpload.initialize(this.getServletConfig(), request, response);
		try {
			//上传
			smartUpload.upload();
			
			//获取表单数据
			Request req = smartUpload.getRequest();
			String account = req.getParameter("account");
			String password = req.getParameter("password");
			String name = req.getParameter("name");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			//获取二进制数据（图片）
			Files files = smartUpload.getFiles();
			
				File file = files.getFile(0);
				
				String fileName = file.getFileName();
				
				//将上传的内容保存到指定地址
				file.saveAs(path+fileName);
				//将表单数据存储到数据库中
				//将文件路径存储到数据库中
				String url = path+fileName;
				UserDao.addUser(account,password,url,name,phone,address);
				if (type.equals("0")) {
					response.sendRedirect("login.jsp");
				}else if (type.equals("1")) {
					request.getRequestDispatcher("userShowServlet?type=2").forward(request, response);
				}
				
		} catch (Exception e) {
			System.out.println("注册出现异常！！！");
			e.printStackTrace();
		}
	}

	public void init() throws ServletException {
		
	}

}
