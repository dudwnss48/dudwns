<%@page import="com.sample.dao.UserDao"%>
<%@page import="com.sample.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>유저정보 등록</h1>
	
	<%
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		User user = new User();
		user.setId(id);
		user.setPassword(password);
		user.setName(name);
		user.setEmail(email);
		
		UserDao userDao = new UserDao();
		userDao.insertUser(user);
	%>
	
	<h3>회원가입 완료</h3>
	
	<p>회원가입을 환영합니다.</p>

</body>
</html>