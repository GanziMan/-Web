<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Iterator" %>
<%@ include file="DB연결.jsp" %>
<%@ page import="java.sql.*"  %>

	<%
			Statement stmt=null;
			String result=null;
			String grade=request.getParameter("grade");
			int age=Integer.parseInt(request.getParameter("age"));
			int mmse=Integer.parseInt(request.getParameter("score"));
		
				if(age>=45 && age<65)
				{
					
					if(mmse>18.47){
						result="유";
						}
						else 
							result="무";
					
				}	
			String sex=request.getParameter("sex");
			if(sex.equalsIgnoreCase("man")){
				sex="남자";
			}else{
				sex="여자";
			}
			
			
			  try{
				  String sql="insert into mmse(나이,성별,점수,기억력유무) values('"+age+"','"+sex+"','"+mmse	+"','"+result+"')";
				  	stmt=conn.createStatement();
				  	stmt.executeUpdate(sql);
			  }catch(SQLException ex){
				  out.println("mmse 테이블 삽입이 실패했습니다 <br>");
				  
					out.println("SQLException: "+ ex.getMessage());
			  }
			
			
		
	%>
	
	
</body>
</html>