<%@page import="com.bookstore.dao.OrderDao"%>
<%@page import="com.bookstore.vo.Order"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.dto.BookDetailDto"%>
<%@page import="com.bookstore.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookstore</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css">
</head>
<body>
<div class="wrapper">
	<div class="navi">
	<%
		// 책번호, 구매가격, 구매수량, 사용자 아이디 조회하기
		
		// Order객체를 생성해서 위에서 획득한 정보 저장하기
		
		// OrderDao의 insertOrder(Order order) 실행하기
		
		// 주문완료페이지를 재요청하는 응답을 클라이언트로 보내기
		String position = "order";
	%>
	<%@ include file="../common/navibar.jsp" %>
	</div>
	<div class="header">
		<h1>주문 하기</h1>
	</div>
	<div class="body">
		<p>주문정보를 확인하세요.</p>
		<form action="">
			<div>
				<table class="table bordered">
					<tbody>
					<%
						int bookno = Integer.parseInt(request.getParameter("bookno"));
						int price = Integer.parseInt(request.getParameter("price"));
						int amount = Integer.parseInt(request.getParameter("amount"));
						String userId = request.getParameter("userid");
						
						Order order = new Order();
						order.setUserId(userId);
						order.setBookNo(bookno);
						order.setPrice(price);
						order.setAmount(amount);

						OrderDao orderDao = new OrderDao();
						orderDao.insertOrder(order);
						
						response.sendRedirect("completed.jsp");
						
						BookDao bookDao = new BookDao();
						BookDetailDto dao1 = bookDao.getBookByNo(bookno);
						
						if (dao1.getNo() == bookno){
					%>
						<tr>
							<th>제목</th>
							<td colspan="3"><%= dao1.getTitle() %></td>
						</tr>
						<tr>
							<th>저자</th>
							<td><%= dao1.getWriter() %></td>
							<th>출판사</th>
							<td><%= dao1.getPublisher() %></td>
						</tr>
						<tr>
							<th>평점</th>
							<td><%= dao1.getPoint() %>점</td>
							<th>리뷰수</th>
							<td><%= dao1.getReviewCnt() %>개</td>
						</tr>
						<tr>
							<th>가격</th>
							<td><%= NumberUtil.numberWithComma(dao1.getPrice()) %>원</td>
							<th>할인가격</th>
							<td><%= NumberUtil.numberWithComma(dao1.getDiscountPrice()) %>원</td>
						</tr>
						<tr>
							<th>추천수</th>
							<td><%= NumberUtil.numberWithComma(dao1.getLikes()) %>개</td>
							<th>재고</th>
							<td><%= NumberUtil.numberWithComma(dao1.getStock()) %>권</td>
						</tr>					
					<%
						}
					%>	
					</tbody>
				</table>
			</div>
			<div class="well">
				<form method="post" action="order.jsp">
					<input type="hidden" name="price" value="<%=dao1.getDiscountPrice() %>">
					<input type="hidden" name="amount" value="<%=amount %>">
					<input type="hidden" name="bookno" value="<%=bookno %>">
					<div class="form-group">
						<label>구매자</label>
						<div><input type="text" name="userid"></div>
					</div>
					<div class="form-group">
						<label>구매가격</label>
						<div><input type="text" name="price" value="<%=NumberUtil.numberWithComma(dao1.getDiscountPrice()) %>원" disabled></div>
					</div>
					<div class="form-group">
						<label>구매수량</label>
						<div><input type="text" name="amount" value="<%=amount %>권"></div>
					</div>
					<div class="text-right">
						<button type="submit">주문하기</button>
					</div>
				</form>
			</div>
		</form>
	</div>
	<%@ include file="../common/footer.jsp" %>
</div>