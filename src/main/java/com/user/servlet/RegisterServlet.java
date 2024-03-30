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

@WebServlet("/registration")
public class RegisterServlet extends HttpServlet {

//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		try {
//			String name=req.getParameter("fname");
//			String email=req.getParameter("email");
//			String phno=req.getParameter("phno");
//			String password=req.getParameter("password");
//			String check=req.getParameter("check");
//			
//			System.out.println(name+" "+email+" "+phno+" "+password+" "+check);
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

			// System.out.println(name+" "+email+" "+phno+" "+password+" "+check);

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);

			HttpSession session = req.getSession();

			if (check != null) {
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());

				boolean f = dao.userRegister(us);

				if (f) {

					// System.out.println("Data Inserted Successfully...!");
					
					session.setAttribute("msg", "Registration Successfull,Please Login With Same Credential");
					//RequestDispatcher  rd =	req.getRequestDispatcher("login.jsp");
					//rd.forward(req, resp);
					resp.sendRedirect("login.jsp");
				} else {
//					// System.out.println("Failed...!");
//					RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
//					rd.include(req, resp);
					
					session.setAttribute("message", "Registration Unsuccessfull...!");
					resp.sendRedirect("registration.jsp");
				}
			} else {
				
				session.setAttribute("message", "Registration Unsuccessfull...!");
				resp.sendRedirect("registration.jsp");

			}

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
