package com.user.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");

		UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());

		HttpSession session = req.getSession();

		try {

			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {

				User us = new User();
				us.setName("Admin");
//				req.setAttribute("userobj", us);
//				RequestDispatcher  rd =	req.getRequestDispatcher("admin/admin_home.jsp");
//				rd.forward(req, resp);

				session.setAttribute("userobj", us);
				resp.sendRedirect("admin/admin_home.jsp");

			} else {
				User user = dao.userLogin(email, password);

				if (user != null) {
					session.setAttribute("user", user);
					RequestDispatcher  rd =	req.getRequestDispatcher("admin.jsp");
					rd.forward(req, resp);
					//resp.sendRedirect("admin.jsp");

				}

				else {

					//session.setAttribute("msg", "Email & Password Invalid");
//					RequestDispatcher  rd =	req.getRequestDispatcher("login.jsp");
//					rd.include(req, resp);

					resp.sendRedirect("login.jsp?error=invalid");
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
