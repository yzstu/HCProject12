package com.xtkj.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.xtkj.dao.AdvertisingDao;

@SuppressWarnings("serial")
public class ChangeAdvertisingServlet extends HttpServlet {

	public ChangeAdvertisingServlet() {
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
			int isshow = Integer.parseInt(req.getParameter("isshow"));
			int priority = Integer.parseInt(req.getParameter("priority"));
			//��ȡ���������ݣ�ͼƬ��
			Files files = smartUpload.getFiles();
			
				File file = files.getFile(0);
				
				String fileName = file.getFileName();
				
				//���ϴ������ݱ��浽ָ����ַ
				file.saveAs(path+fileName);
				//�������ݴ洢�����ݿ���
				//���ļ�·���洢�����ݿ���
				String imgurl = path+fileName;
				AdvertisingDao.changeAd(imgurl, name, url, isshow, priority, no);
				request.getRequestDispatcher("advShowServlet").forward(request, response);
		} catch (Exception e) {
			System.out.println("�޸Ĺ����Ϣ�����쳣������");
			e.printStackTrace();
		}
	}

}
