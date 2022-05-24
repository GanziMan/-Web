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
<%! String SIGUN_NM=null,FACLT_NM=null,MANAGE_MAINBD_NM=null,GYM_POSBL_ETRS_CONT=null, ETC_FACLT_NM=null,GYM_AR=null, TRAINRM_RM_MATR=null;  %>

	<%
	
		
		JSONParser parser = new JSONParser();
		 Object obj = parser.parse(new FileReader("/Users/gimbeomsu/Desktop/lifesports.json"));
		JSONObject jo = (JSONObject) obj;
		JSONArray jArray= (JSONArray)jo.get("DATA");
		Statement stmt=null;
		
			for(int i=0; i<jArray.size(); i++)
			{
			JSONObject tmp=(JSONObject)jArray.get(i);
			
			SIGUN_NM=(String)tmp.get("SIGUN_NM");
			FACLT_NM=(String)tmp.get("FACLT_NM");
			MANAGE_MAINBD_NM=(String)tmp.get("MANAGE_MAINBD_NM");
			GYM_POSBL_ETRS_CONT =(String)tmp.get("GYM_POSBL_ETRS_CONT");
			ETC_FACLT_NM=(String)tmp.get("ETC_FACLT_NM");
			GYM_AR=(String)tmp.get("GYM_AR");
			TRAINRM_RM_MATR=(String)tmp.get("TRAINRM_RM_MATR");
			  try{
				  String sql="insert into swim(시군명,시설명,관리주체명,체육가능종목,기타시설명,체육관면적,헬스장비고) values('"+SIGUN_NM+"','"+FACLT_NM+"','"+MANAGE_MAINBD_NM+"','"+GYM_POSBL_ETRS_CONT+"','"+ETC_FACLT_NM+"','"+GYM_AR+"','"+TRAINRM_RM_MATR+"')";
				  	stmt=conn.createStatement();
				  	stmt.executeUpdate(sql);
			  }catch(SQLException ex){
				  out.println("lifesports 테이블 삽입이 실패했습니다 <br>");
					out.println("SQLException: "+ ex.getMessage());
			  }
			}
			
	%>
	
	
</body>
</html>