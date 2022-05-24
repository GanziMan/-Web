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
<%! String SIGUN_NM=null,FACLT_NM=null,MANAGE_MAINBD_NM=null,MAIN_PRACTRNG_AR=null,MAIN_PRACTRNG_BT=null,MAIN_PRACTRNG_BATBOX_CNT=null,MAIN_PRACTRNG_LENG=null,PITCHG_PRCT_COURSE_AR=null,  PITCHG_PRCT_COURSE_HOLE_CNT=null ;  %>

	<%
		JSONParser parser = new JSONParser();
		 Object obj = parser.parse(new FileReader("/Users/gimbeomsu/Desktop/golf.json"));
		JSONObject jo = (JSONObject) obj;
		JSONArray jArray= (JSONArray)jo.get("DATA");
		Statement stmt=null;
		
			for(int i=0; i<jArray.size(); i++)
			{
			JSONObject tmp=(JSONObject)jArray.get(i);
			
			SIGUN_NM=(String)tmp.get("SIGUN_NM");
			FACLT_NM=(String)tmp.get("FACLT_NM");
			MANAGE_MAINBD_NM=(String)tmp.get("MANAGE_MAINBD_NM");
			MAIN_PRACTRNG_AR=(String)tmp.get("MAIN_PRACTRNG_AR");
			MAIN_PRACTRNG_BT =(String)tmp.get("MAIN_PRACTRNG_BT");
			MAIN_PRACTRNG_BATBOX_CNT=(String)tmp.get("MAIN_PRACTRNG_BATBOX_CNT");
			MAIN_PRACTRNG_LENG=(String)tmp.get("MAIN_PRACTRNG_LENG");
			PITCHG_PRCT_COURSE_AR=(String)tmp.get("PITCHG_PRCT_COURSE_AR");
			PITCHG_PRCT_COURSE_HOLE_CNT=(String)tmp.get("PITCHG_PRCT_COURSE_HOLE_CNT");
			  try{
				  String sql="insert into soccer(시군명,기관명,관리주체명,주연습장면적,주연습장폭,주연습장타석수,주연습장길이,피칭연습코스면적,피칭연습코스홀수) values('"+SIGUN_NM+"','"+FACLT_NM+"', '"+MANAGE_MAINBD_NM+"','"+MAIN_PRACTRNG_AR+"','"+MAIN_PRACTRNG_BT+"','"+MAIN_PRACTRNG_BATBOX_CNT+"','"+MAIN_PRACTRNG_LENG+",'"+PITCHG_PRCT_COURSE_AR+"','"+PITCHG_PRCT_COURSE_HOLE_CNT+"')";
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