<%@page import="com.sample.vo.Book"%>
<%@page import="com.sample.dao.BookDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<h1>모든회원 정보조회</h1>
	
	<%
		BookDao dao = new BookDao();
		List<Book> books = dao.getAllBooks();
		
	%>
	<table border="1" style="width: 100%;">
		<thead>
			<tr>
				<th>책번호</th>
				<th>책제목</th>
				<th>작가</th>
				<th>장르</th>
				<th>출판사</th>
				<th>가격</th>
				<th>할인가격</th>
				<th>등록일</th>
				<th>재고</th>
				<th>포인트</th>
				<th>좋아요</th>
			</tr>
		</thead>
		<tbody>
		
		<%
			for (Book book : books){				
		%>
			<tr>
				<td><%=book.getNo() %></td>
				<td><%=book.getTitle() %></td>
				<td><%=book.getWriter() %></td>
				<td><%=book.getGenre() %></td>
				<td><%=book.getPublisher() %></td>
				<td><%=book.getPrice() %></td>
				<td><%=book.getDiscountPrice() %></td>
				<td><%=book.getRegisteredDate() %></td>
				<td><%=book.getStock() %></td>
				<td><%=book.getPoint() %></td>
				<td><%=book.getLikes() %></td>
			</tr>
		<%
			}
		%>	
		</tbody>
	</table>
</body>
</html>