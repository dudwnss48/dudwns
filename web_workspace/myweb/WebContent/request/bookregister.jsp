<%@page import="com.sample.dao.BookDao"%>
<%@page import="com.sample.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>요청 파라미터 조회하기</h1>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String genre = request.getParameter("genre");
		String publisher = request.getParameter("publisher");
		int price = Integer.parseInt(request.getParameter("price"));
		int discountprice = Integer.parseInt(request.getParameter("discountprice"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		
		Book book = new Book();
		book.setTitle(title);
		book.setWriter(writer);
		book.setPublisher(publisher);
		book.setGenre(genre);
		book.setPrice(price);
		book.setDiscountPrice(discountprice);
		book.setStock(stock);
		
		BookDao bookDao = new BookDao();
		bookDao.insertBook(book);
		
	%>
	
	<h3>책 등록 완료</h3>
	
	<p>새로운 책이 등록되었습니다.</p>
	
</body>
</html>