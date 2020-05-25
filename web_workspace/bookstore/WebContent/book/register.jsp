<%@page import="com.bookstore.dao.BookDao"%>
<%@page import="com.bookstore.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	// 요청 파라미터 조회하기
		request.setCharacterEncoding("utf-8");
	
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String genre = request.getParameter("genre");
		String publisher = request.getParameter("publisher");
		int price = Integer.parseInt(request.getParameter("price"));
		int discountPrice = Integer.parseInt(request.getParameter("discountPrice"));
		int stock = Integer.parseInt(request.getParameter("stock"));
	// 객체 생성하기
		Book book = new Book();
		book.setTitle(title);
		book.setWriter(writer);
		book.setGenre(genre);
		book.setPublisher(publisher);
		book.setPrice(price);
		book.setDiscountPrice(discountPrice);
		book.setStock(stock);
		
	// dao만들고 실행하기
		BookDao bookDao = new BookDao();
		int isSuccess = bookDao.insertBook(book);
		
	// 반환하기
//		response.sendRedirect("list.jsp");
	%>
	<!doctype html>
<html lang="en">
<head>
   <meta charset="UTF-8" />
   <title>Document</title>
</head>
<body>
   <%
   if (isSuccess > 0) {
      out.println("<script>");
      out.println("alert('책이 등록되었습니다.')");
      out.println("location.href='list.jsp'");
      out.println("</script>");
         
   } else {
      out.println("<script>");
      out.println("alert('책 등록에 실패하였습니다.')");
      out.println("history.go(-1)");
      out.println("</script>");
      
   }
   
   
   %>
   
</body>
</html>