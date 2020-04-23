package com.sample.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.sample.bookstore.util.ConnectionUtil;
import com.smaple.bookstore.vo.Order;

public class OrderDAO {
	public void addOrder(Order order) throws SQLException {
		String sql = "insert INTO sample_book_orders " + 
				"(ORDER_NO\r\n" + 
				"USER_ID\r\n" + 
				"BOOK_NO\r\n" + 
				"ORDER_PRICE\r\n" + 
				"ORDER_AMOUNT\r\n" + 
				"ORDER_REGISTERED_DATE) " + 
				"values " + 
				"(sample_book_seq.nextval, ?, ?, ?, sysdate)";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement prtmt  = connection.prepareStatement(sql);
		
		prtmt.setInt(1, order.getUser_id());
		
		prtmt.executeUpdate(sql);
		
		
	}
	public List<Order> getOrdersByUserId(String userId) {
		return null;
		
	}
	public Order getOrderByNo(int orderNo) {
		return null;
		
	}
}
