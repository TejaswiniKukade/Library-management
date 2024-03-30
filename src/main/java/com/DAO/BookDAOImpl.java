package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;

public class BookDAOImpl implements BooksDAO {

	private Connection conn;

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBooks(BookDetails b) {

		boolean f = false;
		try {

			String sql = "insert into book_details(bookname,author,price,bookCategory,status,photo,email) values(?,?,?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setDouble(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());

			int result = ps.executeUpdate();

			if (result == 1) {
				f = true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<BookDetails> getAllBooks() {

		List<BookDetails> list = new ArrayList<BookDetails>();

		BookDetails b = null;

		try {

			String sql = "select * from book_details";

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				b = new BookDetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// Edit page coding

	@Override
	public BookDetails getBookById(int id) {

		BookDetails b = null;
		try {

			String sql = "select * from book_details where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	@Override
	public boolean updateEditBooks(BookDetails b) {

		boolean f = false;

		try {

			String sql = "update book_details set bookname=?,author=?,price=?,status=? where bookid=?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setDouble(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookid());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean deleteBooks(int id) {

		boolean f = false;

		try {

			String sql = "delete from book_details where bookid=?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, id);
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<BookDetails> getNewBook() {

		List<BookDetails> list = new ArrayList<BookDetails>();

		BookDetails b = null;
		try {

			String sql = "select * from book_details  where bookCategory=? and status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetails();

				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getRecentBook() {

		List<BookDetails> list = new ArrayList<BookDetails>();

		BookDetails b = null;
		try {

			String sql = "select * from book_details  where  status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetails();

				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getOldBook() {

		List<BookDetails> list = new ArrayList<BookDetails>();

		BookDetails b = null;
		try {

			String sql = "select * from book_details  where bookCategory=? and status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetails();

				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllRecentBook() {

		List<BookDetails> list = new ArrayList<BookDetails>();

		BookDetails b = null;
		try {

			String sql = "select * from book_details  where  status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDetails();

				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<BookDetails> getAllNewBook() {

		List<BookDetails> list = new ArrayList<BookDetails>();

		BookDetails b = null;
		try {

			String sql = "select * from book_details  where bookCategory=? and status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDetails();

				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public List<BookDetails> getAllOldBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();

		BookDetails b = null;
		try {

			String sql = "select * from book_details  where bookCategory=? and status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new BookDetails();

				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
