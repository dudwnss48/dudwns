package com.sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sample.util.ConnectionUtil;
import com.sample.vo.User;

public class UserDao {
	
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
	
//	public User getAllUser(User user) throws Exception {
//		String sql = "select * form sample_book_users";
//		
//		Connection connection = ConnectionUtil.getConnection();
//		PreparedStatement pstmt = connection.prepareStatement(sql);
//		ResultSet resultSet = pstmt.executeQuery();
//		
//		User user1 = null;
//		while (resultSet.next()) {
//			user = new User();
//			user.setId(resultSet.getString("id"));
//			user.setPassword(resultSet.getString("password"));
//			user.setName(resultSet.getString("name"));
//			user.setEmail(resultSet.getString("email"));
//			user.setPoint(resultSet.getInt("point"));
//			user.setRegisteredDate(resultSet.getDate("registeredDate"));
//		}
//		
//		resultSet.close();
//		pstmt.close();
//		connection.close();
//		return user1;		
//	}
//	
	public List<User>getAllUsers() throws Exception {
		String sql = "select * from sample_book_users ";
		
		List<User> list = new ArrayList<User>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet resultSet = pstmt.executeQuery();
		
		while (resultSet.next()) {
			User user = new User();
			user.setId(resultSet.getString("user_id"));
			user.setPassword(resultSet.getString("user_password"));
			user.setName(resultSet.getString("user_name"));
			user.setEmail(resultSet.getString("user_email"));
			user.setPoint(resultSet.getInt("user_point"));
			user.setRegisteredDate(resultSet.getDate("user_registered_Date"));
			list.add(user);
		}
		
		resultSet.close();
		pstmt.close();
		connection.close();
		return list;
	}
//	public User getUserById(String userId) throws Exception{
//		
//		Connection conn = ConnectionUtil.getConnection();
//		PreparedStatement pstmt = conn.prepareStatement(QueryUtil.getSQL("user.getUserById"));
//		pstmt.setString(1, userId);
//		ResultSet rs = pstmt.executeQuery();
//		
//		User user = null;
//		while(rs.next()) {
//			user = new User();
//			user.setUserId(rs.getString("user_id"));
//			user.setPassword(rs.getString("user_password"));
//			user.setUserName(rs.getString("user_name"));
//			user.setEmail(rs.getString("user_email"));
//			user.setPoint(rs.getInt("user_point"));
//			user.setUserRegisteredDate(rs.getDate("user_registered_date"));
//		
//		}
//		rs.close();
//		pstmt.close();
//		conn.close();
//		return user;
//	}
	
	
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
