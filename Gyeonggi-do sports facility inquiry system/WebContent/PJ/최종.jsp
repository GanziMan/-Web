<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	*{
	margin:0;
	padding:0;
	}
	ul{
		list-style-type:none;
		margin:0;
		padding:0;
		background-color: #333;
	}
	ul:after{
		content:'';
		display:block;
		clear:both;
	}
	
	h1{
		margin:0;
		text-align:center;
		background-color:#d2d2d2
		}
	li{
		float:left;	
		}
	li a{
		display:block;
		text-align:center;
		text-decoration:none;
		padding:14px 16px;
		color:white;
	}
	li a:hover:not(.active){
		background-color:#111;
	}
	.active{
			background-color:#5ACCFF;
		}
	.active1{
			background-color:#5ACCFF;
			}
	img{
	width:50%;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>경기도 공공 체육시설</h1>
	 <ul>
	 <li><a class="active">home</a></li>
	 <li><a  href="축구검색창.jsp">축구 체육시설</a></li>
	 <li><a  href="테니스검색창.jsp">테니스 체육시설</a></li>
	 <li><a  href="장애인시설검색창.jsp">장애인 체육시설</a></li>
	  <li><a  href="골프검색창.jsp">골프 체육시설</a></li>
	  <li><a href="생활체육검색창.jsp">생활체육 체육시설</a></li>
	  <li><a href="수영장검색창.jsp">수영 체육시설</a></li>
	  <li><a href="야구검색창.jsp">야구장 시설</a></li>
	  <li><a href="육상검색창.jsp">육상 경기장 시설</a></li>
	   <li><a href="도움말.jsp" class="active1">도움말</a></li>
	 </ul>


	<a href="생활체육검색창.jsp"><img src="https://cdn.pixabay.com/photo/2015/04/20/13/44/sports-731506_1280.jpg" style="float:left;"></a>


	<a href="수영장검색창.jsp"><img src="https://cdn.pixabay.com/photo/2013/02/09/04/33/scuba-diving-79606_1280.jpg" style="float:right;"></a>


	<a href="축구검색창.jsp"><img src="https://media.istockphoto.com/photos/silhouette-action-sport-outdoors-of-a-group-of-kids-having-fun-for-picture-id1164736873?k=6&m=1164736873&s=612x612&w=0&h=FfAm3XzLGgjBwXxdx2JWsaIZWh0OrYLomkp34W9FXm0=" style="float:right;"></a>


	<a href="골프검색창.jsp"><img src="https://media.istockphoto.com/photos/backlit-golf-course-with-golfer-chipping-onto-green-picture-id481358874?k=6&m=481358874&s=612x612&w=0&h=EVdME9JVGyye8gO-sDE63XXaoZkTvbm2KIvhFTyOrds=" style="float:left;"></a>



	<a href="장애인시설검색창.jsp"><img src="https://media.istockphoto.com/photos/young-woman-with-spina-bifida-hispanic-friend-jogging-picture-id1130547036?k=6&m=1130547036&s=612x612&w=0&h=3Y5mB_w7Rb7meDcipZVONm4jRoYtf_1r-sxghN26OlI="  style="float:right;"></a>


	<a href="테니스검색창.jsp"><img src="https://media.istockphoto.com/photos/tennis-player-backhand-picture-id143177209?k=6&m=143177209&s=612x612&w=0&h=S7dYg_ArMwfDItbWlf8_C2ushjxNc8_9u5n-nKFZUw4="style="float:left;"></a>


	<a href="야구검색창.jsp"><img src="https://www.wallpapertip.com/wmimgs/51-511644_baseball-america-computer-desktop-wallpapers-pictures-baseball-player.jpg" style="float:right" ></a>


	<a href="육상검색창.jsp"><img src="https://media.istockphoto.com/photos/sprinter-running-on-track-picture-id866702538?k=6&m=866702538&s=612x612&w=0&h=uZQ5QQcql5WPnAKQnNo1WRCq5H8NyhdPGY3fxJJHPcg="style="float:left; "></a>


</body>
</html>