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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
	
		
		AdminDao userdao = new AdminDao();
		boolean result = userdao.Login_verify(username, password);
		
		
			HttpSession session = request.getSession();
			if (result) {
				
				AdminBean adminbean = new AdminBean();
				
				AdminDao admindao = new AdminDao();
				adminbean = admindao.getAdminInfo(username, password);
				session.setAttribute("admin", adminbean);

				if (adminbean.getStatus() == 1) {
					response.sendRedirect("/e-library/index.jsp");
				} else {

					response.sendRedirect("/e-library/admin.jsp");
				}

			} else {

				session.setAttribute("state", "wrong password");
				
				response.sendRedirect("/e-library/login.jsp");
			}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
