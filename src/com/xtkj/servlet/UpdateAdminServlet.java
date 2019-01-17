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
import com.xtkj.dao.UserDao;

@SuppressWarnings("serial")
public class UpdateAdminServlet extends HttpServlet {

	public UpdateAdminServlet() {
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
		String account = request.getParameter("acc");
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
			String password = req.getParameter("password");
			String name = req.getParameter("name");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			double money =  Double.parseDouble(req.getParameter("money"));
			//��ȡ���������ݣ�ͼƬ��
			Files files = smartUpload.getFiles();
			
				File file = files.getFile(0);
				
				String fileName = file.getFileName();
				
				//���ϴ������ݱ��浽ָ����ַ
				file.saveAs(path+fileName);
				//�������ݴ洢�����ݿ���
				//���ļ�·���洢�����ݿ���
				String url = path+fileName;
				UserDao.updateUser(account,password,url,name,phone,money);
				request.getRequestDispatcher("userShowServlet?type=1").forward(request, response);
		} catch (Exception e) {
			System.out.println("�޸Ļ�Ա��Ϣ�����쳣������");
			e.printStackTrace();
		}
	}

}
