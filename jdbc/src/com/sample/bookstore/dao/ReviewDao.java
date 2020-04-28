package com.sample.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.sample.bookstore.util.ConnectionUtil;
import com.sample.bookstore.util.QueryUtil;
import com.sample.bookstore.vo.Book;
import com.sample.bookstore.vo.Review;

public class ReviewDao {
	
	public void addReview (Review review) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.addReview"));
		pstmt.setString(1, review.getContent());
		pstmt.setInt(2, review.getPoint());
		pstmt.setObject(3, review.getBook().getNo());
		pstmt.setObject(4, review.getUser().getUserId());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}

}
