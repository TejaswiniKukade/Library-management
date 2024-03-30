package com.admin_servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

@WebServlet("/addbooks")
@MultipartConfig
public class BooksAdd extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			double price=Double.parseDouble(req.getParameter("price"));
			String categories=req.getParameter("btype");
			String status=req.getParameter("bstatus");
			Part part=req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			
			BookDetails b=new BookDetails(bookName,author,price,categories,status,fileName,"admin");
			
            BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
            
            
            boolean f=dao.addBooks(b);
            
            HttpSession session=req.getSession();
            
            if(f)
            {
            	
            	String path=getServletContext().getRealPath("")+ "book";
                
                File fi=new File(path);
                
                part.write(path + File.separator + fileName);
                
            	
            	
            	session.setAttribute("succmsg","Book Add Successfully");
            	resp.sendRedirect("admin/add_books.jsp");
            }
            else
            {
            	session.setAttribute("failed","Something Wrong On Server");
            	resp.sendRedirect("admin/add_books.jsp");
            }
            
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	

}
