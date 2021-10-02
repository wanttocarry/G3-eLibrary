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
import com.uts.dao.BookDao;

@WebServlet("/BorrowBookServlet")
public class BorrowBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BorrowBookServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		BookDao bookdao = new BookDao();

		int bid = Integer.parseInt(request.getParameter("bid"));
		String card = request.getParameter("card");
		String name = request.getParameter("name");
		float borrowPrice = Float.parseFloat(request.getParameter("borrowPrice"));

		HttpSession session = request.getSession();
		AdminBean admin = new AdminBean();
		admin = (AdminBean) session.getAttribute("admin");
		int aid = admin.getAid();
		AdminDao admindao = new AdminDao();

		bookdao.borrowBook(bid, card, name, borrowPrice, admin);

		 admindao.subBalance(aid, borrowPrice);

		response.sendRedirect("/e-library/book.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
