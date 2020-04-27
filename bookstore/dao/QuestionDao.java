package com.sample.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sample.bookstore.util.ConnectionUtil;
import com.sample.bookstore.util.QueryUtil;
import com.sample.bookstore.vo.Book;
import com.sample.bookstore.vo.Question;

public class QuestionDao {

	void addQuestion(Question question) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("question.addQuestion"));
		pstmt.setString(1, question.getTitle());
		pstmt.setString(2, question.getUser().getId());
		pstmt.setString(3, question.getContent());
		pstmt.setString(4, question.getType());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
		
	}
	
	List<Question> getAllQuestions() {

		List<Question>questions = new ArrayList<Question>();

		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("question.getAllQuestion"));
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			questions.add(ResultSetTo);
		}		

		rs.close();
		pstmt.close();
		connection.close();


		return books;		
	}
	
	Question getQuestionByNo(int questionNo) {
		return null;
	}
	
	void removeQuestion(int questionNo) {
		
	}
	
	
	
	
}
