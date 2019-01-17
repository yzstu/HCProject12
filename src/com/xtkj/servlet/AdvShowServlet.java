package com.xtkj.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xtkj.dao.AdvertisingDao;
import com.xtkj.dao.UserDao;
import com.xtkj.pojo.Advertising;

@SuppressWarnings("serial")
public class AdvShowServlet extends HttpServlet {

	public AdvShowServlet() {
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
	ArrayList<Advertising> advs = new ArrayList<Advertising>();
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		advs=AdvertisingDao.showAdvs();
        String p = req.getParameter("page");
        int page;
        try {
            //当前页数
            page = Integer.valueOf(p);
        } catch (NumberFormatException e) {
            page = 1;
        }
        //用户总数
        int totalAdvs = advs.size();
        //每页用户数
        int advsPerPage = 10;
        //总页数
        int totalPages = totalAdvs % advsPerPage == 0 ? totalAdvs / advsPerPage : totalAdvs / advsPerPage + 1;
        //本页起始用户序号
        int beginIndex = (page - 1) * advsPerPage;
        //本页末尾用户序号的下一个
        int endIndex = beginIndex + advsPerPage;
        if (endIndex > totalAdvs)
            endIndex = totalAdvs;
        req.setAttribute("totalAdvs", totalAdvs);
        req.setAttribute("advsPerPage", advsPerPage);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("beginIndex", beginIndex);
        req.setAttribute("endIndex", endIndex);
        req.setAttribute("page", page);
        req.setAttribute("advs", advs);
        req.getRequestDispatcher("HCManager/banner.jsp").forward(req, resp);
    }

}
