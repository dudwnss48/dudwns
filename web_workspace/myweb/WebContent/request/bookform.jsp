<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>책정보 등록 폼</h1>
	
	<h3>신규 책정보를 입력하세요</h3>
	<form action="bookregister.jsp" method="post">
		<!-- 
			제목, 저자, 장르, 출판사, 가격, 할인가격, 입고수량을 입력받는 폼을 만드시오.
		 -->
		<div>
			<label>제목</label>
			<div><input type="text" name="title" /></div>
		</div>	
		<div>
			<label>저자</label>
			<div><input type="text"  name="writer" /></div>
		</div>	
		<div>
			<label>장르</label>
			<div>
			<select name="genre">
				<option value="자서전"> 자서전</option>
				<option value="전기"> 전기</option>
				<option value="우화"> 우화</option>
				<option value="모험 소설"> 모험 소설</option>
				<option value="아동문학"> 아동문학</option>
				<option value="판타지"> 판타지</option>
				<option value="추리 소설"> 추리 소설</option>
				<option value="로맨스 소설/연애 소설"> 로맨스 소설/연애 소설</option>
				<option value="과학소설 (SF)"> 과학소설 (SF)</option>
			</select>
			</div>
		</div>
		<div>
			<label>출판사</label>
			<div><input type="text" name="publisher" /></div>
		</div>	
		<div>
			<label>가격</label>
			<div><input type="number" name="price" />원</div>
		</div>
		<div>
			<div>
			<label>할인가격</label>
			<div><input type="number" name="discountprice" />원</div>
			</div>
		</div>
		<div>
			<label>입고수량</label>
			<div>
				<input type="number" name="stock">권
			</div>
		</div>
		<div>
			<button type="submit">저장</button>
		</div>
	</form>
</body>
</html>