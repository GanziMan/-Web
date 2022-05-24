<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%@ page import="java.sql.*" %>
<html>
<head>
<style>
	h1{
		text-align:center;
		color:black;
		background-color:#d2d2d2;
	}
	input{
	border:1px solid black;
	}
	select{
	width:200px;
	border: 1px solid black;
	appearance: none;
	font-family: inherit; 
	}
	*{
		margin:0;
		padding:0;
	}
	table{
		width: 100%;
		border:1px solid blue;
		border-collapse: collapse;
		background-color:#333;
	}
	td{
		padding:10px;
		color:white;
	}
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%		
		String url="jdbc:mysql://localhost:3307/jspPj";
		String id="root";
		String pw="0955";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection(url,id,pw);
		
		String sql="SELECT * FROM baseball";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		%>
	<form name="search" style="margin-right:70px;" method = "get"  action ="야구list.jsp" >
	<select name="kbs">
		<option value="시군명">시군명</option>
		<option value="시설명">시설명</option>
		<option value="관리주체명">관리주체명</option>
		<option value="내야바닥">내야바닥</option>
		<option value="외야바닥">외야바닥</option>
	</select>
	<input type="text" name="kbs1">
	<input type="submit" value="검색버튼">
	</form>
		
		<h1>경기도 공공야구장</h1>
		<table border="1">
	<tr>
				<td>시군명</td>
			<td>시설명</td>
			<td>관리주체명</td>
			<td>내야바닥</td>
			<td>외야바닥</td>
			<td>면적</td>
			<td>주소</td>	
		</tr>
		
		<%	
			while(rs.next()){
				%>
		<tr>
			<td><%=rs.getString("시군명") %></td>
			<td><%=rs.getString("시설명") %></td>
			<td><%=rs.getString("관리주체명") %></td>
				<td><%=rs.getString("내야바닥") %></td>
			<td><%=rs.getString("외야바닥") %></td>
			<td><%=rs.getString("면적") %></td>
			<td><%=rs.getString("주소") %></td>
		</tr>
		<% 		
			
			}
		%>
		</table>
</body>
</html>