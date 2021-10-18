package com.uts.servlet;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.uts.bean.AdminBean;
import com.uts.bean.HistoryBean;
import com.uts.dao.BookDao;


@WebServlet("/BorrowSlectServlet")
public class BorrowSlectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BorrowSlectServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("name");
		
		HttpSession session = request.getSession();
		AdminBean user = (AdminBean) session.getAttribute("admin");
		
		
		BookDao bookdao = new BookDao();
		ArrayList<HistoryBean> data = bookdao.getBorrowList(name,user.getAid());
		request.setAttribute("data", data);
		String url = "";
			url = response.encodeURL("borrowSearch.jsp");
		request.getRequestDispatcher(url).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
