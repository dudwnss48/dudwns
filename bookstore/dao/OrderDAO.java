package com.sample.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sample.bookstore.util.ConnectionUtil;
import com.sample.bookstore.util.QueryUtil;
import com.sample.bookstore.vo.Book;
import com.sample.bookstore.vo.Order;
import com.sample.bookstore.vo.User;

public class OrderDAO {
	public void addOrder(Order order) throws SQLException {
		//		String sql = "insert INTO sample_book_orders " + 
		//				"(ORDER_NO\r\n" + 
		//				"USER_ID\r\n" + 
		//				"BOOK_NO\r\n" + 
		//				"ORDER_PRICE\r\n" + 
		//				"ORDER_AMOUNT\r\n" + 
		//				"ORDER_REGISTERED_DATE) " + 
		//				"values " + 
		//				"(sample_book_seq.nextval, ?, ?, ?, sysdate)";

		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt  = connection.prepareStatement(QueryUtil.getSQL("order.addorder"));

		pstmt.setString(1, order.getUser().getId());
		pstmt.setInt(2, order.getBook().getNo());
		pstmt.setInt(3, order.getPrice());
		pstmt.setInt(4, order.getAmount());

		pstmt.executeUpdate();

		pstmt.close();
		connection.close();
	}


	public List<Order> getOrdersByUserId(String userId) throws Exception {
		List<Order> orders = new ArrayList<Order>();

		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrderByUserId"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Order order = new Order();
			order.setNo(rs.getInt("order_no"));
			order.setPrice(rs.getInt("order_price"));
			order.setAmount(rs.getInt("order_amount"));
			order.setRegisteredDate(rs.getDate("order_registered_date"));

			User user = new User();
			user.setName(rs.getString("user_name"));

			Book book = new Book();
			book.setTitle(rs.getString("book_title"));
			book.setPrice(rs.getInt("book_price"));

			order.setUser(user);
			order.setBook(book);

			orders.add(order);

		}

		rs.close();
		pstmt.close();
		connection.close();

		return orders;


	}
	public Order getOrderByNo(int orderNo) throws Exception{
		Order order = null;

		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrderByNo"));
		pstmt.setInt(1, orderNo);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			order = new Order();
			order.setNo(rs.getInt("order_no"));
			order.setPrice(rs.getInt("order_price"));
			order.setAmount(rs.getInt("order_amount"));
			order.setRegisteredDate(rs.getDate("order_registered_date"));

			User user = new User();
			user.setName(rs.getString("user_name"));

			Book book = new Book();
			book.setTitle(rs.getString("book_title"));
			book.setPrice(rs.getInt("book_price"));

			order.setUser(user);
			order.setBook(book);

		}
		rs.close();
		pstmt.close();
		connection.close();

		return order;
	}

}

