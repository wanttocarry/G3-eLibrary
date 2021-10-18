package com.uts.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uts.dao.BookDao;

@WebServlet("/UpdateBookServlet")
public class UpdateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateBookServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String card = request.getParameter("card");
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String author = request.getParameter("author");
		String press = request.getParameter("press");
		int bid = Integer.parseInt(request.getParameter("updatebid"));
		float bookPrice = Float.parseFloat(request.getParameter("bookPrice"));
		float borrowPrice = Float.parseFloat(request.getParameter("borrowPrice"));
		float overduePrice = Float.parseFloat(request.getParameter("overduePrice"));
		BookDao bookdao = new BookDao();
		bookdao.updateBook(bid, card, name, type, author, press, bookPrice, borrowPrice, overduePrice);
		response.sendRedirect("/e-library/admin_book.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
