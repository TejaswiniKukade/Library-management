package com.admin_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			double price=Double.parseDouble(req.getParameter("price"));
			String status=req.getParameter("bstatus");
			
			BookDetails b=new BookDetails();
			
			b.setBookid(id);
			b.setBookname(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			boolean f=dao.updateEditBooks(b);
			
			HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("succmsg", "Book Update Sucessfully...");
				resp.sendRedirect("admin/all_books.jsp");
			}else {
				
				session.setAttribute("failed", "Something Wrong on server");
				resp.sendRedirect("admin/all_books.jsp");
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	

}
