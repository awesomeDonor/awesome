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
	#formframe {
     
    width: 768px; 
    height: 532px;
    background-color: #DBD7D0;
    border-radius: 5px 5px 5px 5px;


	}
   </style>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/headerStyle2.css" />"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->


    <title>평가 작성 페이지 </title>
   
    
  </head>
  <body>
    <div class="container">
   <jsp:include page="../header2.jsp"></jsp:include>
    <div class="row">
    <jsp:include page="../receiverMyPageMenu.jsp"></jsp:include>
            <div class="col-9" id="right">
			    <form action="./writeEvaluation_Process" method="GET">
			        <div id="formframe">
			                <div class="row">
			                    <div class="col">
			                        <p style="text-align: center; color:#807168; font-size: 18px; margin: 20px 0px 20px 0px;">후원자님의 후원에 만족하셨나요?</br>후원 과정에 대한 전반적인 만족도를 평가해주세요!</p>
			                    </div>
			                </div>
			
			                <!--후원 점수 데이터_5점척도-->
			                <div class="row">
			                    <div class="col">
			                        <div class="form-group" style="width: 580px; align-content: center; margin: 0px 0px 20px 160px;">
			                            <div class="form-check form-check-inline">
			                                <input class="form-check-input" type="radio" name="Donor_Evaluation_starNumber" id="inlineRadio1" value="1">
			                                <label class="form-check-label" for="inlineRadio1" style="font-size: 15px; color: #736663;">매우 불만족</label>
			                            </div>
			                                <div class="form-check form-check-inline">
			                                    <input class="form-check-input" type="radio" name="Donor_Evaluation_starNumber" id="inlineRadio2" value="2">
			                                    <label class="form-check-label" for="inlineRadio2" style="font-size: 15px; color: #736663;">약간 불만족</label>
			                                </div>
			                                <div class="form-check form-check-inline">
			                                    <input class="form-check-input" type="radio" name="Donor_Evaluation_starNumber" id="inlineRadio3" value="3">
			                                    <label class="form-check-label" for="inlineRadio3" style="font-size: 15px; color: #736663;">보통</label>
			                                </div>     
			                                <div class="form-check form-check-inline">
			                                    <input class="form-check-input" type="radio" name="Donor_Evaluation_starNumber" id="inlineRadio4" value="4">
			                                    <label class="form-check-label" for="inlineRadio4" style="font-size: 15px; color: #736663;">약간 만족</label>
			                                </div>    
			                                <div class="form-check form-check-inline">
			                                    <input class="form-check-input" type="radio" name="Donor_Evaluation_starNumber" id="inlineRadio5" value="5">
			                                    <label class="form-check-label" for="inlineRadio5" style="font-size: 15px; color: #736663;">매우 만족</label>
			                                </div>                             
			                        </div>
			                    </div>
			                </div>
			
			                <!--비고 텍스트 작성-->
			                <div class="row">
			                    <div class="col">
			                        <div class="form-group" style="margin: 0px 30px 20px 30px;">
			                            <textarea placeholder="구체적인 후기를 적어주세요 :D" class="form-control" name = Donor_Evaluation_note id="exampleFormControlTextarea1" rows="10" cols="50"></textarea>
			                        </div>
			                    </div>
			                </div>
			                <div class="row">
			                    <div class="col-4"></div>
			                    <div class="col-4"></div>
			                    <div class="col-4">
			                        <div class="form-group">
			                        <div class = row>
			                        <input type = hidden name = Donation_Action_idx value = "${donation_Action_idx}">
			                        <input type = hidden name = complete value = "${complete}">
			                       		<button type="submit" value="작성완료" class="btn btn-outline-secondary" style="float: right; margin: 0px 30px 0px 0px;">작성완료</button>
			                            <a href = "./closeWindow?Donation_Action_idx=${donation_Action_idx}&complete=${complete}" class="btn btn-outline-secondary">창 닫기</a>
			                        </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			    </form> 
	        </div>
	    	<div class="col-1"></div>

	</div><!-- row와 이어지는 부분.  -->
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