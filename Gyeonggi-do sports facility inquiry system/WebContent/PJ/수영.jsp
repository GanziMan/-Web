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
<%! String SIGUN_NM=null,FACLT_NM=null,INOUTDR_DIV_NM=null,MANAGE_MAINBD_NM=null,CONTCT_NO=null, HMPG_ADDR=null,REFINE_LOTNO_ADDR=null, REFINE_ROADNM_ADDR=null;  %>

	<%
	
		
		JSONParser parser = new JSONParser();
		 Object obj = parser.parse(new FileReader("/Users/gimbeomsu/Desktop/swim.json"));
		JSONObject jo = (JSONObject) obj;
		JSONArray jArray= (JSONArray)jo.get("DATA");
		Statement stmt=null;
		
			for(int i=0; i<jArray.size(); i++)
			{
			JSONObject tmp=(JSONObject)jArray.get(i);
			
			SIGUN_NM=(String)tmp.get("SIGUN_NM");
			FACLT_NM=(String)tmp.get("FACLT_NM");
			INOUTDR_DIV_NM=(String)tmp.get("INOUTDR_DIV_NM");
			MANAGE_MAINBD_NM=(String)tmp.get("MANAGE_MAINBD_NM");
			CONTCT_NO =(String)tmp.get("CONTCT_NO");
			HMPG_ADDR=(String)tmp.get("HMPG_ADDR");
			REFINE_LOTNO_ADDR=(String)tmp.get("REFINE_LOTNO_ADDR");
			REFINE_ROADNM_ADDR=(String)tmp.get("REFINE_ROADNM_ADDR");
			  try{
				  String sql="insert into swim(시군명,시설명,실내외구분명,관리주체명,연락처,홈페이지,지번주소,도로명주소) values('"+SIGUN_NM+"','"+FACLT_NM+"','"+INOUTDR_DIV_NM+"','"+MANAGE_MAINBD_NM+"','"+CONTCT_NO+"','"+HMPG_ADDR+"','"+REFINE_LOTNO_ADDR+"','"+REFINE_ROADNM_ADDR+"')";
				  	stmt=conn.createStatement();
				  	stmt.executeUpdate(sql);
			  }catch(SQLException ex){
				  out.println("swim 테이블 삽입이 실패했습니다 <br>");
					out.println("SQLException: "+ ex.getMessage());
			  }
			}
			
	%>
	
	
</body>
</html>