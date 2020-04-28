package com.sample.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.sample.bookstore.util.ConnectionUtil;
import com.sample.bookstore.util.QueryUtil;

public class LikeDao {

	public void addLikes (int bookNo, String userId) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("likes.addLikes"));
		pstmt.setInt(1, bookNo);
		pstmt.setString(2, userId);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}
