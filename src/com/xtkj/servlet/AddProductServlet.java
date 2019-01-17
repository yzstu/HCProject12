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
import com.xtkj.dao.ProductDao;

@SuppressWarnings("serial")
public class AddProductServlet extends HttpServlet {


	public AddProductServlet() {
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
		String path="images\\productphoto\\";	
		//����smartUpload����
		SmartUpload smartUpload = new SmartUpload();
		//��ʼ���ö���
		smartUpload.initialize(this.getServletConfig(), request, response);
		try {
			//�ϴ�
			smartUpload.upload();
			
			//��ȡ������
			Request req = smartUpload.getRequest();
			String phone = req.getParameter("phone");
			String title = req.getParameter("title");
			String isshow = req.getParameterValues("isshow")[0];
			double price = Double.parseDouble(req.getParameter("price"));
			int quantity = Integer.parseInt(req.getParameter("quantity"));
			Files files = smartUpload.getFiles();
			
				File file = files.getFile(0);
				
				String fileName = file.getFileName();
				
				//���ϴ������ݱ��浽ָ����ַ
				file.saveAs(path+fileName);
				//�������ݴ洢�����ݿ���
				//���ļ�·���洢�����ݿ���
				String imgUrl = path+fileName;
				ProductDao.addProducts(imgUrl,title,phone,price,quantity,isshow);
				request.getRequestDispatcher("prductShowServlet?type=1").forward(request, response);
		} catch (Exception e) {
			System.out.println("��Ӳ�Ʒ�����쳣������");
			e.printStackTrace();
		}
	}

}
