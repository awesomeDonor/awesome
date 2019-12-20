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
    @font-face { font-family: 'S-CoreDream-5Medium'; 
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff') format('woff'); 
    font-weight: normal; font-style: normal; }
    
   body {
   		background-image: url("${pageContext.request.contextPath}/resources/img/배경.jpg");
   		font-family:'S-CoreDream-5Medium';
		}
	.sideMenu{
		position:absolute; 
		top:10%;
	}
	
	#tag{
		width:992px; 
		height:50px;
		background-color: rgb(219, 207, 203);
		text-align: center;
	}
	
	#tag h5{
	position:relative;
	top:30%;
	color:#736663
	}
	
   </style>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/headerStyle2.css" />"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->


    <title>개인 정보 </title>
	<script>
	 function value_submit(){
         
		 console.log("aaa");

         var frm1 = document.getElementById("f1");

         console.log(frm1);
         //1.값 담을 배열 선언...

         var param_index = 0;
         var param_names = [];
         var param_values = [];


         //2.check된 줄에서만 키,값 가져오기...                
			if(frm1.elements[0].checked == false){
				alert("기부 항목에 체크를 해주세요!!");
				return;
			}
         
         for(i = 0 ; i < frm1.elements.length ; i++){
             
             //계산 잘 할 것...폼에 첫번째 인풋이 체크박스라는 가정하에...
             
             if(frm1.elements[i].checked == true && frm1.elements[i].type == "checkbox"){
                 //체크 박스 값이 의미가 있으면 넣어 주고 아니면 패스...
                 param_names[param_index] = frm1.elements[i].name;
                 param_values[param_index] = frm1.elements[i].value;
                 param_index++;

                 //아래 UI 순서상 다음 폼 요소가 텍스트 박스임으로.. i++
                 if( !frm1.elements[i+1].value||!frm1.elements[i+2].value){
                     alert('폼을 완성해주세요!!');
                     return;
                 }
                 
                 i++;
                 param_names[param_index] = frm1.elements[i].name;
                 param_values[param_index] = frm1.elements[i].value;
                 
        		 //전화번호 정규식으로 체크 11.11 추가
        		 var regEx =  /^[0-9]*$/;		 
        		 var regResult = regEx.test(param_values[param_index]);
                 if(!regResult){
                	 alert("전화번호를 잘못 입력하셨습니다.");
                	 frm1.elements[i].focus();
                	 return;
                 }
                 
                 param_index++;

                 //그 다음 폼 요소 ... i++
                 i++;
                 param_names[param_index] = frm1.elements[i].name;
                 param_values[param_index] = frm1.elements[i].value;
				 
                 //날짜 유효성 검사
                 
                 var date = document.getElementsByName(param_names[param_index]);
                 if(date == null){
					alert("날짜를 입력해 주십시오");
					frm1.elements[i].focus();
                	return;
				 }	
                 	
                 param_index++;
             }
         }

         //3.임의의 form 만들어서 배열에서 키,값 가져와서 다시 세팅 및 서브밋
         var submitForm = document.createElement("form");
         //폼 값 설정...
         submitForm.setAttribute("charset","UTF-8");
         submitForm.setAttribute("method","get"); //get,post ... (test)테스트 결과 URL에 보이기 위해 get 방식 사용했음
         submitForm.setAttribute("action","./selectionProcess");

         //전달할 키,값들 임의의 폼에 입력 양식 hidden으로 추가..
         for(i = 0 ; i < param_index ; i++){
             var hiddenField = document.createElement("input");

             hiddenField.setAttribute("type","hidden");
             hiddenField.setAttribute("name",param_names[i]);
             hiddenField.setAttribute("value",param_values[i]);

             submitForm.appendChild(hiddenField);
         }

         //4.임의로 만든 폼 body에 추가 후 submit
         document.body.appendChild(submitForm);

         submitForm.submit();
         //modal로 만든 다음에 이걸 실행되도록 만들기. 

     }
	 

	</script>
   
    
  </head>
  <body>
    <div class="container">
   <jsp:include page="../header2.jsp"></jsp:include>
   <div class = row>
   		<div class = "col-2">
   			<div class="list-group sideMenu">
                <a href="./personalInfo" class="list-group-item list-group-item-action" style="background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg'); color:#736663;" >개인정보 관리</a>
                <a href="./likeReceiverPage" class="list-group-item list-group-item-action" style="background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg'); color:#736663;">관심기관</a>
                <a href="./selectionPage" class="list-group-item list-group-item-action" style="background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg'); color:#736663;">찜하기</a>
                <a href="./donationLog" class="list-group-item list-group-item-action" style="background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg'); color:#736663;">후원내역</a>
            </div>
   		</div>
   		<div class="col-8">
		<div id="upborder" style=" margin: 30px 0px 0px 0px; width: 1000px; height: 20px; border-radius: 5px 5px 0px 0px; background-color:#B4A8A1;"></div>
            <div id="designBorder" style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 1000px; height: 750px; border: 4px solid #B4A8A1; ">  
            <div id="tablebox" style="width: 992px; height: 650px; margin: 0px 0px 0px 0px;">
            	<div  id ="tag"><h5>찜하기</h5></div>
            	<div style="height:300px;">
            	<table class="table overflow-auto" style="font-size: 12px; color:#736663;  text-align: center;">
                        <thead style=" background-color: #80716817">
                            <tr>
                                <th scope="col" style="font-size: 12px; color:#736663; width:10%;">구분</th>
                                <th scope="col" style="font-size: 12px; color:#736663;width:10%;">기관명</th>
                                <th scope="col" style="font-size: 12px; color:#736663;width:10%;">물품명</th>
                                <th scope="col" style="font-size: 12px; color:#736663;width:10%;">수량</th>
                                <th scope="col" style="font-size: 12px; color:#736663;">기관주소</th>
                                <th scope="col" style="font-size: 12px; color:#736663;">이용가능 연락처</th>
                                <th scope="col" style="font-size: 12px; color:#736663;">후원예정일</th>
                                <th scope="col" style="font-size: 12px; padding-right:7px; color:#736663;">예약취소</th>
                            </tr>
                        </thead>
                       		 <tbody>
	                            <c:if test="${!empty selectionBoardData }">
	                             <form id="f1">
		                           <c:forEach items="${selectionBoardData }" var="selectionBoardData">
										<tr>
											<th scope = row style="position:absolute; left:9%;"><input class="form-check-input" type="checkbox" name = Donation_Request_idx value="${selectionBoardData.dto_Donation_Request.donation_Request_idx }" id="defaultCheck1"></th><!-- 체크박스 -->
											<td>${selectionBoardData.dto_Receiver.member_Receiver_name }</td> <!-- 기관 --><!-- 이하 수정해야함. -->
											<td>${selectionBoardData.dto_Donation_Request.stuff_MinorCategory_entry}</td><!-- 물품명 -->
											<td>${selectionBoardData.dto_Donation_Request.donation_Request_amount }</td><!-- 수량 -->
											<td>${selectionBoardData.dto_Receiver.member_Receiver_AdCategory } ${selectionBoardData.dto_Receiver.member_Receiver_adDetail }</td> <!-- 주소대분류+주소소분 -->
											<td><input type = "text" name = Donation_Action_contactNumber class="form-control" placeholder= "'-'를 빼고 입력하세요"></td>	<!-- 이용가능 연락 -->
											<td><input type = "date" name = Donation_Action_meetingDate class="form-c ontrol" placeholder="년-월-일"></td>	<!-- 체크박스 -->
											<td><a class="btn btn-primary" href="./selectionDelete?Donation_Request_idx=${selectionBoardData.dto_Donation_Request.donation_Request_idx }" role="button">❤︎︎</a></td>	
										</tr>
									</c:forEach>
	                                </form>
								</c:if>
                        	</tbody>
                    </table>
                    </div>
                    
                    <hr style="margin-top:0px; margin-bottom:5px;">
                    <input type="button" value="예약신청" style="position:relative; left:90%;" onclick="value_submit()">
					<hr style="margin-bottom:0px; margin-top:5px;">
				
				<!-- 이 밑은 신청 현황 테이블 -->
				<div  id ="tag"><h5>신청한 기부</h5></div>
				<div style="height:300px;">
                    <table class="table overflow-auto" style="font-size: 12px; color:#736663; text-align: center;">
                        <thead style=" background-color: #80716817">
                            <tr>
                                    <th scope="col" style="font-size: 13px; color:#736663;">기관명</th>
                                    <th scope="col" style="font-size: 13px; color:#736663;">물품명</th>
                                    <th scope="col" style="font-size: 13px; color:#736663;">수량</th>
                                    <th scope="col" style="font-size: 13px; color:#736663;">기관주소</th>
                                    <th scope="col" style="font-size: 13px; color:#736663;">이용가능 연락처</th>
                                    <th scope="col" style="font-size: 13px; color:#736663;">후원예정일</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:if test="${!empty boardData }">
	                        	<c:forEach items="${boardData }" var="selectionBoardData">
									<tr>
										<td scope = row>${selectionBoardData.dto_Receiver.member_Receiver_name }</td> <!-- 기관 --><!-- 이하 수정해야함. -->
										<td>${selectionBoardData.dto_Donation_Request.stuff_MinorCategory_entry}</td><!-- 물품명 -->
										<td>${selectionBoardData.dto_Donation_Request.donation_Request_amount }</td><!-- 수량 -->
										<td>${selectionBoardData.dto_Receiver.member_Receiver_AdCategory } ${selectionBoardData.dto_Receiver.member_Receiver_adDetail }</td> <!-- 주소대분류+주소소분 -->
										<td>${selectionBoardData.dto_Donation_Action.donation_Action_contactNumber}</td>
		                                <td>${selectionBoardData.dto_Donation_Action.donation_Action_meetingDate}</td>
									</tr>
								</c:forEach>	
	                        </c:if>
                        </tbody>
                    </table>
                    </div>
                    
            </div>
            </div>
            </div>
		</div>

    
    <footer id="footer" style="position: relative; bottom: 1%; left: 10%; text-align: center; font-size: 11px; color: #A6A6AC;"> TEL:02-561-1911 / FAX:02-538-2613 </br>

	© Copyright 2019 CHOONGANG INSTITUTE, All Rights Reserved. </br> </br>
	<a href="https://www.facebook.com/"><img src="${pageContext.request.contextPath}/resources/img/facebook.png" style="height: 20px; width: 20px;"></a>
	<a href="https://www.instagram.com/"><img src="${pageContext.request.contextPath}/resources/img/insta.png" style="height: 20px; width: 20px;"></a>
	<a href="https://twitter.com/"><img src="${pageContext.request.contextPath}/resources/img/twitter.png" style="height: 20px; width: 20px;"></a>
	</footer>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>