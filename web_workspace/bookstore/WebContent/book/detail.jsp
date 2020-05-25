<%@page import="java.util.List"%>
<%@page import="com.bookstore.dao.ReviewDao"%>
<%@page import="com.bookstore.dto.ReviewDto"%>
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
<link rel="stylesheet" type="text/css"href="../css/bookstore.css">
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%
				String position = "book";
			%>
			<%@ include file="../common/navibar.jsp" %>
		</div>
		<div class="header">
			<h1>책 정보</h1>
		</div>
		<div class="body">
		<%
			int bookno = Integer.parseInt(request.getParameter("bookno"));
		%>
			<div>
				<table class="table bordered">
				<h3>책의 상세정보</h3>
				<%
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
				</table>
				
				<div class="text-right">
						<button type="submit">결제하기</button>
				</div>
				<div class="text-right">
					<a href="list.jsp">목록으로 가기</a>			
				</div>
			</div>
			<div>
				<h3>이 책의 리뷰</h3>
				<table class="table">
				<%
					ReviewDao reviewDao = new ReviewDao();
					List<ReviewDto> dto2 = reviewDao.getReviewsByNo(bookno);
					
					if (dto2.isEmpty()){
				
				%>
					<tr>
						<td>등록된 리뷰가 존재하지 않습니다.</td>
					</tr>
				<%
					} else {
						for (ReviewDto reviewDto : dto2){
				%>
					<tbody>
						<tr>
							<th>작성자</th>
							<td><%=reviewDto.getUserName() %></td>
							<th>평점</th>
							<td><%=reviewDto.getPoint() %></td>
							<th>작성일</th>
							<td><%=reviewDto.getRegisteredDate() %></td>
						</tr>
						<tr>
							<th>리뷰내용</th>
							<td colspan="6"><%=reviewDto.getContent() %></td>
						</tr>
					</tbody>
					<%
						}
					}
					%>
				</table>
				<hr/>
			</div>
		</div>
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>