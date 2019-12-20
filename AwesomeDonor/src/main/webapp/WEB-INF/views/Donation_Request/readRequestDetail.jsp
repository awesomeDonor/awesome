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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/requestStyle.css" />"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->


    <title>필요해요 게시판 자세히보기</title>
    <script>
    function goBack(){
    	history.go(-1);
    }
    </script>
    
  </head>
<body style="height: 100%; margin: 0; padding: 0;">
 <div class="container">

   <jsp:include page="../header2.jsp"></jsp:include>
   <jsp:include page="../requestSearchBar.jsp"></jsp:include>
   <div class="row">
   <jsp:include page="../requestCategoryBar.jsp"></jsp:include>
    <div class="col-8">
		<div id="upborder" style=" margin: 30px 0px 0px 0px; width: 660px; height: 20px; border-radius: 5px 5px 0px 0px; background-color:#B4A8A1;"></div>
    	<div id="designBorder" style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 660px; background-color: #DBD7D0; height: 650px; border: 4px solid #B4A8A1; ">  
    		<div id="tablebox" style="width: 610px; height: 600px; margin: 25px 10px 10px 25px; text-align: left;">
    			<div class = "row">
    				<div class = "col-1"></div>
    				<div class = "col-4"><strong><h5>자세히보기</h5></strong></div>
    				<div class = "col-5"></div>
    				<div class = "col-2"><button class = "btn btn-secondary btn-sm" onclick = "goBack()" >목록</button></div>
    			</div>
    			<div class = "row">
    				<div class = col-1></div>
    				<div class = col-5>
    				<div class = row>
    					<div class = col-4>기관명</div>
    					<div class = col-8>
    						<div class="form-control" id="amount" placeholder="" disabled>
    							${boardData.dto_Receiver.member_Receiver_name }
    						</div>
    					</div>
    					
    				</div>	
    				</div>
    				<div class = col-5>
    				<div class = row>
    					<div class = col-5>기관분야</div>
    					<div class = col-7>
    						<div class="form-control" id="amount" placeholder="" disabled>
    							${boardData.dto_Receiver.member_Receiver_Category }
    						</div>
    					</div>
    				</div>
    				</div>
    				<div class = col-1></div>
    			</div>
    			<br>
    			<div class = "row">
					<div class = col-1></div>
    				<div class = col-2>주소 </div>
    				<div class = col-8> 
    					<div class="form-control" id="amount" placeholder="" disabled>
    					${boardData.dto_Receiver.member_Receiver_AdCategory }
    					</div>
    				</div>
    				<div class = col-1></div>
    			</div>
    			<div class = "row">
    				<div class = col-3></div>
    				<div class = col-8>
    					<div class="form-control" id="amount" placeholder="" disabled>
    					${boardData.dto_Receiver.member_Receiver_adDetail }
    					</div>
    				</div>
    				<div class = col-1></div>
    			</div>
    			<div class = "row">
					<div class = col-1></div>
    				<div class = col-2>홈페이지 </div>
    				<div class = col-8> 
    					<div class="form-control" id="amount" placeholder="" disabled>
    					${boardData.dto_Receiver.member_Receiver_websiteUrl }
    					</div>
    				</div>
    				<div class = col-1></div>
    			</div>
    			<br>
    			<div class = "row">
					<div class = col-1></div>
    				<div class = col-2>물품 </div>
    				<div class = col-8> 
    					<div class="form-control" id="amount" placeholder="" disabled>
    					${boardData.dto_Donation_Request.stuff_MajorCategory_entry } > ${boardData.dto_Donation_Request.stuff_MinorCategory_entry }
    					</div>
    				</div>
    				<div class = col-1></div>
    			</div>
				<div class = "row">
    				<div class = col-1></div>
    				<div class = col-2>수량</div>
    				<div class = col-4> 
    				<div class="form-control" id="amount" placeholder="" disabled>
    					${boardData.dto_Donation_Request.donation_Request_amount }
    				</div>
    				</div>
    				<div class = col-5></div>
    			</div>
				<div class = "row">
					<div class = col-1></div>
    				<div class = col-2>주차가능여부</div>
    				<div class = col-2> 
    				<div class = row>
    				<c:choose>
                                <c:when test="${boardData.dto_Donation_Request.member_Receiver_parkingSpace =='1' }">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" id="inlineCheckbox3" checked
                                            disabled>
                                        <label class="form-check-label" for="inlineCheckbox3">Y</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" id="inlineCheckbox3" disabled>
                                        <label class="form-check-label" for="inlineCheckbox3">N</label>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" id="inlineCheckbox3" disabled>
                                        <label class="form-check-label" for="inlineCheckbox3">Y</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" id="inlineCheckbox3" checked
                                            disabled>
                                        <label class="form-check-label" for="inlineCheckbox3">N</label>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                         </div>
    				</div>
    				<div class = col-7></div>
    			</div>
    			<div class = "row">
    				<div class = col-1></div>
    				<div class = col-2>후원진행상태</div>
    				<div class = col-3> 
    					<div class="form-control" id="amount" placeholder="" disabled>
    						${boardData.dto_Donation_Request.donation_Request_progress }
    					</div>
    				</div>
    				<div class = col-6></div>
    			</div>
    			<div class="row">
    				<div class="col-1"></div>
                    <label for="content" class="col-2 col-form-label">비고</label>
                    <div class="col-8" >
                          <textarea class="form-control" id="content" rows="4" placeholder="" disabled>${boardData.dto_Donation_Request.donation_Request_note }</textarea>
                    </div>
                    <div class = col-1></div>
                </div>
				<br>
				
				<c:if test="${boardData.dto_Donation_Request.member_Receiver_idx == sessionData.session_Receiver.sessionIdx }">
                       <div class = row>
							<div class = col-8></div>
							<div class = col-2><a class="btn btn-success" href="./updateRequest_Page?Donation_Request_idx=${boardData.dto_Donation_Request.donation_Request_idx }">수정</a></div>
							<div class = col-2> <a class="btn btn-danger" href="./deleteARequest?Donation_Request_idx=${boardData.dto_Donation_Request.donation_Request_idx }">삭제</a></div><!-- 나중에 confirm 코드를 넣을 수 있을 것임. -->
							
						</div>
                </c:if>
						
    			</div>
    			</div>
    		</div>
    		<div class = col-2></div>
    	</div>
    
    <footer id="footer" style="position: fixed; bottom: 1%; left: 37%; text-align: center; font-size: 11px; color: #A6A6AC;"> TEL:02-561-1911 / FAX:02-538-2613 </br>

	© Copyright 2019 CHOONGANG INSTITUTE, All Rights Reserved. </br> </br>
	<a href="https://www.facebook.com/"><img src="${pageContext.request.contextPath}/resources/img/facebook.png" style="height: 20px; width: 20px;"></a>
	<a href="https://www.instagram.com/"><img src="${pageContext.request.contextPath}/resources/img/insta.png" style="height: 20px; width: 20px;"></a>
	<a href="https://twitter.com/"><img src="${pageContext.request.contextPath}/resources/img/twitter.png" style="height: 20px; width: 20px;"></a>
	</footer>
    </div>
	


	
    

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>