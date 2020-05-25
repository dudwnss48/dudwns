<%@page import="com.bookstore.dao.UserDao"%>
<%@page import="com.bookstore.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.dao.OrderDao"%>
<%@page import="com.bookstore.vo.Order"%>
<%@page import="com.bookstore.dto.OrderDto"%>
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
		String position = "order";
	%>
	<%@ include file="../common/navibar.jsp" %>
	</div>
	<div class="header">
		<h1>주문내역</h1>
	</div>
	<div class="body">
		<div>
			<%
				String userId = request.getParameter("userid");
				UserDao userDao = new UserDao();
				User user = userDao.getUserByUserId(userId);
				
			%>
			<h3>[<%=user.getName() %>]님의 주문내역입니다.</h3>
			<p>누적포인트 : <%=user.getPoint() %>점</p>
			<p>주문내역을 확인하세요.</p>					
			<table class="table">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>제목</th>
					<th>가격</th>
					<th>수량</th>
					<th>결제금액</th>
					<th>주문날짜</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
					OrderDao orderDao = new OrderDao();
					List<OrderDto> orders = orderDao.getOrdersByUserId(userId);
					if(orders.isEmpty()){
				%>	
						<tr>
							<td class="text-center" colspan="7">주문내역이 존재하지 않습니다.</td>
						</tr>
				<%
					} else {
						for(OrderDto orderDto : orders){
				%>
						<tr>
							<td><%=orderDto.getNo() %></td>
							<td><%=orderDto.getBookTitle() %></td>
							<td><%=orderDto.getPrice() %></td>
							<td><%=orderDto.getAmount() %></td>
							<td><%=orderDto.getPrice() * orderDto.getAmount()%></td>
							<td><%=orderDto.getRegisteredDate() %></td>
							<td><a href="../review/form.jsp?userid=<%=userId %>&bookno=<%=orderDto.getBookNo() %>">리뷰작성</a></td>
						</tr>
				<%	
						}
					}
				%>
			</tbody>
			</table>
			<div>
				<div class="text-right"><a href="../user/list.jsp">사용자 목록</a>	
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>