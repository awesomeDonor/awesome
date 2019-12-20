<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko-kr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!--Bootstrap-->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/kfonts2.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/headerStyle2.css" />"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/myPageMenuStyle.css" />"/>
   <style>
    @font-face { 
	font-family: 'S-CoreDream-5Medium'; 
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff') format('woff'); 
	font-weight: 100; 
	font-style: normal; 
	}

   body {
   		background-image: url("${pageContext.request.contextPath}/resources/img/배경.jpg");
   		font-family: 'S-CoreDream-5Medium'; 
		}
   #tablebox{
   overflow:scroll;
   }
   </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->


    <title>예약 신청 현황 </title>
   
    
  </head>
  <body>
   <div class="container">

    <jsp:include page="../header2.jsp"></jsp:include>
	<div class="row">
            <jsp:include page="../receiverMyPageMenu.jsp"></jsp:include>
            <div class="col-9" id="right">
	            <div id="upborder" style=" margin: 30px 0px 0px 0px; width: 850px; height: 20px; border-radius: 5px 5px 0px 0px; background-color:#B4A8A1;"></div>
	            <div id="designBorder" style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 850px; height: 500px; border: 4px solid #B4A8A1; ">  
	            <div id="tablebox" style="width: 800px; height: 450px; margin: 25px 10px 10px 25px;">
	            <div class="col text-center"><h4 style="color:#736663;">예약 신청 현황</h4></div>
	           	<div class = col id = wrapper style = "width : 100%; height : 420px; overflow:scroll;">
	            <table class="table table-sm" style="font-size: 12px; color:#736663; text-align: center;">
	                <thead style=" background-color: #80716817">
	                    <tr>
	                    <th scope="col" style="font-size: 13px; color:#736663;">신청 물품</th>
	                    <th scope="col" style="font-size: 13px; color:#736663;">수량</th>
	                    <th scope="col" style="font-size: 13px; color:#736663;">&nbsp;신청날짜&nbsp;</th>
	                    <th scope="col" style="font-size: 13px; color:#736663;">들어온 후원예약 신청 건수</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:forEach items="${boardData }" var="boardData">
							<tr>
							<th scope = row>${boardData.dto_Donation_Request.stuff_MinorCategory_entry }</th>
							<td>${boardData.dto_Donation_Request.donation_Request_amount }</td>
							<td>${boardData.dto_Donation_Request.donation_Request_writeDate}</td>
							<td><a href = "./readDonorList?Donation_Request_idx=${boardData.dto_Donation_Request.donation_Request_idx}">${boardData.countDonation } 건</a></td>
							
							</tr>
						</c:forEach>	
	
	                </tbody>
	            </table>
	            </div>
	            </div>
	            </div>
	        </div>
	    <div class="col-1"></div>
        
        </div>
    <footer id="footer" style="position: fixed; bottom: 1%; left: 37%; text-align: center; font-size: 11px; color: #A6A6AC;"> TEL:02-561-1911 / FAX:02-538-2613 </br>

	© Copyright 2019 CHOONGANG INSTITUTE, All Rights Reserved. </br> </br>
	<a href="https://www.facebook.com/"><img src="${pageContext.request.contextPath}/resources/img/facebook.png" style="height: 20px; width: 20px;"></a>
	<a href="https://www.instagram.com/"><img src="${pageContext.request.contextPath}/resources/img/insta.png" style="height: 20px; width: 20px;"></a>
	<a href="https://twitter.com/"><img src="${pageContext.request.contextPath}/resources/img/twitter.png" style="height: 20px; width: 20px;"></a>
	</footer>
    </div>
            
                <%-- <div class="row" id="rightBar">
                    <div class="col text-center"><h4>예약 신청 현황</h4></div>
                
				   <table class = table>
				    	<tr><th scope = col>신청 물품</th><th scope = col>수량</th><th scope = col>신청날짜</th> <th scope = col>들어온 후원예약 신청 건수</th>  </tr>
							<c:forEach items="${boardData }" var="boardData">
								<tr>
									<th scope = row>${boardData.dto_Donation_Request.stuff_MinorCategory_entry }</th><!-- 신청 물품 -->
									<td>${boardData.dto_Donation_Request.donation_Request_amount }</td> <!-- 수량 --><!-- 이하 수정해야함. -->
									<td>${boardData.dto_Donation_Request.donation_Request_writeDate}</td><!-- 신청날짜 -->
									<td><a href = "./readDonorList?Donation_Request_idx=${boardData.dto_Donation_Request.donation_Request_idx}">${boardData.countDonation } 건</a></td><!-- 들어온 후원예약 신청 건수 -->
									</tr>
							</c:forEach>			
					</table>
               
            </div> --%>

	
    
    

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>