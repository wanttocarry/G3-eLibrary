package com.uts.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uts.dao.BookDao;

@WebServlet("/delayBookServlet")
public class delayBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public delayBookServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int hid = Integer.parseInt(request.getParameter("hid"));
		String endTime = request.getParameter("endTime");


		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Calendar cd = Calendar.getInstance();
		try {
			cd.setTime(sdf.parse(endTime));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		cd.add(Calendar.DATE, 5);

		endTime = sdf.format(cd.getTime());


		BookDao bookDao = new BookDao();
		bookDao.updateBookReturnTime(hid, endTime);

		response.sendRedirect("/e-library/borrow.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
