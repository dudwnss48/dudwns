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
		String position = "user";
	%>
	<%@ include file= "../common/navibar.jsp %>		
	</div>
	<div class="header">
		<h1>결제하기</h1>
	</div>
	<%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>