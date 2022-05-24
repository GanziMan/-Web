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
		
		String sql="SELECT * FROM lifesports";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		%>
	<form name="search" style="margin-right:70px;" method = "get"  action ="생활체육list.jsp" >
	<select name="kbs">
		<option value="시군명">시군명</option>
		<option value="시설명">시설명</option>
		<option value="관리주체명">관리주체명</option>
	</select>
	<input type="text" name="kbs1">
	<input type="submit" value="검색버튼">
	</form>
		<h1>경기도 공공생활체육시설</h1>
		<table border="1">
		<tr>
			<td>시군명</td>
			<td>시설명</td>
			<td>관리주체명</td>
			<td>체육가능종목</td>
			<td>기타시설명</td>
			<td>체육관면적</td>
			<td>헬스장비고</td>
		</tr>
		<%	
			while(rs.next()){
				%>
				<tr>
			<td><%=rs.getString("시군명") %></td>
			<td><%=rs.getString("시설명") %></td>
			<td><%=rs.getString("관리주체명") %></td>
			<td><%=rs.getString("체육가능종목") %></td>
			<td><%=rs.getString("기타시설명") %></td>
			<td><%=rs.getString("체육관면적") %></td>
			<td><%=rs.getString("헬스장비고") %></td>
		</tr>
		<% 		
			}
		%>
		</table>
</body>
</html>