package com.xtkj.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xtkj.dao.ProductDao;
import com.xtkj.dao.SuggestDao;
import com.xtkj.pojo.Product;

public class PrductShowServlet extends HttpServlet {

 
	public PrductShowServlet() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		
	}
	ArrayList<Product> products = new ArrayList<Product>();
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String type = req.getParameter("type");
		products  = ProductDao.showProducts();
        String p = req.getParameter("page");
        int page;
        try {
            //当前页数
            page = Integer.valueOf(p);
        } catch (NumberFormatException e) {
            page = 1;
        }
        //用户总数
        int totalProducts = products.size();
        //每页用户数
        int productsPerPage = 10;
        //总页数
        int totalPages = totalProducts % productsPerPage == 0 ? totalProducts / productsPerPage : totalProducts / productsPerPage + 1;
        //本页起始用户序号
        int beginIndex = (page - 1) * productsPerPage;
        //本页末尾用户序号的下一个
        int endIndex = beginIndex + productsPerPage;
        if (endIndex > totalProducts)
            endIndex = totalProducts;
        req.setAttribute("totalProducts", totalProducts);
        req.setAttribute("productsPerPage", productsPerPage);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("beginIndex", beginIndex);
        req.setAttribute("endIndex", endIndex);
        req.setAttribute("page", page);
        req.setAttribute("products", products);
        if (type.equals("1")) {
        	req.getRequestDispatcher("HCManager/product.jsp").forward(req, resp);
		}else if (type.equals("2")) {
			req.getRequestDispatcher("HC/products.jsp").forward(req, resp);
		}
        
		
        
    }


}
