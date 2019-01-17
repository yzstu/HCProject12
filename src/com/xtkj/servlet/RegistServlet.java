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
		//����smartUpload����
		SmartUpload smartUpload = new SmartUpload();
		//��ʼ���ö���
		smartUpload.initialize(this.getServletConfig(), request, response);
		try {
			//�ϴ�
			smartUpload.upload();
			
			//��ȡ������
			Request req = smartUpload.getRequest();
			String account = req.getParameter("account");
			String password = req.getParameter("password");
			String name = req.getParameter("name");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			//��ȡ���������ݣ�ͼƬ��
			Files files = smartUpload.getFiles();
			
				File file = files.getFile(0);
				
				String fileName = file.getFileName();
				
				//���ϴ������ݱ��浽ָ����ַ
				file.saveAs(path+fileName);
				//�������ݴ洢�����ݿ���
				//���ļ�·���洢�����ݿ���
				String url = path+fileName;
				UserDao.addUser(account,password,url,name,phone,address);
				if (type.equals("0")) {
					response.sendRedirect("login.jsp");
				}else if (type.equals("1")) {
					request.getRequestDispatcher("userShowServlet?type=2").forward(request, response);
				}
				
		} catch (Exception e) {
			System.out.println("ע������쳣������");
			e.printStackTrace();
		}
	}

	public void init() throws ServletException {
		
	}

}
