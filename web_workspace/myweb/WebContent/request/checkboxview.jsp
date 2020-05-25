<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>체크박스가 포함된 요청파라미터값 조회하기</h1>
	
	<%
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String job = request.getParameter("job");
		String[] skills = request.getParameterValues("skill");
	%>
	
	<h3>조회된 요청 파라미터값 테이블</h3>
	<table border="1">
	<thead>
		<tr>
			<th>이름</th>
			<th>경력</th>
			<th colspan="<%=skills.length %>">스킬</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><%= name %></td>
			<td><%= job %></td>
	<%
			
		if(skills != null){
			for(String skill : skills){
	%>
	  <td><%= skill%> </td>
	<%
 			}
 		}
 	%>
		</tr>
	</tbody>
	</table>
	
	<h3>조회된 요청 파라미터값 테이블</h3>
	<p>이름 :  <%= name %></p>
	<p>경력 :  <%= job %></p>
	<p>스킬 :
	<%
		String a = ",";
		if(skills != null){
			for(String skill : skills){
	%>
	  <%= skill +a%> 
	<%
			}
		}
	%>
	</p>
</body>
</html>