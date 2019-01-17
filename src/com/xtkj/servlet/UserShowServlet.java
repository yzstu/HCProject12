package com.xtkj.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xtkj.dao.UserDao;
import com.xtkj.pojo.User;

public class UserShowServlet extends HttpServlet {

	ArrayList<User> users = new ArrayList<User>();
	public UserShowServlet() {
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

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
	}

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int i = Integer.parseInt(req.getParameter("type"));
		users = UserDao.showUser(i);
        String p = req.getParameter("page");
        int page;
        try {
            //��ǰҳ��
            page = Integer.valueOf(p);
        } catch (NumberFormatException e) {
            page = 1;
        }
        //�û�����
        int totalUsers = users.size();
        //ÿҳ�û���
        int usersPerPage = 10;
        //��ҳ��
        int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
        //��ҳ��ʼ�û����
        int beginIndex = (page - 1) * usersPerPage;
        //��ҳĩβ�û���ŵ���һ��
        int endIndex = beginIndex + usersPerPage;
        if (endIndex > totalUsers)
            endIndex = totalUsers;
        req.setAttribute("totalUsers", totalUsers);
        req.setAttribute("usersPerPage", usersPerPage);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("beginIndex", beginIndex);
        req.setAttribute("endIndex", endIndex);
        req.setAttribute("page", page);
        req.setAttribute("users", users);
        if (i==1) {
        	req.getRequestDispatcher("HCManager/user.jsp").forward(req, resp);
		}else if (i==2) {
			req.getRequestDispatcher("HCManager/vip.jsp").forward(req, resp);
		}
        
    }

	public void init() throws ServletException {
		
	}

}
