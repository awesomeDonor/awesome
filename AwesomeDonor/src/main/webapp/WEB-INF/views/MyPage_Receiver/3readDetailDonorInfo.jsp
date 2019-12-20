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
   </style>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/headerStyle2.css" />"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/myPageMenuStyle.css" />"/>
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->


    <title>자세히 보기 </title>
    <script>
    function goBack(){
    	history.go(-1);
    }
    </script>
    
  </head>
  <body>
    <div class="container">
    <jsp:include page="../header2.jsp"></jsp:include>
        <div class="row">
    <jsp:include page="../receiverMyPageMenu.jsp"></jsp:include>
            <div class="col-9" id="right">
				<div id="upborder" style=" margin: 30px 0px 0px 0px; width: 700px; height: 20px; border-radius: 5px 5px 0px 0px; background-color:#B4A8A1;"></div>
		    	<div id="designBorder" style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 700px; background-color: #DBD7D0; height: 650px; border: 4px solid #B4A8A1; ">  
		    		<div id="tablebox" style="width: 650px; height: 600px; margin: 25px 10px 10px 25px; text-align: left;">
		    			<div class = "row">
		    				<div class = "col-1"></div>
		    				<div class = "col-5"><strong><h5>회원정보 자세히보기</h5></strong></div>
		    				<div class = "col-4"></div>
    						<div class = "col-2"><button class = "btn btn-secondary btn-sm" onclick = "goBack()" >목록</button></div>
    					</div>
		    			<br>
		    			<div class = "row">
							<div class = col-1></div>
		    				<div class = col-2>아이디</div>
		    				<div class = col-6> 
		    					<div class="form-control" id="amount" placeholder="" disabled>
		    					${boardData.dto_Donor.member_Donor_idEmail }
		    					</div>
		    				</div>
		    				<div class = col-4></div>
		    			</div>
		    			<div class = "row">
		    				<div class = col-1></div>
		    				<div class = col-2>회원이름</div>
		    				<div class = col-4>
		    					<div class="form-control" id="amount" placeholder="" disabled>
		    					${boardData.dto_Donor.member_Donor_name }
		    					</div>
		    				</div>
		    				<div class = col-5></div>
		    			</div>
		    			<div class = "row">
							<div class = col-1></div>
		    				<div class = col-2>연락처 </div>
		    				<div class = col-6> 
		    					<div class="form-control" id="amount" placeholder="" disabled>
		    					${boardData.dto_Donation_Action.donation_Action_contactNumber }
		    					</div>
		    				</div>
		    				<div class = col-3></div>
		    			</div>
		    			<br>
		    			<div class = "row">
							<div class = col-1></div>
		    				<div class = col-3>방문가능날짜 </div>
		    				<div class = col-5> 
		    					<div class="form-control" id="amount" placeholder="" disabled>
		    					${boardData.dto_Donation_Action.donation_Action_meetingDate }
		    					</div>
		    				</div>
		    				<div class = col-3></div>
		    			</div>
		    			<br>
		    		<div class = row style="text-align:center;">
		    			<div class = col-4></div>
		    			<div class = col-4><h5>평가</h5></div>
		    			<div class = col-4></div>
		    		</div>
		    		<div class = "row">
    				<div class = col-2></div>
    				<div class = col-4>
    				<div class = row>
    					<div class = col-4>별점평균</div>
    					<div class = col-8>
    						<div class="form-control" id="amount" placeholder="" disabled>
    							${boardData.donor_StarNumber_AVG }
    						</div>
    					</div>
    					
    				</div>	
    				</div>
    				<div class = col-4>
    				<div class = row>
    					<div class = col-6>어썸지수</div>
    					<div class = col-6>
    						<div class="form-control" id="amount" placeholder="" disabled>
    							${boardData.awesomeIndex }
    						</div>
    					</div>
    				</div>
    				</div>
    				<div class = col-2></div>
    			</div>
					
		    			<div class="row">
		    				<div class="col-1"></div>
		                    <div class="col-10" style = "overflow:scroll; height: 200px; border: 1px dotted brown;" >
		                    <br>
								<c:forEach items="${boardData.donor_Evaluation }" var="boardData">
								별점: ${boardData.donor_Evaluation_starNumber}<br/> 
								평가: ${boardData.donor_Evaluation_note}<br/>
								<br/>
								</c:forEach>
		                         
		                    </div>
		                    <div class = col-1></div>
		                </div>
						<br>
						<div class="row">
		    				<div class="col-8"></div>
		                    
		                    <div class = col-4>
		                    	<a href = "./donationAceept_Process?Donation_Action_idx=${donation_Action_idx}" class="btn btn-outline-secondary">신청 수락</a>
		                    </div>
		                </div>
						<br>
								
		    			</div>
		    			</div>
	        </div>
	    	<div class="col-1"></div>

	</div><!-- row와 이어지는 부분.  -->
	<footer id="footer" style="position: fixed; bottom: 1%; left: 37%; text-align: center; font-size: 11px; color: #A6A6AC;"> TEL:02-561-1911 / FAX:02-538-2613 </br>

	© Copyright 2019 CHOONGANG INSTITUTE, All Rights Reserved. </br> </br>
	<a href="https://www.facebook.com/"><img src="${pageContext.request.contextPath}/resources/img/facebook.png" style="height: 20px; width: 20px;"></a>
	<a href="https://www.instagram.com/"><img src="${pageContext.request.contextPath}/resources/img/insta.png" style="height: 20px; width: 20px;"></a>
	<a href="https://twitter.com/"><img src="${pageContext.request.contextPath}/resources/img/twitter.png" style="height: 20px; width: 20px;"></a>
	</footer>
</div><!-- container와 연결되는 부분. -->
    
 <%--   <jsp:include page="../header2.jsp"></jsp:include>
   <h1>기부신청을 한 회원정보 자세히 보기</h1>
   회원 아이디:${boardData.dto_Donor.member_Donor_idEmail }<br>
   회원 이름:${boardData.dto_Donor.member_Donor_name }<br>
   회원 연락가능 번호:${boardData.dto_Donation_Action.donation_Action_contactNumber }<br>
   방문가능 날짜:${boardData.dto_Donation_Action.donation_Action_meetingDate }
   평가 : ${boardData.countEvaluation} 건 // 
   <c:forEach items="${boardData.donor_Evaluation }" var="boardData"><!-- 이렇게 해도 되는 것 맞나?? -->
   별점: ${boardData.donor_Evaluation_starNumber}<br>
   평가: ${boardData.donor_Evaluation_note}<br>
   -------------------------------------<br>
   
   </c:forEach>
  <a href = "./donationAceept_Process?Donation_Action_idx=${boardData.dto_Donation_Action.donation_Action_idx}" class="btn btn-secondary btn-sm">신청 수락</a>
  //<a href = "./readDonorList" class="btn btn-info btn-sm">창닫기</a>
   
    --%>

    
    

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>