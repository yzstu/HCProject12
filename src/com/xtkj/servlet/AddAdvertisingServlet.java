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
import com.xtkj.dao.AdvertisingDao;
import com.xtkj.dao.UserDao;

public class AddAdvertisingServlet extends HttpServlet {

	public AddAdvertisingServlet() {
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
		String path="images\\advphoto\\";	
		//����smartUpload����
		SmartUpload smartUpload = new SmartUpload();
		//��ʼ���ö���
		smartUpload.initialize(this.getServletConfig(), request, response);
		try {
			//�ϴ�
			smartUpload.upload();
			
			//��ȡ������
			Request req = smartUpload.getRequest();
			String name = req.getParameter("name");
			String url = req.getParameter("url");
			int isshow = Integer.parseInt(req.getParameterValues("isshow")[0]);
			int priority = Integer.parseInt(req.getParameter("priority"));
			Files files = smartUpload.getFiles();
			
				File file = files.getFile(0);
				
				String fileName = file.getFileName();
				
				//���ϴ������ݱ��浽ָ����ַ
				file.saveAs(path+fileName);
				//�������ݴ洢�����ݿ���
				//���ļ�·���洢�����ݿ���
				String imgUrl = path+fileName;
				AdvertisingDao.addAd(imgUrl, name, url, isshow, priority);
				request.getRequestDispatcher("HCManager/banner.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("��ӹ������쳣������");
			e.printStackTrace();
		}
	}

}
