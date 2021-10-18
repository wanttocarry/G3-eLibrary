package com.uts.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uts.dao.AdminDao;


@WebServlet("/AdminUserUpdateServlet")
public class AdminUserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminUserUpdateServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int aid  = Integer.parseInt(request.getParameter("aid"));
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		double balance = Double.parseDouble(request.getParameter("balance"));
		
		
		AdminDao adminDao = new AdminDao();
		
		adminDao.updateUser(aid, username, password, name, email, phone, 5, balance);
		
		
		response.sendRedirect("/e-library/admin_user.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
