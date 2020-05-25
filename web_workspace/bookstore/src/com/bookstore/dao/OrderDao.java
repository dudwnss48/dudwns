package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.dto.OrderDto;
import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;
import com.bookstore.vo.Order;

public class OrderDao {

	public void insertOrder(Order order) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.insertOrder"));
		pstmt.setString(1, order.getUserId());
		pstmt.setInt(2, order.getBookNo());
		pstmt.setInt(3, order.getPrice());
		pstmt.setInt(4, order.getAmount());
		pstmt.setInt(5, order.getNo());
		
		pstmt.executeUpdate();
		pstmt.close();
		connection.close();
		
	}
	
	public List<OrderDto> getOrdersByUserId (String userId) throws Exception {
		List<OrderDto> orders = new ArrayList<OrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrdersByUserId"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			OrderDto orderDto = new OrderDto();
			orderDto.setNo(rs.getInt("order_no"));
			orderDto.setBookNo(rs.getInt("book_no"));
			orderDto.setBookTitle(rs.getString("book_title"));
			orderDto.setAmount(rs.getInt("order_amount"));
			orderDto.setPrice(rs.getInt("order_price"));
			orderDto.setId(rs.getString("user_id"));
			orderDto.setRegisteredDate(rs.getDate("ORDER_REGISTERED_DATE"));
			
			orders.add(orderDto);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		return orders;
	}
}
