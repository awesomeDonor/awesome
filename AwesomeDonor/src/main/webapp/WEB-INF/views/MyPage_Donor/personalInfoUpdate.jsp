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
	.inputbox {
            width: 35%;
    }
    #form1{
    position:relative;
    left:10%;
    }    
	#form2{
	position:absolute; 
	top:10%; 
	left:70%;
	}
	#file{
		width:200px;
	}
	
	
   </style>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/headerStyle2.css" />"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->


    <title>개인 정보 </title>
	<script type="text/javascript">
	</script>
	<script src="<c:url value='/resources/js/DonorUpdate.js'/>"></script>
  
  </head>
  <body>
    <div class="container">
   <jsp:include page="../header2.jsp"></jsp:include>
   <div class = row>
   		<div class = "col-2">
   			<div class="list-group sideMenu">
                <a href="./personalInfo" class="list-group-item list-group-item-action" style="background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg'); color:#736663;">개인정보 관리</a>
                <a href="./likeReceiverPage" class="list-group-item list-group-item-action" style="background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg'); color:#736663;">관심기관</a>
                <a href="./selectionPage" class="list-group-item list-group-item-action" style="background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg'); color:#736663;">찜하기</a>
                <a href="./donationLog" class="list-group-item list-group-item-action" style="background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg'); color:#736663;">후원내역</a>
            </div>
   		</div>
   		<div class="col-8">
		<div id="upborder" style=" margin: 30px 0px 0px 0px; width: 850px; height: 20px; border-radius: 5px 5px 0px 0px; background-color:#B4A8A1;"></div>
            <div id="designBorder" style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 850px; height: 500px; border: 4px solid #B4A8A1; ">  
            <div id="tablebox" style="width: 800px; height: 450px; margin: 25px 10px 10px 25px;">
            	<form id="frm1" action="./personalInfoUpdateProcess" method="post">
            	<div id="form1">
                        <input type="hidden" name="Member_Donor_idx" value="${sessionData.session_Donor.sessionIdx }">
						
						<div class="input-group mb-2 inputbox">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">아이디</span>
                                </div>
                                <input type="text" class="form-control" value="${boardData.member_Donor_idEmail }" disabled>                                
                            </div>
						
						<div class="input-group mb-2 inputbox">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">이름</span>
                                </div>
                                <input type="text" class="form-control" value="${boardData.member_Donor_name }" disabled>                               
                            </div>
							<div class="input-group mb-2 inputbox">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">새 비밀번호</span>
                                </div>
                                <input type="password" class="form-control" id="newPw" name="Member_Donor_pw" value="">                              
                            </div>
					
							<div class="input-group mb-2 inputbox">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">비밀번호 확인</span>
                                </div>
                                <input type="password" class="form-control" id="confirmPw" value="">                              
                            </div>

							<div class="input-group mb-2 inputbox">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">전화번호</span>
                                </div>
                                <input type="text" class="form-control" name="Member_Donor_phoneNumber" value="${boardData.member_Donor_phoneNumber }">                              
                            </div>

							<div class="input-group mb-2 inputbox">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">상세 주소</span>
                                </div>
                                <input type="text" class="form-control" name="Member_Donor_address" value="${boardData.member_Donor_address }">                             
                            </div>

						<div class="input-group mb-2 inputbox">
						<div class="input-group-prepend">
                        <span class="input-group-text">인증 상태</span>
                        </div>

                            <c:choose>
                                <c:when test="${boardData.member_Donor_identified == 1 }">
                                    <input class="form-control w-25" type="hidden" name="Member_Donor_identified" value="1">
                                    <input type="text" class="form-control" value="인증됨" disabled>  	
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control w-25" type="hidden" name="Member_Donor_identified" value="0">
                                    <input type="text" class="form-control" value="미인증" disabled>  	
                                </c:otherwise>
                            </c:choose>
						</div>
                        <label>이메일 수신 여부</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="inlineCheckboxY"
                                    name="Member_Donor_advertiseAgreed" value="1">
                                <label class="form-check-label" for="inlineCheckboxY">Y</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="inlineCheckboxN"
                                    name="Member_Donor_advertiseAgreed" value="0">
                                <label class="form-check-label" for="inlineCheckboxN">N</label>
                            </div> 
                            </div>
                            </form>
                            </div>
                        </div>
                        

                        <input type="button" class="btn btn-primary updateButton" id="submitButton"
                            onclick="formCompletion()" value="수정" style="position:absolute; bottom:20%; left:75%;">
                            
                        <a class="btn btn-primary btn-md cancealButton" href="./personalInfoUpdateCancelProcess"
                            role="button" style="position:absolute; bottom:20%; left:85%;">취소하기</a>
                    
                    
                    <form action="./personalFileUpdate" method="get" id="form2">
                        <img src="${file.donor_File_Upload_linkName }">
                        <div class="form-group">
                            <label for="file" class="col-form-label">사진 수정</label>
                            <input type="file" class="form-control-file  id="file" name="file" value="파일선택 " 
                                multiple>
                        </div>
                    	</form>
            </div>
            </div>
            </div>

    <footer id="footer" style="position: fixed; bottom: 1%; left: 37%; text-align: center; font-size: 11px; color: #A6A6AC;"> TEL:02-561-1911 / FAX:02-538-2613 </br>

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