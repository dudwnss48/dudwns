package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.dto.ReviewDto;
import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;

public class ReviewDao {

	public List<ReviewDto> getReviewsByNo(int bookNo) throws SQLException {
		List<ReviewDto> reviewDto = new ArrayList<ReviewDto>(); 
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.getReviewsByNo"));
		pstmt.setInt(1, bookNo);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			ReviewDto reviewDto2 = new ReviewDto();
			reviewDto2.setNo(rs.getInt("review_no"));
			reviewDto2.setPoint(rs.getInt("review_point"));
			reviewDto2.setUserName(rs.getString("user_name"));
			reviewDto2.setContent(rs.getString("review_content"));
			reviewDto2.setRegisteredDate(rs.getDate("review_registered_date"));
			reviewDto.add(reviewDto2);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		return reviewDto;
	}
}
