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
<%! String SIGUN_NM=null,FACLT_NM=null,BOTM_MATRL_NM=null,ACEPTNC_PSNCNT=null,MANAGE_MAINBD_NM=null,AR=null,  ACEPTNC_PSNCN=null ;  %>

	<%
		JSONParser parser = new JSONParser();
		 Object obj = parser.parse(new FileReader("/Users/gimbeomsu/Desktop/soccer.json"));
		JSONObject jo = (JSONObject) obj;
		JSONArray jArray= (JSONArray)jo.get("DATA");
		Statement stmt=null;
		
			for(int i=0; i<jArray.size(); i++)
			{
			JSONObject tmp=(JSONObject)jArray.get(i);
			
			SIGUN_NM=(String)tmp.get("SIGUN_NM");
			FACLT_NM=(String)tmp.get("FACLT_NM");
			BOTM_MATRL_NM=(String)tmp.get("BOTM_MATRL_NM");
			AR=(String)tmp.get("AR");
			MANAGE_MAINBD_NM =(String)tmp.get("MANAGE_MAINBD_NM");
			ACEPTNC_PSNCNT=(String)tmp.get("ACEPTNC_PSNCNT");
			
			  try{
				  String sql="insert into soccer(시군명,시설명,바닥재료명,면적,시설관리명,수용인원수) values('"+SIGUN_NM+"','"+FACLT_NM+"', '"+BOTM_MATRL_NM+"','"+AR+"','"+MANAGE_MAINBD_NM+"','"+ACEPTNC_PSNCNT+"')";
				  	stmt=conn.createStatement();
				  	stmt.executeUpdate(sql);
			  }catch(SQLException ex){
				  out.println("soccer 테이블 삽입이 실패했습니다 <br>");
				  
					out.println("SQLException: "+ ex.getMessage());
			  }
			}
			
	%>
	
	
</body>
</html>