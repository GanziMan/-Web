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
<%! String SIGUN_NM=null,FACLT_NM=null,MANAGE_MAINBD_NM=null,INFLD_BOTM_MATRL_NM=null,OUTFLD_BOTM_MATRL_NM=null,AR=null,REFINE_LOTNO_ADDR=null ;  %>

	<%
		JSONParser parser = new JSONParser();
		 Object obj = parser.parse(new FileReader("/Users/gimbeomsu/Desktop/baseball.json"));
		JSONObject jo = (JSONObject) obj;
		JSONArray jArray= (JSONArray)jo.get("DATA");
		Statement stmt=null;
		
			for(int i=0; i<jArray.size(); i++)
			{
			JSONObject tmp=(JSONObject)jArray.get(i);
			
			SIGUN_NM=(String)tmp.get("SIGUN_NM");
			FACLT_NM=(String)tmp.get("FACLT_NM");
			MANAGE_MAINBD_NM=(String)tmp.get("MANAGE_MAINBD_NM");
			INFLD_BOTM_MATRL_NM=(String)tmp.get("INFLD_BOTM_MATRL_NM");
			OUTFLD_BOTM_MATRL_NM=(String)tmp.get("OUTFLD_BOTM_MATRL_NM");
			AR =(String)tmp.get("AR");
			REFINE_LOTNO_ADDR=(String)tmp.get("REFINE_LOTNO_ADDR");
		
			
			
			  try{
				  String sql="insert into baseball(시군명,시설명,관리주체명,내야바닥,외야바닥,면적,주소) values('"+SIGUN_NM+"','"+FACLT_NM+"', '"+MANAGE_MAINBD_NM+"','"+INFLD_BOTM_MATRL_NM+"','"+OUTFLD_BOTM_MATRL_NM+"','"+AR+"','"+REFINE_LOTNO_ADDR+"')";
				  	stmt=conn.createStatement();
				  	stmt.executeUpdate(sql);
			  }catch(SQLException ex){
				  out.println("baseball 테이블 삽입이 실패했습니다 <br>");
				  
					out.println("SQLException: "+ ex.getMessage());
			  }
			}
			
	%>
	
	
</body>
</html>