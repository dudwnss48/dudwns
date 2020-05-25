package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;
import com.bookstore.vo.User;

public class UserDao {
	
	public List<User> getAllUsers() throws Exception {
		List<User> users = new ArrayList<User>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getAllUsers"));
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			User user = new User();
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("user_name"));
			user.setEmail(rs.getString("user_email"));
			user.setPoint(rs.getInt("user_point"));
			user.setRegisteredDate(rs.getDate("user_registered_date"));
			users.add(user);
		}
		rs.close();
		pstmt.close();
		connection.close();
		return users;
	}
	
	public List<User> getNewUsers() throws SQLException {
		List<User> users = new ArrayList<User>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getNewUsers"));
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			User user = new User();
			user.setName(rs.getString("user_name"));
			user.setId(rs.getString("user_id"));
			user.setEmail(rs.getString("user_email"));
			user.setRegisteredDate(rs.getDate("user_registered_date"));
			
			users.add(user);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return users;
	}
	
	
	
	
	
	public void insertUser(User user) throws SQLException{
		String sql = "insert into sample_book_users "
				+ "(user_id, user_password, user_name, user_email) "
				+ "values "
				+ "(?, ?, ?, ?)";
				
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getPassword());
		pstmt.setString(3, user.getName());
		pstmt.setString(4, user.getEmail());
		
		pstmt.executeUpdate();
		pstmt.close();
		connection.close();
		
	}
	
	public User getUserByUserId(String userId) throws Exception{
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(QueryUtil.getSQL("user.getUserByUserId"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		User user = null;
		if(rs.next()) {
			user = new User();
			user.setId(rs.getString("user_id"));
			user.setPassword(rs.getString("user_password"));
			user.setName(rs.getString("user_name"));
			user.setEmail(rs.getString("user_email"));
			user.setPoint(rs.getInt("user_point"));
			user.setRegisteredDate(rs.getDate("user_registered_date"));
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		return user;
	}
	
	
//	public void updateUser(User user) throws Exception{
//		
//		Connection connection = ConnectionUtil.getConnection();
//		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.updateUser"));
//		pstmt.setString(1, user.getPassword());
//		pstmt.setString(2, user.getEmail());
//		pstmt.setString(3, user.getUserId());
//		pstmt.executeUpdate();
//		
//		pstmt.close();
//		connection.close();
//		
//	}
	
	
}
