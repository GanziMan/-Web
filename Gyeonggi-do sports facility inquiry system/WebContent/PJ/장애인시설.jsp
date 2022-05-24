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
<%! String SIGUN_NM=null,INST_NM=null,REFINE_LOTNO_ADDR=null,REFINE_ROADNM_ADDR=null,TELNO=null, HMPG_URL=null ;  %>

	<%
	
		
		JSONParser parser = new JSONParser();
		 Object obj = parser.parse(new FileReader("/Users/gimbeomsu/Desktop/disabled.json"));
		JSONObject jo = (JSONObject) obj;
		JSONArray jArray= (JSONArray)jo.get("DATA");
		Statement stmt=null;
		
			for(int i=0; i<jArray.size(); i++)
			{
			JSONObject tmp=(JSONObject)jArray.get(i);
			
			SIGUN_NM=(String)tmp.get("SIGUN_NM");
			INST_NM=(String)tmp.get("INST_NM");
			REFINE_LOTNO_ADDR=(String)tmp.get("REFINE_LOTNO_ADDR");
			REFINE_ROADNM_ADDR=(String)tmp.get("REFINE_ROADNM_ADDR");
			TELNO =(String)tmp.get("TELNO");
			HMPG_URL=(String)tmp.get("HMPG_URL");
			
			  try{
				  String sql="insert into disabled(시군명,기관명,지번주소,도로명주소,전화번호,장애인체육시설홈페이지) values('"+SIGUN_NM+"','"+INST_NM+"', '"+REFINE_LOTNO_ADDR+"','"+REFINE_ROADNM_ADDR+"','"+TELNO+"','"+HMPG_URL+"')";
				  	stmt=conn.createStatement();
				  	stmt.executeUpdate(sql);
			  }catch(SQLException ex){
				  out.println("disabled 테이블 삽입이 실패했습니다 <br>");
					out.println("SQLException: "+ ex.getMessage());
			  }
			}
			
	%>
	
	
</body>
</html>