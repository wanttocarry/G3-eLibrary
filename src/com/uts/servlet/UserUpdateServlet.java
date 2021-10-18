package com.uts.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.uts.bean.AdminBean;
import com.uts.dao.AdminDao;

@WebServlet("/UserUpdateServlet")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserUpdateServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		HttpSession session = request.getSession();
		AdminBean user = (AdminBean) session.getAttribute("admin");
		int aid = user.getAid();
		String username = user.getUsername();
		int lend_num = user.getLend_num();
		double balance = user.getBalance();

		AdminDao adminDao = new AdminDao();

		adminDao.updateUser(aid, username, password, name, email, phone, lend_num, balance);

		AdminBean newUser = new AdminBean();
		newUser.setAid(aid);
		newUser.setName(username);
		newUser.setPassword(password);
		newUser.setName(name);
		newUser.setEmail(email);
		newUser.setPhone(phone);
		newUser.setLend_num(lend_num);
		newUser.setBalance(balance);

		session.setAttribute("admin", newUser);

		response.sendRedirect("/e-library/user_information.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
