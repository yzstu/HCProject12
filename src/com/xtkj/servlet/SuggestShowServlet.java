package com.xtkj.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xtkj.dao.SuggestDao;
import com.xtkj.dao.UserDao;
import com.xtkj.pojo.Suggest;

@SuppressWarnings("serial")
public class SuggestShowServlet extends HttpServlet {


	public SuggestShowServlet() {
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
	}
	ArrayList<Suggest> suggests = new ArrayList<Suggest>();
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		suggests = SuggestDao.showSuggest();
        String p = req.getParameter("page");
        int page;
        try {
            //当前页数
            page = Integer.valueOf(p);
        } catch (NumberFormatException e) {
            page = 1;
        }
        //用户总数
        int totalSuggests = suggests.size();
        //每页用户数
        int suggestsPerPage = 10;
        //总页数
        int totalPages = totalSuggests % suggestsPerPage == 0 ? totalSuggests / suggestsPerPage : totalSuggests / suggestsPerPage + 1;
        //本页起始用户序号
        int beginIndex = (page - 1) * suggestsPerPage;
        //本页末尾用户序号的下一个
        int endIndex = beginIndex + suggestsPerPage;
        if (endIndex > totalSuggests)
            endIndex = totalSuggests;
        req.setAttribute("totalSuggests", totalSuggests);
        req.setAttribute("suggestsPerPage", suggestsPerPage);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("beginIndex", beginIndex);
        req.setAttribute("endIndex", endIndex);
        req.setAttribute("page", page);
        req.setAttribute("suggests", suggests);
        req.getRequestDispatcher("HCManager/opinion.jsp").forward(req, resp);
		
        
    }

}
