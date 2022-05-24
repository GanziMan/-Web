<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.PreparedStatement" %>

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
		color:yellow;
	}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*" %>
		<%		
		String url="jdbc:mysql://localhost:3307/jspPj";
		String id="root";
		String pw="0955";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection(url,id,pw);
		
		String sql="SELECT * FROM golf";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		%>
		<h1>경기도 공공골프체육시설</h1>
		<table border="1">
		
		<tr>
			<td>시군명</td>
			<td>기관명</td>
			<td>관리주체명</td>
			<td>주연습장면적</td>
			<td>주연습장폭</td>
			<td>주연습장타석수</td>
			<td>주연습장길이</td>
			<td>피칭연습코스면적</td>
			<td>피칭연습코스홀수</td>
		</tr>
		<%
		try{
			request.setCharacterEncoding("UTF-8");
			String kbs=request.getParameter("kbs");
			String kbs1=request.getParameter("kbs1");
			System.out.println(kbs);
			System.out.println(kbs1);
			if(kbs==null & kbs1==null){
				pstmt=conn.prepareStatement("select * from golf");
			}else if(kbs != null & kbs.equals("")){
				pstmt=conn.prepareStatement("select * from golf");
			}else if(kbs !=null & kbs1 != null){
				pstmt=conn.prepareStatement("select * from golf where "+kbs+"=?");
				pstmt.setString(1,kbs1);
			}
			rs=pstmt.executeQuery();
			while(rs.next()){
				%>
				<tr>
			<td><%=rs.getString("시군명") %></td>
			<td><%=rs.getString("기관명") %></td>
			<td><%=rs.getString("관리주체명") %></td>
			<td><%=rs.getString("주연습장면적") %></td>
			<td><%=rs.getString("주연습장폭") %></td>
			<td><%=rs.getString("주연습장타석수") %></td>
			<td><%=rs.getString("주연습장길이") %></td>
			<td><%=rs.getString("피칭연습코스면적") %></td>
			<td><%=rs.getString("피칭연습코스홀수") %></td>
		</tr>
		<% 		
			}
		}catch(SQLException ex){
			out.println(ex.getMessage());
			ex.printStackTrace();
		}finally{
			if(pstmt !=null) try{pstmt.close();} catch(SQLException ex){}
		}
		%>
		</table>
</body>
</html>