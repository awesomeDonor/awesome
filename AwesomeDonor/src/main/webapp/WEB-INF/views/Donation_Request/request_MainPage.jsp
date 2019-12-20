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
	<script>
function selectRequest(Donation_Request_idx, Donation_Request_progress){
		
		if(Donation_Request_progress==='후원진행중'){
			alert('이 요청은 진행 중이므로 더 이상 찜하기에 담을 수 없습니다!');
			return;
		}else if(Donation_Request_progress==='후원완료'){
			alert('이 요청에 대한 후원이 이 완료되었습니다!');
			return;
		}else{
			$.ajax({
				dataType : "json",
				type : "post",
				url : "./selectRequest",
				data : "Donation_Request_idx=" + Donation_Request_idx, //Url 매핑이 된 메소드에서 받는 변수
				success : function(result){ // result는 그 메소드에서의 return 값, 또는
					
					if(result == true){
						alert("해당 요청을 찜하기에 담았습니다!");
					}else{
						alert('이미 찜하기에 담겨있습니다!');
					}
					
				}
			}	
		);
		}
	}

	</script>

    <title>필요해요 게시판 메인페이지</title>
    <link href="'https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-9Black.woff'" rel="stylesheet">
    
  </head>
<body>
 <div class="container">

   <jsp:include page="../header2.jsp"></jsp:include>
   <jsp:include page="../requestSearchBar.jsp"></jsp:include>
   <div class="row">
   <jsp:include page="../requestCategoryBar.jsp"></jsp:include>
   		<div class="col-8">
	<div id="upborder" style=" margin: 30px 0px 0px 0px; width: 850px; height: 20px; border-radius: 5px 5px 0px 0px; background-color:#B4A8A1;"></div>
            <div id="designBorder" style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 850px; height: 500px; border: 4px solid #B4A8A1; ">  
            <div id="tablebox" style="width: 800px; height: 450px; margin: 25px 10px 10px 25px; overflow:scroll;">
            <table class="table table-sm" style="font-size: 12px; color:#736663; text-align: center;">
                <thead style=" background-color: #80716817">
                    <tr>
                    <th scope="col" style="font-size: 13px; color:#736663;">진행상태</th>
                    <th scope="col" style="font-size: 13px; color:#736663;">신청기관이름</th>
                    <th scope="col" style="font-size: 13px; color:#736663;">&nbsp;신청물품&nbsp;</th>
                    <th scope="col" style="font-size: 13px; color:#736663;">&nbsp;&nbsp;수량&nbsp;&nbsp;</th>
                    <th scope="col" style="font-size: 13px; color:#736663;">&nbsp;&nbsp;지역&nbsp;&nbsp;</th>
                    <th scope="col" style="font-size: 13px; color:#736663;">&nbsp;신청날짜&nbsp;</th>
                    
                    <c:if test="${!empty sessionData}">
                	<th scope="col" style="font-size: 13px; color:#736663;">&nbsp;자세히보기&nbsp;</th>
	                	<c:if test="${!empty sessionData.session_Donor}">
	                    	<th scope="col" style="font-size: 13px; color:#736663;">&nbsp;찜하기&nbsp;</th>
	                    </c:if>
                	</c:if>
                    
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${boardData }" var="boardData">
					<tr>
					<th scope = row>${boardData.dto_Donation_Request.donation_Request_progress }</th>
					<td>${boardData.dto_Receiver.member_Receiver_name}</td>
					<td>${boardData.dto_Donation_Request.stuff_MinorCategory_entry }</td>
					<td>${boardData.dto_Donation_Request.donation_Request_amount }</td>		
					<td>${boardData.dto_Receiver.member_Receiver_AdCategory }</td>	
					<td>${boardData.dto_Donation_Request.donation_Request_writeDate }</td>	
					<c:if test="${!empty sessionData}">
					<td><a href="./readRequestDetail?Donation_Request_idx=${boardData.dto_Donation_Request.donation_Request_idx }" style="font-size: 13px;" ><kbd style="background-color:#736663;">자세히보기</kbd></a></td>
	                	<c:if test="${!empty sessionData.session_Donor}">
                    		<td><button type="button" class="btn btn-info btn-sm" onclick="selectRequest('${boardData.dto_Donation_Request.donation_Request_idx}', '${boardData.dto_Donation_Request.donation_Request_progress }')">❤︎</button></td>
	                    </c:if>
                	</c:if>
					</tr>
                    </c:forEach>             
                  
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document" style="text-align: left; color:#403E38; font-size: 14px; ">
                                <div class="modal-content">
                                    <div class="modal-header" style="background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">
                                      <h5 class="modal-title" >자세히보기</h5>
                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                      </button>
                                    </div>
                                    <div class="modal-body">            
                                    <div class="row"><div class="col-sm-1" ></div>
                                      <label for="inputID" class="col-sm-2 col-form-label">ID</label>
                                      <div class="col-sm-8" >
                                         <div class="form-control" id="ID" placeholder="ID" disabled >아이디</div>
                                      </div>
                                      <div class="col"></div>
                                    </div>              
                                    <div class="row"><div class="col-1"></div>
                                      <label for="inputReceiverCategory" class="col-sm-2 col-form-label">분류</label>
                                      <div class="col-sm-8">
                                         <div class="form-control" id="ReceiverCategory" placeholder="ReceiverCategory" disabled>기관분류</div>
                                      </div>
                                      <div class="col"></div>
                                    </div>
                            <div class="row"><div class="col-1"></div>
                                  <label for="inputAddress" class="col-sm-2 col-form-label">Address</label>
                                  <div class="col-sm-8">
                                      <div class="form-control" id="Address" placeholder="주소" disabled>주소</div> 
                                  </div>
                                  <div class="col-1"></div>
                            </div>
                            <div class="row"><div class="col"></div>
                                  <label for="exampleInputHomePage" class="col-sm-2 col-form-label">HomePage</label>
                                  <div class="col-sm-8">
                                      <div class="form-control" id="HomePage" placeholder="홈페이지 주소" disabled>홈피주소</div> 
                                  </div>
                                  <div class="col"></div>
                            </div>
                            <div class="row"><div class="col"></div>
                                  <label for="물품" class="col-sm-2 col-form-label">물품</label>
                                  <div class="col-sm-8">
                                      <div class="form-control" id="물품" placeholder="물품" disabled>물품</div>  
                                  </div>
                                  <div class="col"></div>
                            </div>
                            <div class="row"><div class="col"></div>
                                  <label for="amount" class="col-sm-2 col-form-label">수량</label>
                                  <div class="col-sm-8">
                                      <div class="form-control" id="amount" placeholder="수량" disabled>수량</div>     
                                  </div>
                                  <div class="col"></div>
                            </div>
                        <div class="row">
                            <div class="col-1"></div>
                            <label for="ParkingAble" class="col-sm col-form-label">주차가능 여부</label>
                            <div class="col-1"></div>
                
                              <div class="col">
                                <input type="checkbox" class="form-check-input1" id="ParkingAble1" disabled>
                                <label class="form-check-label1" for="ParkingAble1">가능</label>
                                <input type="checkbox" class="form-check-input2" id="ParkingAble2" disabled>
                                <label class="form-check-label2" for="ParkingAble2">불가능</label>
                              </div>
                            <div class="col"></div>
                        </div>
                        <div class="row"><div class="col"></div>
                                  <label for="process" class="col-sm-2 col-form-label">진행상태</label>
                                  <div class="col-sm-8">
                                      <div class="form-control" id="process" placeholder="진행상태" disabled>진행상태</div>    
                                  </div>
                                  <div class="col"></div>
                            </div>
                            <div class="row"><div class="col-1"></div>
                                  <label for="content" class="col-sm-2 col-form-label">비고</label>
                                    <div class="col-sm-8" >
                                        <textarea class="form-control" id="content" rows="4" placeholder="비고" disabled></textarea>
                                    </div>
                                  </div>
                                  <div class="col"></div>
                            </div>
                                    <div class="modal-footer">  <!-- if 해서 글 작성자면 수정 삭제, doner면 예약버튼-->
                                      <button type="button" class="btn btn-secondary" data-dismiss="modal" style="font-size: 14px;">닫기</button>
                                      <c:if test="${!empty sessionData.session_Receiver}">
                                      <button type="button" class="btn btn-primary" style="font-size: 14px;">예약신청</button>
                                      </c:if>
                                      <c:if test="${'boardData.dto_Donation_Request.member_Receiver_idx' == 'sessionData.session_Receiver.sessionIdx' }">
                                                    <a href="./deleteContentAction?c_idx=${boardData.contentVo.c_idx }">삭제&nbsp;</a><!-- 이부분 수정해야함. -->
                                                    <a href="./updateContentPage?c_idx=${boardData.contentVo.c_idx }">수정</a>
                                      </c:if>
                                      <div class="row">
                                            <div class="col-10"></div>
                                            <div class="col" id="updateNdelete">   
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>     
                </tbody>
            </table>
            </div>
            </div>
            </div>
		
	</div><!-- row div 끝!! -->
	<div class="row">
        <div class="col-2"></div>
        <div class="col-2">
            <div style="height: 25px;">
            	<c:if test="${!empty sessionData.session_Receiver}">
                	<a href="./readMyRequest" class="btn btn-outline-secondary" style="font-size:12px;">내글보기</a>
                </c:if>
            </div>
        </div>
        <div class="col-5">
            
        </div>
        <div class="col-3">
            <div id="writesizing">
            	<c:if test="${!empty sessionData.session_Receiver}">
                	<a href="./registerRequest_Page" class="btn btn-outline-secondary" style="font-size:12px;">글쓰기</a>
                </c:if>
            </div>
        </div>       
    </div>
    <footer id="footer" style="position: fixed; bottom: 1%; left: 37%; text-align: center; font-size: 11px; color: #A6A6AC;"> TEL:02-561-1911 / FAX:02-538-2613 </br>

	© Copyright 2019 CHOONGANG INSTITUTE, All Rights Reserved. </br> </br>
	<a href="https://www.facebook.com/"><img src="${pageContext.request.contextPath}/resources/img/facebook.png" style="height: 20px; width: 20px;"></a>
	<a href="https://www.instagram.com/"><img src="${pageContext.request.contextPath}/resources/img/insta.png" style="height: 20px; width: 20px;"></a>
	<a href="https://twitter.com/"><img src="${pageContext.request.contextPath}/resources/img/twitter.png" style="height: 20px; width: 20px;"></a>
	</footer>
