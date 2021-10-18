package com.uts.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.uts.bean.AdminBean;
import com.uts.bean.BookBean;
import com.uts.dao.AdminDao;
import com.uts.dao.BookDao;


@WebServlet("/ReturnBookServlet")
public class ReturnBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReturnBookServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				int hid = Integer.parseInt(request.getParameter("hid"));
				int bid = Integer.parseInt(request.getParameter("bid"));
				int aid = Integer.parseInt(request.getParameter("aid"));

				BookDao bookDao = new BookDao();
				bookDao.borrowBook2(hid);


				String endTime = request.getParameter("endTime");

				Date currentTime = new Date();
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
				String dateString = formatter.format(currentTime); 

				Double outNum = 0.0;

				try {
					outNum = differentDays(endTime, dateString);
				} catch (ParseException e) {
					e.printStackTrace();
				}

				System.out.println(outNum);
				if (outNum > 0) {
					BookBean book = bookDao.get_BookInfo(bid);
					AdminDao adminDao = new AdminDao();
					HttpSession session = request.getSession();
					AdminBean user = (AdminBean) session.getAttribute("admin");

					double outPrice = outNum * book.getOverduePrice();
					user.setBalance(user.getBalance() - outPrice);
					adminDao.updateUser(aid, user.getUsername(), user.getPassword(), user.getName(), user.getEmail(),
							user.getPhone(), user.getLend_num(),  user.getBalance());


					bookDao.updateOut(hid, outNum, outPrice);

				}

				response.sendRedirect("/e-library/borrow.jsp");
	}
	
	public static double differentDays(String from, String to)
			throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date beginDate = sdf.parse(from);
		Date endDate = sdf.parse(to);

		double days = ((endDate.getTime() - beginDate.getTime()) * 1.0 / (1000 * 3600 * 24));

		return Math.floor(days);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
