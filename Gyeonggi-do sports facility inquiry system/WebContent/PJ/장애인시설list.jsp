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
		
		String sql="SELECT * FROM disabled";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		%>
		<h1>경기도 장애인스포츠시설</h1>
		<table border="1">
		<tr>
			<td>시군명</td>
			<td>기관명</td>
			<td>지번주소</td>
			<td>도로명주소</td>
			<td>전화번호</td>
			<td>장애인체육시설홈페이지</td>
		</tr>
		<%
		try{
			request.setCharacterEncoding("UTF-8");
			String kbs=request.getParameter("kbs");
			String kbs1=request.getParameter("kbs1");
			System.out.println(kbs);
			System.out.println(kbs1);
			if(kbs==null & kbs1==null){
				pstmt=conn.prepareStatement("select * from disabled");
			}else if(kbs != null & kbs.equals("")){
				pstmt=conn.prepareStatement("select * from disabled");
			}else if(kbs !=null & kbs1 != null){
				pstmt=conn.prepareStatement("select * from disabled where "+kbs+"=?");
				pstmt.setString(1,kbs1);
			}
			rs=pstmt.executeQuery();
			while(rs.next()){
				%>
		<tr>
			<td><%=rs.getString("시군명") %></td>
			<td><%=rs.getString("기관명") %></td>
			<td><%=rs.getString("지번주소") %></td>
			<td><%=rs.getString("도로명주소") %></td>
			<td><%=rs.getString("전화번호") %></td>
			<td><%=rs.getString("장애인체육시설홈페이지") %></td>
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