</div>




<!-- 	<h1>필요해요 게시판!!!</h1>
   		<table class = table>
			<tr><th scope = col>글 번호</th><th scope = col>진행상태</th> <th scope = col>신청기관 이름</th> <th scope = col>신청물품</th> 
			<th scope = col>수량</th> <th scope = col>지역</th> <th scope = col>신청날짜</th> <th scope = col>관심표시</th> <th scope = col>(빈칸)</th></tr>
			<c:forEach items="${boardData }" var="boardData">
				<tr>
					<th scope = row>${boardData.dto_Donation_Request.donation_Request_idx }</th>
					<td>${boardData.dto_Donation_Request.donation_Request_progress }</td>
					<td>${boardData.dto_Receiver.member_Receiver_name}</td>
					<td>${boardData.dto_Donation_Request.stuff_MinorCategory_entry }</td>
					<td>${boardData.dto_Donation_Request.donation_Request_amount }</td>		
					<td>${boardData.dto_Receiver.member_Receiver_AdCategory }</td>	
					<td>${boardData.dto_Donation_Request.donation_Request_writeDate }</td>	
					<td><button type="button" class="btn btn-info btn-sm" onclick="selectRequest('${boardData.dto_Donation_Request.donation_Request_idx}', '${boardData.dto_Donation_Request.donation_Request_progress }')">❤︎</button></td>
					<td><a class="btn btn-primary" href="./readRequestDetail_Page?Donation_Request_idx=${boardData.dto_Donation_Request.donation_Request_idx }" role="button">자세히 보기</a></td>	
				</tr>
			</c:forEach>			
		</table>
		
		<div class="row">
			<div class="col">
				<ul class="pagination">
					<li class="page-item"><button type="button" class="btn btn-info btn-sm" onclick="">Previous</button></li>
					<script>
					functionPaging();
					</script>
					<li class="page-item"><button type="button" class="btn btn-info btn-sm" onclick="">Next</button></li>
				</ul>
			</div>
		</div>  -->   	

    
    

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>