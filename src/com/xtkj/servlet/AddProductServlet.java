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
		//创建smartUpload对象
		SmartUpload smartUpload = new SmartUpload();
		//初始化该对象
		smartUpload.initialize(this.getServletConfig(), request, response);
		try {
			//上传
			smartUpload.upload();
			
			//获取表单数据
			Request req = smartUpload.getRequest();
			String phone = req.getParameter("phone");
			String title = req.getParameter("title");
			String isshow = req.getParameterValues("isshow")[0];
			double price = Double.parseDouble(req.getParameter("price"));
			int quantity = Integer.parseInt(req.getParameter("quantity"));
			Files files = smartUpload.getFiles();
			
				File file = files.getFile(0);
				
				String fileName = file.getFileName();
				
				//将上传的内容保存到指定地址
				file.saveAs(path+fileName);
				//将表单数据存储到数据库中
				//将文件路径存储到数据库中
				String imgUrl = path+fileName;
				ProductDao.addProducts(imgUrl,title,phone,price,quantity,isshow);
				request.getRequestDispatcher("prductShowServlet?type=1").forward(request, response);
		} catch (Exception e) {
			System.out.println("添加产品出现异常！！！");
			e.printStackTrace();
		}
	}

}
